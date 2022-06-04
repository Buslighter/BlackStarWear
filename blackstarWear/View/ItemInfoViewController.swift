//
//  ItemInfoViewController.swift
//  blackstarWear
//
//  Created by gleba on 17.05.2022.
//

import UIKit

class ItemInfoViewController: UIViewController, CALayerDelegate {
    @IBOutlet var sizeView: UIView!
    let infoItemsVM = ItemsInfoVM()
    var images = [UIImage]()
    var indexPathForSelectedCell = IndexPath()
    var counter = 0
    @IBAction func chooseSize(_ sender: Any) {
        UIView.animate(withDuration: 0.3){
//            self.addToCartButton.layer.cornerRadius = self.infoItemsVM.roundButton(button: self.addToCartButton)
            self.blackoutScreen.alpha = 0.6
            self.sizeView.alpha = 0.97
            self.blackoutScreen.isHidden = false
            self.sizeView.isHidden = false
        }
    }
    @IBOutlet var imagesCollectionView: UICollectionView!
    @IBOutlet var chooseSizeButton: UIButton!
    @IBOutlet var itemStatsSelectionTableView: UITableView!
    @IBOutlet var blackoutScreen: UIView!
    @IBAction func addToCartAction(_ sender: Any) {
       let cell = itemStatsSelectionTableView.dequeueReusableCell(withIdentifier: "ItemInfoCell", for: indexPathForSelectedCell) as! ItemsInfoTableViewCell
        UIView.animate(withDuration: 0.3){
            self.blackoutScreen.alpha = 0
            self.sizeView.alpha = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
            self.blackoutScreen.isHidden = true
            self.sizeView.isHidden = true
        })
        indexPathForSelectedCell = IndexPath()
        itemStatsSelectionTableView.reloadData()
    }
    @IBAction func pageControl(_ sender: Any) {
        pageView.currentPage+=1
    }
    @IBOutlet var pageView: UIPageControl!
    @IBOutlet var itemDescription: UILabel!
    @IBOutlet var addToCartButton: UIButton!
    @IBOutlet var itemPrice: UILabel!
    @IBOutlet var itemName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesCollectionView.contentInsetAdjustmentBehavior = .never
        let model = infoItemsVM.itemsInfo
        getImage(urls: model.productImagesUrls ?? [""], completition: { images in
            self.images = images
            print(self.images.count)
            self.pageView.numberOfPages = images.count
            self.pageView.currentPage = 0
            self.imagesCollectionView.reloadData()
        })
        itemDescription.text = model.description
        itemName.text = model.name
        itemPrice.text = makeRightPrice(price: model.price ?? "0.0")

//        blackoutScreen.isHidden = true
//        chooseSizeButton.layer.cornerRadius = infoItemsVM.roundButton(button: chooseSizeButton)
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view == self.blackoutScreen{
            UIView.animate(withDuration: 0.3){
                self.blackoutScreen.alpha = 0
                self.sizeView.alpha = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
                self.blackoutScreen.isHidden = true
                self.sizeView.isHidden = true
            })
            indexPathForSelectedCell = IndexPath()
            itemStatsSelectionTableView.reloadData()
        }
    }
    
}
extension ItemInfoViewController: UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsInfoImageCell", for: indexPath) as! ItemsInfoImageCell
        cell.image.image = images[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        return CGSize(width: frameCV.width, height: frameCV.height)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoItemsVM.itemsInfo.sizes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemInfoCell", for: indexPath) as! ItemsInfoTableViewCell
        if indexPathForSelectedCell==indexPath{
                cell.checkMarkImage.alpha = 1.0
            }else{
                cell.checkMarkImage.alpha = 0.0
            }
        cell.sizeLabel.text = infoItemsVM.itemsInfo.sizes?[indexPath.row]
        cell.colorLabel.text = infoItemsVM.itemsInfo.colorName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.indexPathForSelectedCell = indexPath
        tableView.reloadData()
    }
}
