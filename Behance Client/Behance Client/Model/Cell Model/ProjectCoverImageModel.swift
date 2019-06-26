//
//  ProjectCoverImageModel.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation

struct ProjectCoverImageModel : CellItemModel {
    
    typealias ItemModel = Project
    
    var imageURL : String!
    
    init(data:ItemModel) {
        self.imageURL = data.coverImage
    }
}
