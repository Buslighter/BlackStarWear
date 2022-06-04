//
//  CategoriesViewModel.swift
//  bswearDegreeProject
//
//  Created by gleba on 15.05.2022.
//

import UIKit
//MARK: GET ARRAY OF UIIMAGES BY URLS
func getImage (urls:[String?], completition: @escaping ([UIImage]) -> Void){
    let images : [UIImage] = urls.map{
        var image = UIImage(systemName: "nosign")!
        let url = URL(string: "https://blackstarshop.ru/" + ($0 ?? "err"))
        if url != nil{
        if let data = try? Data(contentsOf: url ?? URL(string: "")!) {
            image = UIImage(data: data) ?? UIImage(systemName: "nosign")!
        }
        } else{
            image = UIImage(systemName: "nosign")!
        }
        return image
    }
    DispatchQueue.main.async {
        completition(images)
    }
}

class CategoriesViewModel{
    func getData(completition: @escaping (Results)->Void){
        var categoriesResults:Results?
        let url = URL(string:"https://blackstarshop.ru/index.php?route=api/v1/categories")
        let task = URLSession.shared.dataTask(with: url!){ (data,respone,error) in
            if error == nil && data != nil{
//                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
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
}

