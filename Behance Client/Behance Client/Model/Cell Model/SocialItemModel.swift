//
//  SocialItemModel.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation

struct SocialItemModel : CellItemModel{
    typealias ItemModel = User
    
    var twitter : String!
    var url     : String!
    
    init(data:ItemModel) {
        self.twitter    = data.twitter
        self.url        = data.url
    }
    
    
}
