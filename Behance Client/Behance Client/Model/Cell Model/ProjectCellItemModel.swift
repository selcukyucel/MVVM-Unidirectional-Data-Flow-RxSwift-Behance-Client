//
//  ProjectCellItemModel.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation

struct ProjectCellItemModel : CellItemModel{
    
    typealias ItemModel = Project
    
    var imageURL    : String!
    var name        : String!
    var project     : Project
    
    init(data:ItemModel) {
        
        self.project    = data
        
        self.name       = data.name
        self.imageURL   = data.coverImage
        
    }
    
}
