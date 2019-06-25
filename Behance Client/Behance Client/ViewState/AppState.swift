//
//  AppState.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 12/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import ReSwift

enum AuthScreen {
    case none
    case profile(ProfileViewState)
    case projects
    case creativesToFollow
    
}

extension AuthScreen : Equatable{
    
    public static func ==(lhs:AuthScreen, rhs:AuthScreen) -> Bool{
        return false
    }
    
}

struct AppState : StateType, Equatable {
    
    public var screen : AuthScreen
    
    public init(screen:AuthScreen = .none){
        self.screen = screen
    }
    
    static func ==(lhs: AppState, rhs: AppState) -> Bool {
        return lhs.screen == rhs.screen
    }
    
}
