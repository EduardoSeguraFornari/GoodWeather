//
//  WeatherDetailViewController.swift
//  GoodWeather
//
//  Created by Eduardo Fornari on 05/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    public static let segueIdentifier = String(describing: WeatherDetailViewController.self)

    public var weatherViewModel: WeatherViewModel?
    public var unit: Unit?

    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var temperatureMinLabel: UILabel!
    @IBOutlet private weak var temperatureMaxLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = weatherViewModel?.name
        if let unit = unit {
            if unit == .celsius {
                temperatureLabel.text = weatherViewModel?.temperature.current.fahrenheitToCelsius.formatAsDegree
                temperatureMinLabel.text = weatherViewModel?.temperature.min.fahrenheitToCelsius.formatAsDegree
                temperatureMaxLabel.text = weatherViewModel?.temperature.max.fahrenheitToCelsius.formatAsDegree
            } else {
                temperatureLabel.text = weatherViewModel?.temperature.current.formatAsDegree
                temperatureMinLabel.text = weatherViewModel?.temperature.min.formatAsDegree
                temperatureMaxLabel.text = weatherViewModel?.temperature.max.formatAsDegree
            }
        }
        
    }
}
