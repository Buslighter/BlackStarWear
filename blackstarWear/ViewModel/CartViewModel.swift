//
//  CartViewModel.swift
//  bswearDegreeProject
//
//  Created by gleba on 15.05.2022.
//

import UIKit
import RealmSwift
class CartViewModel{
    func setBackButtonImage(navigationController:UINavigationController){
        navigationController.navigationBar.backIndicatorImage = UIImage(named: "multiply")
        navigationController.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "multiply-back")
        navigationController.navigationBar.tintColor = UIColor.gray
    }
    
    var realm = try! Realm()
    var realmResults: Results<CartRealmModel>{
        get{return realm.objects(CartRealmModel.self)}
    }
    func deleteRealm(id: Int,tableView: UITableView) -> UIAlertController{
        let items = realmResults
        let item = items[id]
        let alert = UIAlertController(title: nil, message: "Удалить товар из корзины?", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Да", style: .destructive){_ in
            try! self.realm.write{
                self.realm.delete(item)
            }
            self.realm.refresh()
            tableView.reloadData()
        }
        let cancelButton = UIAlertAction(title: "Нет", style: .cancel)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        alert.modalPresentationStyle = .popover
        return alert
    }
    func sumPrices() -> String{
     let items = realmResults
     var sum = 0
        for i in items{
            sum+=Int(Double(i.price ?? "0") ?? 0.0)
        }
        return makeRightPrice(price: "\(sum)")
    }
    
}
