//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Eduardo Fornari  on 03/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import Foundation

 struct WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()

    public mutating func add(weatherViewModel: WeatherViewModel) {
        weatherViewModels.append(weatherViewModel)
    }

    public func numberOfRows(for section: Int) -> Int {
        return weatherViewModels.count
    }

    public func model(at index: Int) -> WeatherViewModel{
        return weatherViewModels[index]
    }
 }

struct WeatherViewModel: Codable {
    let name: String
    let temperature: TemperatureViewModel

    private enum CodingKeys: String, CodingKey {
        case name
        case temperature = "main"
    }
 }

struct TemperatureViewModel: Codable {
    let current: Double
    let min: Double
    let max: Double

    private enum CodingKeys: String, CodingKey {
        case current = "temp"
        case min = "temp_min"
        case max = "temp_max"
    }
}
