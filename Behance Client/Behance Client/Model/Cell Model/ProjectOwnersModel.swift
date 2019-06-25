//
//  ProjectOwnersModel.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation

struct ProjectOwnersModel : CellItemModel {
    typealias ItemModel = Project
    
    var owners : [User]!
    
    init(data:ItemModel) {
        
        self.owners  = data.owners
        
    }
}

struct ProjectOwnerModel : CellItemModel {
    typealias ItemModel = Project
    
    var owner : User!
    
    init(data:ItemModel) {
        
        self.owner  = data.owners[0]
        
    }
}
