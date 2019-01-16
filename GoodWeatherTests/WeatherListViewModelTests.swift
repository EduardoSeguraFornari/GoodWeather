//
//  WeatherListViewModelTests.swift
//  GoodWeatherTests
//
//  Created by Eduardo Fornari on 16/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import XCTest
@testable import GoodWeather

class WeatherListViewModelTests: XCTestCase {

    private var weatherListViewModel: WeatherListViewModel?

    override func setUp() {
        super.setUp()
        weatherListViewModel = WeatherListViewModel()
    }

    override func tearDown() {
        super.tearDown()
        weatherListViewModel = WeatherListViewModel()
    }

    func testAddWeatherViewModelWhenTheListIsEmpty() {
        if let weatherListViewModel = weatherListViewModel {
            let firstTemperature = TemperatureViewModel(current: 30, max: 40, min: 20)
            let firstWeatherViewModel = WeatherViewModel(name: "Houston",
                                                         temperature: firstTemperature)
            weatherListViewModel.add(weatherViewModel: firstWeatherViewModel)
            XCTAssertEqual(weatherListViewModel.weatherViewModels.count, 1)
            XCTAssertEqual(weatherListViewModel.model(at: 0), firstWeatherViewModel)
        } else {
            XCTFail("weatherListViewModel is nil")
        }
    }

    func testAddWeatherViewModelWhenTheListIsNotEmpty() {
        if let weatherListViewModel = weatherListViewModel {
            let firstTemperature = TemperatureViewModel(current: 30, max: 40, min: 20)
            let firstWeatherViewModel = WeatherViewModel(name: "Houston",
                                                         temperature: firstTemperature)
            weatherListViewModel.add(weatherViewModel: firstWeatherViewModel)

            let secondTemperature = TemperatureViewModel(current: 50, max: 60, min: 40)
            let secondWeatherViewModel = WeatherViewModel(name: "Denver",
                                                          temperature: secondTemperature)
            weatherListViewModel.add(weatherViewModel: secondWeatherViewModel)
            XCTAssertEqual(weatherListViewModel.weatherViewModels.count, 2)
            XCTAssertEqual(weatherListViewModel.model(at: 0), firstWeatherViewModel)
            XCTAssertEqual(weatherListViewModel.model(at: 1), secondWeatherViewModel)
        } else {
            XCTFail("weatherListViewModel is nil")
        }
    }

}
