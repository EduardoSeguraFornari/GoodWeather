//
//  WeatherTableViewCell.swift
//  GoodWeather
//
//  Created by Eduardo Fornari on 02/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    static let identifier = String(describing: WeatherTableViewCell.self)

    @IBOutlet private weak var locationNameLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!

    public func configure(with weatherViewModel: WeatherViewModel) {
        locationNameLabel.text = weatherViewModel.name
        temperatureLabel.text = weatherViewModel.temperature.current.formatAsDegree
    }
}
