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

    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var temperatureMinLabel: UILabel!
    @IBOutlet private weak var temperatureMaxLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setViewModelBindings()
    }

    private func setViewModelBindings() {
        if let weatherViewModel = self.weatherViewModel {
            weatherViewModel.name.bind { self.title = $0 }
            if SettingsViewModel.shared.selectedUnit == .celsius {
                weatherViewModel.temperature.current.bind {
                    self.temperatureLabel.text = $0.fahrenheitToCelsius.formatAsDegree
                }
                weatherViewModel.temperature.max.bind {
                    self.temperatureMaxLabel.text = $0.fahrenheitToCelsius.formatAsDegree
                }
                weatherViewModel.temperature.min.bind {
                    self.temperatureMinLabel.text = $0.fahrenheitToCelsius.formatAsDegree
                }
            } else {
                weatherViewModel.temperature.current.bind {
                    self.temperatureLabel.text = $0.formatAsDegree
                }
                weatherViewModel.temperature.max.bind {
                    self.temperatureMaxLabel.text = $0.formatAsDegree
                }
                weatherViewModel.temperature.min.bind {
                    self.temperatureMinLabel.text = $0.formatAsDegree
                }
            }
        }
    }
}
