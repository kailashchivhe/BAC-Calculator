//
//  Drink.swift
//  BAC Calculator
//
//  Created by Kailash Chivhe on 21/02/23.
//

import Foundation

class Drink{
    var drinkType: String?
    var drinkPercentage: Double?
    var drinkConsumption: Double?
    
    init(drinkType: String? = nil, drinkPercentage: Double? = nil, drinkConsumption: Double? = nil) {
        self.drinkType = drinkType
        self.drinkPercentage = drinkPercentage
        self.drinkConsumption = drinkConsumption
    }
    
}
