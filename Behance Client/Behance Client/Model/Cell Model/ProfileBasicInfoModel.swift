//
//  ProfileBasicInfoModel.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation

struct ProfileBasicModel : CellItemModel{
    
    typealias ItemModel = User
    
    var fullName    : String!
    var imageURL    : String!
    var location    : String!
    
    init(data:ItemModel) {
        self.fullName   = "\(data.firstName!) \(data.lastName!)"
        self.imageURL   = "\(data.profilePicture!)"
        self.location   = "\(data.city!), \(data.country!)"
    }
}
