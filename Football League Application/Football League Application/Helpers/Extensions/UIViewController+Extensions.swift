//
//  UIViewController+Extensions.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import UIKit

extension UIViewController {
    
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate ()-> Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
    private struct LoaderConstants {
        static var loader: UIActivityIndicatorView?
    }
    
    private var loader: UIActivityIndicatorView {
        get {
            if let existingLoader = LoaderConstants.loader {
                return existingLoader
            } else {
                let newLoader = UIActivityIndicatorView(style: .large)
                newLoader.translatesAutoresizingMaskIntoConstraints = false
                newLoader.color = .purple
                LoaderConstants.loader = newLoader
                return newLoader
            }
        }
        set {
            LoaderConstants.loader = newValue
        }
    }

    func showLoader() {
        guard loader.superview == nil else { return } // Avoid adding the loader multiple times
        view.addSubview(loader)
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        loader.startAnimating()
    }

    func hideLoader() {
        loader.stopAnimating()
        loader.removeFromSuperview()
    }

}
