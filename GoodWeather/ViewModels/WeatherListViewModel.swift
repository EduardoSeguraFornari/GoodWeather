//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Eduardo Fornari  on 03/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import Foundation

 class WeatherListViewModel {
    public private(set) var weatherViewModels = [WeatherViewModel]()
    public var unit: Unit = .fahrenheit

    public func add(weatherViewModel: WeatherViewModel) {
        weatherViewModels.append(weatherViewModel)
    }

    public func numberOfRows(for section: Int) -> Int {
        return weatherViewModels.count
    }

    public func model(at index: Int, for section: Int = 0) -> WeatherViewModel {
        return weatherViewModels[index]
    }
 }

class Dynamic<T>: Codable where T: Codable {

    typealias Listener = (T) -> Void
    var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    // MARK: - Codable
    private enum CodingKeys: String, CodingKey {
        case value
    }

    // MARK: - Init
    init(_ value: T) {
        self.value = value
    }

    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(self.value)
    }

}

struct WeatherViewModel: Codable {
    let name: Dynamic<String>
    let temperature: TemperatureViewModel

    // MARK: - Codable
    private enum CodingKeys: String, CodingKey {
        case name
        case temperature = "main"
    }

    // MARK: - Init
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = Dynamic(try container.decode(String.self, forKey: .name))
        temperature = try container.decode(TemperatureViewModel.self, forKey: .temperature)
    }
 }

struct TemperatureViewModel: Codable {
    let current: Dynamic<Double>
    let max: Dynamic<Double>
    let min: Dynamic<Double>

    // MARK: - Codable
    private enum CodingKeys: String, CodingKey {
        case current = "temp"
        case max = "temp_max"
        case min = "temp_min"
    }

    // MARK: - Init
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        current = Dynamic(try container.decode(Double.self, forKey: .current))
        max = Dynamic(try container.decode(Double.self, forKey: .max))
        min = Dynamic(try container.decode(Double.self, forKey: .min))
    }
}
