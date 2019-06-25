//
//  GenericDictionary.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation

struct GenericDictionary<Key:Hashable, Value> {
    
    private var data : [Key:Value]
    
    init(data:[Key:Value]) {
        self.data = data
    }
    
    subscript<T>(key:Key) -> T? {
        return data[key] as? T 
    }
    
    func keys() ->  Dictionary<Key, Value>.Keys{
        return self.data.keys
    }
    
    func exist(key:Key) -> Bool{
        
        guard self.data[key] != nil else {
            return false
        }
        
        return true
        
    }
    
}
