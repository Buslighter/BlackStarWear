//
//  CategoriesViewModel.swift
//  bswearDegreeProject
//
//  Created by gleba on 15.05.2022.
//

import Foundation
import UIKit
class CategoriesViewModel{
    func getData(completition: @escaping (Results)->Void){
        var categoriesResults:Results?
        let url = URL(string:"https://blackstarshop.ru/index.php?route=api/v1/categories")
        let task = URLSession.shared.dataTask(with: url!){ (data,respone,error) in
            if error == nil && data != nil{
                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                let decoder = JSONDecoder()
                do{
                    let res = try decoder.decode(Results.self, from: data!)
                    categoriesResults = res
                } catch{print("\(error)error happened")}
            }

            DispatchQueue.main.async {
                completition(categoriesResults ?? Results())
            }
        }
        task.resume()
    }
    func getImage (urls:[String?], completition: @escaping ([UIImage]) -> Void){
        let images : [UIImage] = urls.map{
            var image = UIImage()
            let url = URL(string: $0 ?? "errorHTTP")
            if let data = try? Data(contentsOf: url!) {
                image = UIImage(data: data) ?? UIImage()
            }
            return image
        }
        
        DispatchQueue.main.async {
            completition(images)
        }
    }
   
    
}

