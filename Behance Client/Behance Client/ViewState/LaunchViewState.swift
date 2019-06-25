//
//  LaunchViewState.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 25/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import ReSwift

struct LaunchViewState : StateType{
    
    var screen : AuthScreen
    
    init(screen:AuthScreen) {
        self.screen = screen
    }
    
}

extension LaunchViewState : Equatable {
    public static func ==(lhs:LaunchViewState, rhs:LaunchViewState) -> Bool{
        return lhs.screen == rhs.screen
    }
}
