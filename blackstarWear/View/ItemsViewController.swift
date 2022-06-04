//
//  ItemsViewController.swift
//  blackstarWear
//
//  Created by gleba on 17.05.2022.
//

import UIKit

class ItemsViewController: UIViewController {
    

    var itemsVM = ItemsViewModel()
    var itemsResults: ItemResults?
    var id: String?
    var keys = [String]()
    var itemImages = [UIImage]()
    @IBOutlet var itemsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsVM.getData(id: id ?? "53", completition: { items in
            self.itemsResults = items
            self.itemsCollectionView.reloadData()
            for i in self.itemsResults!.keys{
                self.keys.append(i)
            }
            let urls = self.keys.map{self.itemsResults?[$0]?.mainImage ?? "0"}
            getImage(urls: urls, completition: { itemImages in
                self.itemImages = itemImages
                self.itemsCollectionView.reloadData()
            })
        })
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell, let index = itemsCollectionView.indexPath(for: cell){
            let key = self.keys[index.row]
            let model = itemsResults?[key]
            var urls = [String]()
            for i in model!.productImages!{
                urls.append(i.imageURL ?? "")
            }
            if urls==[]{urls.append(model?.mainImage ?? "")}
            var sizes = [String]()
            for i in model!.offers!{
                sizes.append(i.size)
            }
            
            if let vc = segue.destination as? ItemInfoViewController, segue.identifier == "showItemInfoVC"{
                let infoItems = vc.infoItemsVM.itemsInfo
                vc.infoItemsVM.itemsInfo.price = model?.price
                infoItems.name = model?.name
                infoItems.colorName = model?.colorName
                infoItems.productImagesUrls = urls
                infoItems.description = model?.description
                infoItems.sizes = sizes
            }
        }
    }
    
    
}
extension ItemsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemImages.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ItemsCollectionViewCell
        let key = self.keys[indexPath.row]
        cell.descriptionLabel.text = itemsResults?[key]?.name
        cell.priceLabel.text = makeRightPrice(price: itemsResults?[key]?.price ?? "0.0")
        cell.itemImage.image = itemImages[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let w = frameCV.width/2
        let h = frameCV.height/2
        return CGSize(width: w-10, height: h-10)
    }
    
}
