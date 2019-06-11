//
//  StoreSubscriptionExtensions.swift
//  undirectional
//
//  Created by Selcuk Yucel on 28/02/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import RxSwift
import ReSwift

extension Store {
    
    public func makeObservable<SelectedState>(_ selector: ((State) -> SelectedState)? = nil) -> Observable<SelectedState> {
        return Observable.create(self.makeSubscribeClosure(selector))
    }
    
    public func makeObservable<SelectedState>(_ selector: ((State) -> SelectedState)?) -> Observable<SelectedState> where SelectedState: Equatable {
        return Observable.create(self.makeSubscribeClosure(selector)).distinctUntilChanged()
    }
    
    private func makeSubscribeClosure<SelectedState>(_ selector: ((State) -> SelectedState)?) -> ((AnyObserver<SelectedState>) -> Disposable) {
        return { [weak self] observer in
            guard let strongSelf = self else { return Disposables.create() }
            return strongSelf.subscribe(observer, selector: selector)
        }
    }
    
    private func subscribe<SelectedState>(_ rxObserver: AnyObserver<SelectedState>,
                                          selector: ((State) -> SelectedState)?) -> RxSwift.Cancelable {
        let subscriber = RxStoreSubscriber<SelectedState>(rxObserver)
        if let selector = selector {
            self.subscribe(subscriber) { subscription in
                subscription.select(selector)
            }
        } else {
            self.subscribe(subscriber, transform: nil)
        }
        return makeDisposable(subscriber)
    }
    
    private func makeDisposable(_ subscriber: AnyStoreSubscriber) -> RxSwift.Cancelable {
        return Disposables.create { [weak self] in
            self?.unsubscribe(subscriber)
        }
    }
    
}
