//
//  NetworkManager.swift
//  Football League Application
//
//  Created by husayn on 20/11/2024.
//

import Foundation
import Reachability
import Toast
class NetworkManager{
    static let shared = NetworkManager()
    private let reachability = try! Reachability()
    private init(){
        NotificationCenter.default.addObserver(self, selector: #selector(networkStatusChanged), name: .reachabilityChanged, object: nil)
        try! reachability.startNotifier()
    }
    @objc private func networkStatusChanged() {
        if isInternetAvailable(){
            print("Internet is connected")
            showToast(message: "connected to network successfully")
        }else{
            showToast(message: "check internet connection and try again.")
            print("no internet")
        }
    }
    
    private func showToast(message: String){
        let toast = Toast.text(message)
        toast.show()
    }
    
    func isInternetAvailable() -> Bool {
        return reachability.connection != .unavailable
    }
}
