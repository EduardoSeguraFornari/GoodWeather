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

    @IBAction private func saveButtonDidTapped(){
        
    }

    @IBAction private func cancelButtonDidTapped() {
        dismiss(animated: true)
    }

}
