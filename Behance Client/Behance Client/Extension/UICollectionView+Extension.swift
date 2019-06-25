//
//  UICollectionView+Extension.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func register(name:String){
        
        let nib = UINib(nibName: name, bundle: nil)
        
        self.register(nib, forCellWithReuseIdentifier: name)
    }
}
