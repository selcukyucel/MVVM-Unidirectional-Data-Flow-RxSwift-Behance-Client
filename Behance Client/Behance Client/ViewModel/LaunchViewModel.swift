//
//  LaunchViewModel.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 25/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import RxSwift
import ReSwift

class LaunchViewModel {
    
    let screen          : Observable<AuthScreen>
    
    init(screen:Observable<AuthScreen>) {
        
        self.screen     = screen
    }
    
    
    
}
