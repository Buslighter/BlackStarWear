//
//  SubCategoriesViewModel.swift
//  blackstarWear
//
//  Created by gleba on 17.05.2022.
//

import Foundation
//class SubCategoriesViewModel{
//    func getData(completition: @escaping (Results)->Void){
//        var categoriesResults:Results?
//        let url = URL(string:"https://blackstarshop.ru/index.php?route=api/v1/categories")
//        let task = URLSession.shared.dataTask(with: url!){ (data,respone,error) in
//            if error == nil && data != nil{
//                let decoder = JSONDecoder()
//                do{
//                    let res = try decoder.decode(Results.self, from: data!)
//                    categoriesResults = res
//                    print(categoriesResults?.count)
//                } catch{print("\(error)error happened")}
//            }
//            for (key,value) in categoriesResults!{
//                
//            }
//            
//            DispatchQueue.main.async {
//                completition(categoriesResults!)
//            }
//        }
//        task.resume()
//    }
//}
