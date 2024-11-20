//
//  ImageHelper.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import UIKit

protocol ImageLoader {
    static func loadImage(from url: URL?, into imageView: UIImageView, placeholder: UIImage?)
}

class DefaultImageLoader: ImageLoader {
    static func loadImage(from url: URL?, into imageView: UIImageView, placeholder: UIImage?) {
        imageView.kf.setImage(with: url, placeholder: placeholder)
    }
}
