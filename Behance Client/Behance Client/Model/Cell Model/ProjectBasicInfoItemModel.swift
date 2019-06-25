//
//  ProjectBasicInfoItemModel.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation

struct ProjectBasicInfoItemModel : CellItemModel {
    
    typealias ItemModel = Project
    
    var name    : String!
    var date    : Date!
    
    init(data:ItemModel) {
        
        self.name       = data.name
        
    }
}
