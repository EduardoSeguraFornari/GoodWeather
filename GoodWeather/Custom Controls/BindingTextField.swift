//
//  BindingTextField.swift
//  GoodWeather
//
//  Created by Eduardo Fornari on 04/01/19.
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import UIKit

class BindingTextField: UITextField {

    var textChangeClosure: (String) -> Void = { _ in }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    func bind(callback: @escaping (String) -> Void) {
        self.textChangeClosure = callback
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            textChangeClosure(text)
        }
    }
}
