//
//  SettingsViewModelTests.swift
//  GoodWeatherTests
//
//  Created by Eduardo Fornari on 16/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import XCTest
@testable import GoodWeather

class SettingsViewModelTests: XCTestCase {

    private var settingsViewModel: SettingsViewModel?

    override func setUp() {
        super.setUp()
        settingsViewModel = SettingsViewModel()
    }

    override func tearDown() {
        super.tearDown()
        cleanUserDefaults()
    }

    func testShouldReturnCorrectDisplayNameForFahrenheit() {
        XCTAssertEqual(Unit.fahrenheit.displayName, "Fahrenheit")
    }

    func testShouldReturnCorrectDisplayNameForCelsius() {
        XCTAssertEqual(Unit.celsius.displayName, "Celsius")
    }

    func testSouldMakeSureThatDefaultSelectedUnitIsFahrenheit() {
        if let settingsViewModel = settingsViewModel {
            XCTAssertEqual(settingsViewModel.selectedUnit, .fahrenheit)
        } else {
            XCTFail("settingsViewModel is nil")
        }
    }

    func testShouldBeAbleToSaveUserUnitSelection() {
        let userDefaults = UserDefaults.standard
        settingsViewModel?.selectedUnit = .celsius
        XCTAssertNotNil(userDefaults.value(forKey: SettingsViewModel.userDefaultsKey))
    }

    func cleanUserDefaults() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
}
