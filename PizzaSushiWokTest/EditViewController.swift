//
//  EditViewController.swift
//  PizzaSushiWokTest
//
//  Created by Buba on 06.08.2023.
//

import UIKit

final class EditViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    
    var parametr = Parametrs.brand
    var car: Car?
    var placeholderText = ""
    
    weak var delegat: DetailViewControllerProtocol?
    
    private let dataManager = DataManager.shared
    private let dataStore = DataStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.placeholder = placeholderText
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        guard textField.text != "" else {
            Healper.shared.showAlert(
                viewController: self,
                title: "Enter the data"
            )
            return
        }
        guard let newParametr = textField.text else { return }
        guard let foundCar = dataStore.cars.first(where: { $0.id == car?.id
        }) else { return }
        
        switch parametr {
        case .brand:
            for (index,car) in dataStore.cars.enumerated() {
                if car.id == foundCar.id {
                    dataStore.cars[index] = dataManager.updateCar(
                        car: car,
                        parametr: .brand,
                        newParametr: newParametr
                    )
                }
            }
            delegat?.skipView()
        case .model:
            for (index,car) in dataStore.cars.enumerated() {
                if car.id == foundCar.id {
                    dataStore.cars[index] = dataManager.updateCar(
                        car: car,
                        parametr: .model,
                        newParametr: newParametr
                    )
                }
            }
            delegat?.skipView()
        case .price:
            guard let _ = Double(newParametr) else {
                Healper.shared.showAlert(
                    viewController: self,
                    title: "The price must not contain the letters"
                )
                return
            }
            
            for (index,car) in dataStore.cars.enumerated() {
                if car.id == foundCar.id {
                    dataStore.cars[index] = dataManager.updateCar(
                        car: car,
                        parametr: .price,
                        newParametr: newParametr
                    )
                }
            }
            delegat?.skipView()
        }
        dismiss(animated: true)
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true)
    }
}
