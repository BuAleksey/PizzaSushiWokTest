//
//  FilterTableViewController.swift
//  PizzaSushiWokTest
//
//  Created by Buba on 06.08.2023.
//

import UIKit

final class FilterTableViewController: UITableViewController {
    var cars: [Car] = []
    
    private var brands: [String] = []
    private var filteredBrands: [String] = []
    
    weak var delegate: MainTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brands = createListOfBrands(cars: cars)
    }
    
    @IBAction func doneBtnTapped(_ sender: Any) {
        delegate?.filtrationCar(brands: filteredBrands)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func trashBtnTapped(_ sender: Any) {
        delegate?.cancelingFiltering()
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        brands.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "FilterCell",
            for: indexPath
        )
        let brand = brands[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = brand
        cell.contentConfiguration = content
        cell.accessoryType = .none
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let brand = brands[indexPath.row]
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            filteredBrands.remove(at: indexPath.row)
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            filteredBrands.append(brand)
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    private func createListOfBrands(cars: [Car]) -> [String] {
        var brands: [String] = []
        for car in cars {
            if !brands.contains(car.brand) {
                brands.append(car.brand)
            }
        }
        return brands
    }
}
