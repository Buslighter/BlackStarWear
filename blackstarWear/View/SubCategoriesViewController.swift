//
//  SubCategoriesViewController.swift
//  blackstarWear
//
//  Created by gleba on 17.05.2022.
//

import UIKit

class SubCategoriesViewController: UIViewController {
    var subCategories: [Subcategory]?
    let subCategoriesVM = SubCategoriesViewModel()
    var urls = [String]()
    var subImages = [UIImage]()
    @IBOutlet var subCategoriesTableView: UITableView!
    override func viewDidLoad() {
        DispatchQueue.main.async {
        
            getImage(urls: self.urls, completition: { subImages in
            self.subImages = subImages
                
                self.subCategoriesTableView.reloadData()
                
        })
        }
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let index = subCategoriesTableView.indexPath(for: cell){
            let model = subCategories?[index.row]
            if let vc = segue.destination as? ItemsViewController, segue.identifier == "showItems"{
                vc.id = model?.id.stringValue ?? "0"
            }
        }
    }

}
extension SubCategoriesViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryCell") as! SubCategoriesTableViewCell
        cell.subCategoryName.text = subCategories?[indexPath.row].name
        cell.subImage.image = self.subImages[indexPath.row]
        return cell
    }
     
    
}
