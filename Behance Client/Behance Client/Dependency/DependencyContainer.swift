//
//  DependencyContainer.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 25/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import RxSwift
import ReSwift


open class DependencyContainer : DependencyProvider {
    
    let reduxStore = Store<AppState>(reducer: mainReducer, state: nil)
    
    
}
