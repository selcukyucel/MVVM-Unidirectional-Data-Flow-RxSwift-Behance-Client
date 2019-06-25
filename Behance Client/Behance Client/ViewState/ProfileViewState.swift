//
//  ProfileViewState.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 25/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import ReSwift

struct ProfileViewState : StateType, Equatable{
    
    let user : User
    
    init(user:User) {
        self.user = user
    }
    
    public static func ==(lhs:ProfileViewState, rhs:ProfileViewState) -> Bool {
        return lhs.user == rhs.user
    }
    
}
