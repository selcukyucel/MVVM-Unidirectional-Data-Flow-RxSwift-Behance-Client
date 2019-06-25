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
        
        self.imageURL = "https://images.unsplash.com/photo-1504700610630-ac6aba3536d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
        
    }
    
}
