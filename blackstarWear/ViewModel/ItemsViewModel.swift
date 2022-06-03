//
//  ItemsViewModel.swift
//  blackstarWear
//
//  Created by gleba on 20.05.2022.
//

import UIKit

func makeRightPrice(price: String) -> String{
    var rightPrice = String(Int(Double(price)!))
    rightPrice+=" ₽"
    return rightPrice
}
class ItemsViewModel{
    func getData(id: String,completition: @escaping (ItemResults)->Void){
        var itemsResults:ItemResults?
        let url = URL(string:"https://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(id)")
        let task = URLSession.shared.dataTask(with: url!){ (data,respone,error) in
            if error == nil && data != nil{
//                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                let decoder = JSONDecoder()
                do{
                    let res = try decoder.decode(ItemResults.self, from: data!)
                    itemsResults = res
                } catch{print("\(error)error happened")}
            }
            
            DispatchQueue.main.async {
                completition(itemsResults ?? ItemResults())
            }
        }
        task.resume()
    }

}
