//
//  AddNewCarViewController.swift
//  PizzaSushiWokTest
//
//  Created by Buba on 06.08.2023.
//

import UIKit

class AddNewCarViewController: UIViewController {
    @IBOutlet var brandTF: UITextField!
    @IBOutlet var modelTF: UITextField!
    @IBOutlet var priceTF: UITextField!
    
    private let dataStore = DataStore.shared
    private let dataManager = DataManager.shared
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        guard brandTF.text != "", modelTF.text != "", priceTF.text != "" else {
            Healper.shared.showAlert(
                viewController: self,
                title: "Enter the data"
            )
            return
        }
        guard let doublePrice = Double(priceTF.text!) else {
            Healper.shared.showAlert(
                viewController: self,
                title: "The price must not contain the letters"
            )
            return
        }
        guard let brand = brandTF.text, let model = modelTF.text else { return }
        
        dataStore.cars.append(dataManager.createCar(
            barnd: brand,
            model: model,
            price: doublePrice
        ))
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
