//
//  ItemsViewController.swift
//  blackstarWear
//
//  Created by gleba on 17.05.2022.
//

import UIKit

class ItemsViewController: UIViewController {
    var itemsVM = ItemsViewModel()
    var itemsResults: Items?
    var id: String?
    var keys = [String]()
    @IBOutlet var itemsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsVM.getData(id: id ?? "0", completition: { items in
            self.itemsResults = items
            self.itemsCollectionView.reloadData()
            for i in self.itemsResults!.items.keys{
                self.keys.append(i)
            }
        })
        print(id)
        print(itemsResults?.items.count)
    }

}
extension ItemsViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsResults?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ItemsCollectionViewCell
        let key = self.keys[indexPath.row]
        print(itemsResults?.items[key]?.name)
        
        return cell
    }
    
    
}
