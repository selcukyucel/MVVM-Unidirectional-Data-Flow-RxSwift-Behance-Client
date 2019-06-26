//
//  ProjectViewState.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 26/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import ReSwift

struct ProjectViewState : StateType, Equatable{
    
    let project : Project
    
    init(project:Project) {
        self.project = project
    }
    
    public static func ==(lhs:ProjectViewState, rhs:ProjectViewState) -> Bool {
        return lhs.project == rhs.project
    }
    
}
