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
 }

 struct WeatherViewModel  {
    let name: String
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
 }
