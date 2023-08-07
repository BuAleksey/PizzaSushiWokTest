//
//  DetailViewController.swift
//  PizzaSushiWokTest
//
//  Created by Buba on 05.08.2023.
//

import UIKit

enum Parametrs: String {
    case brand
    case model
    case price
}

protocol DetailViewControllerProtocol: AnyObject {
    func skipView()
}

final class DetailViewController: UIViewController {
    
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var modelLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    var car: Car? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brandLabel.text = car?.brand ?? ""
        modelLabel.text = car?.model ?? ""
        priceLabel.text = (String(car?.price ?? 0) + " ₽")
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BrandEdit" {
            guard let editVC = segue.destination as? EditViewController else { return }
            editVC.delegat = self
            editVC.parametr = .brand
            editVC.placeholderText = car?.brand ?? "nil"
            editVC.car = car
        }
        
        if segue.identifier == "ModelEdit" {
            guard let editVC = segue.destination as? EditViewController else { return }
            editVC.delegat = self
            editVC.parametr = .model
            editVC.placeholderText = car?.model ?? "nil"
            editVC.car = car
        }
        
        if segue.identifier == "PriceEdit" {
            guard let editVC = segue.destination as? EditViewController else { return }
            editVC.delegat = self
            editVC.parametr = .price
            editVC.placeholderText = String(car?.price ?? 0)
            editVC.car = car
        }
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func skipView() {
        navigationController?.popViewController(animated: true)
    }
}
