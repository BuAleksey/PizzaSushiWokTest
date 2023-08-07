//
//  Healper.swift
//  PizzaSushiWokTest
//
//  Created by Buba on 07.08.2023.
//

import UIKit

final class Healper {
    static let shared = Healper()
    
    private init() {}
    
    func showAlert(viewController: UIViewController, title: String) {
        let alert = UIAlertController(
            title: title,
            message: nil,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        viewController.present(alert, animated: true)
    }
}
