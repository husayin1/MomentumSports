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
}
