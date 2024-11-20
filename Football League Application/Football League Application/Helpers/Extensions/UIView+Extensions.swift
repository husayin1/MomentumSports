//
//  UIView+Extensions.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
