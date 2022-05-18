//
//  CategoriesViewController.swift
//  bswearDegreeProject
//
//  Created by gleba on 15.05.2022.
//

import UIKit

class CategoriesViewController: UIViewController {
    let categoriesVM = CategoriesViewModel()
    var categories: Results?
    var keys = [String]()
    @IBOutlet var categoriesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesVM.getData(completition: {result in
            self.categories = result
            for i in self.categories!.keys.reversed(){
                self.keys.append(i)
            }
            self.categoriesTableView.reloadData()
        })
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let index = categoriesTableView.indexPath(for: cell){
            let key = self.keys[index.row]
            let model = categories?[key]?.subcategories
            if let vc = segue.destination as? SubCategoriesViewController, segue.identifier == "showSub"{
                vc.subCategories = model
            }
        }
    }
    
}
extension CategoriesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoriesTableViewCell
        let key = self.keys[indexPath.row]
        cell.categoryName.text = categories?[key]?.name
        DispatchQueue.main.async {
//            cell.categoryImage.image = self.parser.getImage(urlStr: self.categories?[key]?.iconImage ?? "")
        }
        return cell
    }
    
    
}
