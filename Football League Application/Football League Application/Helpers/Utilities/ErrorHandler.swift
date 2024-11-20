//
//  ErrorHandler.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import UIKit

class ErrorHandler {
    static func showErrorAlert(on viewController: UIViewController, message: String) {
        let alertController = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alertController, animated: true)
    }
}
