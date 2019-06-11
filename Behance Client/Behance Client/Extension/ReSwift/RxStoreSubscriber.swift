//
//  RxStoreSubscriber.swift
//  undirectional
//
//  Created by Selcuk Yucel on 28/02/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import ReSwift
import RxSwift

class RxStoreSubscriber<StateType> : StoreSubscriber{
    let rxObserver: AnyObserver<StateType>
    
    init(_ rxObserver: AnyObserver<StateType>) {
        self.rxObserver = rxObserver
    }
    
    func newState(state: StateType) {
        rxObserver.on(.next(state))
    }
}
