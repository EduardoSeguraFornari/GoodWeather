//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by Eduardo Fornari  on 04/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import UIKit

protocol SettingsDelegate: class {
    func settingsDoneButtonDidTapped(settingsViewModel: SettingsViewModel)
}
class SettingsTableViewController: UITableViewController {

    public static let segueIdentifier = String(describing: SettingsTableViewController.self)

    public weak var delegate: SettingsDelegate?

    private var settingsViewModel = SettingsViewModel()

    @IBAction private func doneButtonDidTapped() {
        if let delegate = delegate {
            delegate.settingsDoneButtonDidTapped(settingsViewModel: settingsViewModel)
            dismiss(animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.units.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingItem = settingsViewModel.units[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath)
        if settingsViewModel.selectedUnit == settingItem {
            cell.isSelected = true
            cell.accessoryType = .checkmark
        }
        cell.textLabel?.text = settingItem.displayName
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            // uncheck all cells
            tableView.visibleCells.forEach { cell in
                cell.accessoryType = .none
            }

            let unit = Unit.allCases[indexPath.row]
            settingsViewModel.selectedUnit = unit
            cell.accessoryType = .checkmark
        }
    }
}
