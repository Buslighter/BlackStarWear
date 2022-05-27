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
        itemsVM.getData(id: id ?? "0", completition: { items in
            self.itemsResults = items
            self.itemsCollectionView.reloadData()
            for i in self.itemsResults!.keys{
                self.keys.append(i)
            }
            let urls = self.keys.map{"https://blackstarshop.ru/"+(self.itemsResults?[$0]?.mainImage ?? "0")}
            getImage(urls: urls, completition: { itemImages in
                self.itemImages = itemImages
                self.itemsCollectionView.reloadData()
            })
        })
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
        cell.priceLabel.text = itemsResults?[key]?.price
        cell.itemImage.image = itemImages[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let w = frameCV.width/2
        let h = frameCV.height/2
        
        return CGSize(width: w, height: h)
    }
    
    
}