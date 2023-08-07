//
//  DataStore.swift
//  PizzaSushiWokTest
//
//  Created by Buba on 05.08.2023.
//

import Foundation

final class DataStore {
    static let shared = DataStore()
    
    var cars = [
        Car(brand: "HAVAL", model: "M6", price: 1999999),
        Car(brand: "HAVAL", model: "DARGO", price: 2999000),
        Car(brand: "HAVAL", model: "JOLION", price: 1949000),
        
        Car(brand: "GEELY", model: "COOLRAY", price: 2400000),
        Car(brand: "GEELY", model: "MONJARO", price: 4999000),
        Car(brand: "GEELY", model: "TUGELLA", price: 2200999),
        
        Car(brand: "Changan", model: "CS85COUPE", price: 3709900),
        Car(brand: "Changan", model: "UNI-V", price: 2829900),
        Car(brand: "Changan", model: "HUNTERplus", price: 3429000)
    ]
    
    private init() {}
}
