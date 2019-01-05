//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Eduardo Fornari  on 04/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import Foundation

extension Double {

    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }

    var fahrenheitToCelsius: Double {
        return (self - 32) * 5/9
    }
}
