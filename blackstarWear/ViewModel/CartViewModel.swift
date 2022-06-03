//
//  CartViewModel.swift
//  bswearDegreeProject
//
//  Created by gleba on 15.05.2022.
//

import Foundation
import UIKit
class CartViewModel{
    func setBackButtonImage(navigationController:UINavigationController){
        navigationController.navigationBar.backIndicatorImage = UIImage(named: "multiply")
        navigationController.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "multiply-back")
        navigationController.navigationBar.tintColor = UIColor.gray
    }
}
