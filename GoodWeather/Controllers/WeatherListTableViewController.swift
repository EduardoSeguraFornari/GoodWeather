//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Eduardo Fornari on 02/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController {

    private var weatherListViewModel = WeatherListViewModel()

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(for: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier,
                                                    for: indexPath) as? WeatherTableViewCell {
            let weatherViewModel = weatherListViewModel.model(at: indexPath.row)
            cell.configure(with: weatherViewModel)
            return cell
        }
        fatalError()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationController = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        guard let addLocationViewController = navigationController.viewControllers.first as?
            AddLocationViewController else {
            fatalError("AddLocationViewController not found")
        }
        addLocationViewController.delegate = self
    }
}

// MARK: - AddWeatherDelegate
extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(weatherViewModel: WeatherViewModel) {
        weatherListViewModel.add(weatherViewModel: weatherViewModel)
        tableView.reloadData()
    }
}
