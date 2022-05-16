//
//  CategoriesViewController.swift
//  bswearDegreeProject
//
//  Created by gleba on 15.05.2022.
//

import UIKit

class CategoriesViewController: UIViewController {
    let parser = CategoriesViewModel()
    var categories: Results?
    @IBOutlet var categoriesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        parser.getData(completition: {result in
            self.categories = result
            print(self.categories?["0"]?.name)
            self.categoriesTableView.reloadData()
        })
        
    }
    


}
extension CategoriesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoriesTableViewCell
//        let index = categories?.index(categories!.startIndex , offsetBy: indexPath.row)
//        cell.categoryName = categories![index]?.name
        print(type(of: categories))
//        cell.categoryName = categories[myKey].name
        return cell
    }
    
    
}
