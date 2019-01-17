//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Eduardo Fornari  on 04/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable, Codable {
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

class SettingsViewModel: Codable {

    static let userDefaultsKey = "SettingsViewModel"

    public static var shared: SettingsViewModel {
        let userDefaults = UserDefaults.standard
        if let data = userDefaults.object(forKey: SettingsViewModel.userDefaultsKey) as? Data {
            if let settingsViewModel = try? PropertyListDecoder().decode(SettingsViewModel.self, from: data) {
                return settingsViewModel
            }
        }
        return SettingsViewModel()
    }

    let units = Unit.allCases

    public var selectedUnit: Unit = .fahrenheit {
        didSet {
            updateUserDefaults()
        }
    }

    // MARK: - Codable
    private enum CodingKeys: String, CodingKey {
        case selectedUnit
    }

    // MARK: - Init
    private init() { }

    private func updateUserDefaults() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(try? PropertyListEncoder().encode(self),
                         forKey: SettingsViewModel.userDefaultsKey)
    }

}
