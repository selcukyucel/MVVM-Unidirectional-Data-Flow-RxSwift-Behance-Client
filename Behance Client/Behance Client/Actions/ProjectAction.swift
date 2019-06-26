//
//  ProjectAction.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 26/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import ReSwift

struct ProjectAction : Action{
    
    public let project : Project
    
    public init(project:Project) {
        self.project   = project
    }
    
}

