//
//  CellConfigurator.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit

protocol CellItemModel {
    associatedtype ItemModel
}

protocol ConfigurableCell {
    associatedtype DataType
    
    func configure(data:DataType)
}

protocol CellConfigurator {
    
    static var reuseID : String { get }
    
    func configure(cell:UIView)
    
    func size(ofCell collectionView:UICollectionView) -> CGSize
}
