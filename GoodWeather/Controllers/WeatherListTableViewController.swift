//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Eduardo Fornari on 02/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier,
                                                    for: indexPath) as? WeatherTableViewCell {
            cell.locationNameLabel.text = "Houston"
            cell.temperatureLabel.text = "70°"
            return cell
        }
        fatalError()
    }
}
