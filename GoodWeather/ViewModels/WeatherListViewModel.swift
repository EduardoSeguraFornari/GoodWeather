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

    public func add(weatherViewModel: WeatherViewModel) {
        weatherViewModels.append(weatherViewModel)
    }

    public func model(at index: Int) -> WeatherViewModel {
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

struct WeatherViewModel: Codable, Equatable {
    let name: Dynamic<String>
    let temperature: TemperatureViewModel

    // MARK: - Codable
    private enum CodingKeys: String, CodingKey {
        case name
        case temperature = "main"
    }

    // MARK: - Init
    init(name: String, temperature: TemperatureViewModel) {
        self.name = Dynamic<String>(name)
        self.temperature = temperature
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = Dynamic(try container.decode(String.self, forKey: .name))
        temperature = try container.decode(TemperatureViewModel.self, forKey: .temperature)
    }

    // MARK: - Equatable
    static func == (lhs: WeatherViewModel, rhs: WeatherViewModel) -> Bool {
        return lhs.name.value == rhs.name.value &&
                lhs.temperature == rhs.temperature
    }
 }

struct TemperatureViewModel: Codable, Equatable {
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
    init(current: Double, max: Double, min: Double) {
        self.current = Dynamic<Double>(current)
        self.max = Dynamic<Double>(max)
        self.min = Dynamic<Double>(min)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        current = Dynamic(try container.decode(Double.self, forKey: .current))
        max = Dynamic(try container.decode(Double.self, forKey: .max))
        min = Dynamic(try container.decode(Double.self, forKey: .min))
    }

    // MARK: - Equatable
    static func == (lhs: TemperatureViewModel, rhs: TemperatureViewModel) -> Bool {
        return lhs.current.value == rhs.current.value &&
            lhs.max.value == rhs.max.value &&
            lhs.min.value == rhs.min.value
    }
}
