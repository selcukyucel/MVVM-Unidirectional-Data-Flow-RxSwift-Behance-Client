//
//  UserAction.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 25/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import ReSwift

struct UserAction : Action{
    public let user : User
    
    public init(user:User){
        self.user  = user 
    }
}
