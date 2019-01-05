//
//  AddLocationViewModel.swift
//  GoodWeather
//
//  Created by Eduardo Fornari on 04/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import Foundation

struct AddLocationViewModel {
    var city: String = ""
}

extension AddLocationViewModel {
    var isValid: Bool {
        return !city.isEmpty
    }
}
