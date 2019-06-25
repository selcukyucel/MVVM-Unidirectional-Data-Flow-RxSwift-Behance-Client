//
//  ProjectFieldsModel.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation

struct ProjectFieldsModel : CellItemModel {
    typealias ItemModel = Project
    
    var fields : [String]!
    
    init(data:ItemModel) {
        self.fields     = data.fields
    }
}
