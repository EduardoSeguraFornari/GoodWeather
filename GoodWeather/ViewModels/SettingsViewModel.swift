//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Eduardo Fornari  on 04/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        }
    }
}

struct SettingsViewModel {

    private let userDefaultsKey = "unit"

    let units = Unit.allCases

    private var _selectedUnit = Unit.fahrenheit
    var selectedUnit: Unit {
        mutating get {
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: userDefaultsKey) as? String {
                _selectedUnit =  Unit(rawValue: value) ?? .fahrenheit
            }
            return _selectedUnit
        } set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: userDefaultsKey)
        }
    }

}
