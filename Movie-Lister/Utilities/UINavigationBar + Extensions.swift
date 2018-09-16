//
//  UINavigationBar + Extensions.swift
//  Movie-Lister
//
//  Created by EVENTORG CATHERINE on 16/09/18.
//  Copyright © 2018 Catherine. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func setBackground() {
        let navigationBgImage = UIImage(named: "nav_bar")?.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
        self.setBackgroundImage(navigationBgImage, for: .default)
    }
    
}

