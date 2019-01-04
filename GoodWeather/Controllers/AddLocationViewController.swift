//
//  AddLocationViewController.swift
//  GoodWeather
//
//  Created by Eduardo Fornari on 02/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {

    @IBOutlet private weak var locationTextField: UITextField!

    @IBAction private func saveButtonDidTapped() {
        if let location = locationTextField.text {
            let urlString = "https://api.openweathermap.org/data/2.5/weather?" +
                            "q=\(location)" +
                            "&appid=f9e1e933016cf95809a531e8a4b032c8" +
                            "&units=imperial"
            if let weatherURL = URL(string: urlString) {
                let weatherResource = Resource<Any>(url: weatherURL) { data in
                    let weatherViewModel = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                    return weatherViewModel
                }
                Webservice().load(resource: weatherResource) { result in
                    
                }
            }
        }
    }

    @IBAction private func cancelButtonDidTapped() {
        dismiss(animated: true)
    }

}
