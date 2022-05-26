//
//  SubCategoriesViewController.swift
//  blackstarWear
//
//  Created by gleba on 17.05.2022.
//

import UIKit

class SubCategoriesViewController: UIViewController {
    var subCategories: [Subcategory]?
    @IBOutlet var subCategoriesTableView: UITableView!
    override func viewDidLoad() {
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
        return subCategories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryCell") as! SubCategoriesTableViewCell
        cell.subCategoryName.text = subCategories?[indexPath.row].name
        print(subCategories?[indexPath.row].name)
        return cell
    }
    
    
}
