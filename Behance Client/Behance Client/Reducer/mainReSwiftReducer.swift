//
//  mainReSwiftReducer.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 12/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import ReSwift

func mainReducer(action:Action, state:AppState?) -> AppState {
    
    var state : AppState = state ?? AppState()
    
    state.screen    = screenReducer(action: action, screen: state.screen)
    
    return state
}

func screenReducer(action:Action, screen:AuthScreen) -> AuthScreen{
    
    var screen = screen
    
    switch action {
    case let action as UserAction:
        
        return .profile(ProfileViewState(user: action.user))
    
    case _ as ProjectsAction:
        return .projects
        
    case _ as CreativesToFollowAction:
        return .creativesToFollow
        
    default:
        break
    }
    
    
    return .none
    
}
