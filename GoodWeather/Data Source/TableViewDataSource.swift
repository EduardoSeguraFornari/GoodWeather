//
//  TableViewDataSource.swift
//  GoodWeather
//
//  Created by Eduardo Fornari on 15/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {

    private let cellIdentifier: String
    private var items: [ViewModel]
    private let configureCell: (CellType, ViewModel) -> Void

    // MARK: - Init
    init(cellIdentifier: String, items: [ViewModel], configureCell: @escaping (CellType, ViewModel) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as? CellType else {
            fatalError("Cell with identifier \(cellIdentifier) not found")
        }
        let viewModel = items[indexPath.row]
        configureCell(cell, viewModel)
        return cell
    }

    public func updateItems(_ items: [ViewModel]) {
        self.items = items
    }
}
