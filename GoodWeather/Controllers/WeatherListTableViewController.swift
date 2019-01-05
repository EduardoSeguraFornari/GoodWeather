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
    private var settingsViewModel = SettingsViewModel()

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(for: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier,
                                                    for: indexPath) as? WeatherTableViewCell {
            let weatherViewModel = weatherListViewModel.model(at: indexPath.row)
            cell.configure(with: weatherViewModel, and: settingsViewModel.selectedUnit)
            return cell
        }
        fatalError()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherViewModel = weatherListViewModel.model(at: indexPath.row)
        performSegue(withIdentifier: WeatherDetailViewController.segueIdentifier, sender: weatherViewModel)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == AddLocationViewController.segueIdentifier {
            prepareSegueForAddLocationViewController(with: segue)
        } else if segue.identifier == SettingsTableViewController.segueIdentifier {
            prepareSegueForSettingsTableViewController(with: segue)
        } else if segue.identifier == WeatherDetailViewController.segueIdentifier {
            prepareSegueForWeatherDetailViewController(with: segue, and: sender)
        }
    }

    private func prepareSegueForAddLocationViewController(with segue: UIStoryboardSegue) {
        guard let navigationController = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        guard let addLocationViewController = navigationController.viewControllers.first as?
            AddLocationViewController else {
                fatalError("AddLocationViewController not found")
        }
        addLocationViewController.delegate = self
    }

    private func prepareSegueForSettingsTableViewController(with segue: UIStoryboardSegue) {
        guard let navigationController = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        guard let settingsTableViewController = navigationController.viewControllers.first as?
            SettingsTableViewController else {
                fatalError("SettingsTableViewController not found")
        }
        settingsTableViewController.delegate = self
    }

    private func prepareSegueForWeatherDetailViewController(with segue: UIStoryboardSegue, and sender: Any?) {
        guard let weatherDetailViewController = segue.destination as? WeatherDetailViewController,
            let weatherViewModel =  sender as? WeatherViewModel else {
                fatalError("WeatherDetailViewController not found")
        }
        weatherDetailViewController.weatherViewModel = weatherViewModel
        weatherDetailViewController.unit = settingsViewModel.selectedUnit
    }
}

// MARK: - AddWeatherDelegate
extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(weatherViewModel: WeatherViewModel) {
        weatherListViewModel.add(weatherViewModel: weatherViewModel)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - SettingsDelegate
extension WeatherListTableViewController: SettingsDelegate {
    func settingsDoneButtonDidTapped(settingsViewModel: SettingsViewModel) {
        self.settingsViewModel = settingsViewModel
        tableView.reloadData()
    }
}
