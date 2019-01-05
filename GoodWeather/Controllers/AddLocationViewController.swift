//
//  AddLocationViewController.swift
//  GoodWeather
//
//  Created by Eduardo Fornari on 02/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import UIKit

protocol AddWeatherDelegate: class {
    func addWeatherDidSave(weatherViewModel: WeatherViewModel)
}

class AddLocationViewController: UIViewController {

    public static let segueIdentifier = String(describing: AddLocationViewController.self)

    private var addLocationViewModel = AddLocationViewModel()

    @IBOutlet private weak var saveButton: UIBarButtonItem!

    @IBOutlet private weak var locationTextField: BindingTextField! {
        didSet {
            locationTextField.bind {
                self.addLocationViewModel.city = $0
                if self.addLocationViewModel.isValid {
                    self.saveButton.isEnabled = true
                } else {
                    self.saveButton.isEnabled = false
                }
            }
        }
    }

    public weak var delegate: AddWeatherDelegate?

    @IBAction private func saveButtonDidTapped() {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?" +
                        "q=\(addLocationViewModel.city)" +
                        "&appid=f9e1e933016cf95809a531e8a4b032c8" +
                        "&units=imperial"
        if let weatherURL = URL(string: urlString) {
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                let weatherViewModel = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherViewModel
            }
            Webservice().load(resource: weatherResource) { [weak self] result in
                if let weatherViewModel = result {
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(weatherViewModel: weatherViewModel)
                        self?.dismiss(animated: true)
                    }
                }
            }
        }
    }

    @IBAction private func cancelButtonDidTapped() {
        dismiss(animated: true)
    }

}
