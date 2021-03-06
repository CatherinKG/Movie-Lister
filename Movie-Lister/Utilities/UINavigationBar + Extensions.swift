//
//  UINavigationBar + Extensions.swift
//  Movie-Lister
//
//  Created by   CATHERINE on 16/09/18.
//  Copyright © 2018 Catherine. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func setBackground() {
        let navigationBgImage = UIImage(named: Constants.navigationImage )?.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
        self.setBackgroundImage(navigationBgImage, for: .default)
    }
    
}

