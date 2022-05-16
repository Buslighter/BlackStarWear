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
    override func viewDidLoad() {
        super.viewDidLoad()
        parser.getData(completition: {result in
            self.categories = result
            print(self.categories?["0"]?.name)
        })
        
    }
    


}
