//
//  Extensions.swift
//  RickandMorty
//
//  Created by A. Mallik on 04/07/2024.
//

import UIKit


extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

