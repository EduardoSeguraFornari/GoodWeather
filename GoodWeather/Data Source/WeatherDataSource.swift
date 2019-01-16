//
//  WeatherDataSource.swift
//  GoodWeather
//
//  Created by Eduardo Fornari on 15/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import Foundation
import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {

    private let cellIdentifier = WeatherTableViewCell.identifier
    private var weatherListViewModel: WeatherListViewModel

    // MARK: - Init
    init(_ weatherListViewModel: WeatherListViewModel) {
        self.weatherListViewModel = weatherListViewModel
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(for: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as? WeatherTableViewCell else {
            fatalError("\(cellIdentifier) not found")
        }
        let weatherViewModel = weatherListViewModel.model(at: indexPath.row, for: indexPath.section)
        // TO-DO
        cell.configure(with: weatherViewModel, and: weatherListViewModel.unit)
        return cell
    }

}
