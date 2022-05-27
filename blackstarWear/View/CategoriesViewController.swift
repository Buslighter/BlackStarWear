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
    var images = [UIImage]()
    @IBOutlet var categoriesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesVM.getData(completition: {result in
            self.categories = result
            for i in self.categories!.keys.reversed(){
                self.keys.append(i)
            }
            let urls = self.keys.map{"https://blackstarshop.ru/"+(self.categories?[$0]?.image ?? "0")}
            getImage(urls: urls , completition: {images in
                        self.images = images

                        DispatchQueue.main.async {
                        self.categoriesTableView.reloadData()
                        }
                    })
        })
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let index = categoriesTableView.indexPath(for: cell){
            let key = self.keys[index.row]
            let model = categories?[key]?.subcategories
            if let vc = segue.destination as? SubCategoriesViewController, segue.identifier == "showSub"{
                vc.subCategories = model
                let urls = categories?[key]?.subcategories.map{
                    var url = "errorHTTP"
                    if $0.iconImage != nil{
                    url = "https://blackstarshop.ru/"+$0.iconImage
                    } else{
                        url = "errorHTTP"
                    }
                    return url
                } ?? [""]
                vc.urls = urls
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
        cell.categoryImage.image = self.images[indexPath.row]
        return cell
    }
    
    
}
