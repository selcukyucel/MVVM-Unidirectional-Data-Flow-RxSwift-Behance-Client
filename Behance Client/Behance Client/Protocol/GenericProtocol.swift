//
//  GenericProtocol.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation

protocol GenericProtocol {
    associatedtype AnyType
    var property : AnyType { get set }
    
}
