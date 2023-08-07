//
//  MainTableViewController.swift
//  PizzaSushiWokTest
//
//  Created by Buba on 05.08.2023.
//

import UIKit

protocol MainTableViewControllerDelegate: AnyObject {
    func filtrationCar(brands: [String])
    func cancelingFiltering()
}

final class MainTableViewController: UITableViewController {
    @IBOutlet var sortingByPriceBtn: UIBarButtonItem!
    
    private let dataStore = DataStore.shared
    private let datdManager = DataManager.shared
    
    private var filteredCars: [Car] = []
    private var filterIsOn = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func cheapBtnTapped(_ sender: Any) {
        if sortingByPriceBtn.image == UIImage(systemName: "arrow.down") {
            dataStore.cars.sort { $0.price < $1.price }
            sortingByPriceBtn.image = UIImage(systemName: "arrow.up")
        } else {
            dataStore.cars.sort { $0.price > $1.price }
            sortingByPriceBtn.image = UIImage(systemName: "arrow.down")
        }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterIsOn ? filteredCars.count : dataStore.cars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Cell",
            for: indexPath
        )
        let car = filterIsOn ?
        filteredCars[indexPath.row] :
        dataStore.cars[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = car.brand
        content.secondaryText = car.model + " " + String(car.price) + " ₽"
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Filter" {
            guard let filterlVC = segue.destination as? FilterTableViewController else { return }
            filterlVC.cars = dataStore.cars
            filterlVC.delegate = self
        }
        
        if segue.identifier == "AddNewCar" {
            guard segue.destination is AddNewCarViewController else { return }
        }
        
        if segue.identifier == "Details" {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let car = filterIsOn
            ? filteredCars[indexPath.row]
            : dataStore.cars[indexPath.row]
            
            detailVC.car = car
        }
    }
}

extension MainTableViewController: MainTableViewControllerDelegate {
    func filtrationCar(brands: [String]) {
        filteredCars.removeAll()
        for car in dataStore.cars {
            if brands.contains(car.brand) {
                filteredCars.append(car)
            }
        }
        filterIsOn = true
    }
    
    func cancelingFiltering() {
        filterIsOn = false
    }
}
