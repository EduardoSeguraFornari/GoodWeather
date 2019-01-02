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

    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

}
