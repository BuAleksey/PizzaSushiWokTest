//
//  DataManager.swift
//  PizzaSushiWokTest
//
//  Created by Buba on 06.08.2023.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func updateCar(car: Car, parametr: Parametrs, newParametr: String) -> Car {
        var updatedCar = car
        switch parametr {
        case .brand:
            updatedCar.brand = newParametr
        case .model:
            updatedCar.model = newParametr
        case .price:
            updatedCar.price = Double(newParametr) ?? 0
        }
        return updatedCar
    }
    
    func createCar(barnd: String, model: String, price: Double) -> Car {
        let car = Car(brand: barnd, model: model, price: price)
        return car
    }
}
