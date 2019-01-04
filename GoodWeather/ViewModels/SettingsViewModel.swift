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

    let units = Unit.allCases

}
