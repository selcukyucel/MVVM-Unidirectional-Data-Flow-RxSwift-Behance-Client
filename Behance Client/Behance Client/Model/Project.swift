//
//  Project.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation


struct Project : Equatable{
    
    var pid         : Int!
    var name        : String!
    var url         : String!
    var fields      : [String]!
    var covers      : [GenericDictionary<String, Any>]!
    var matureContent : Bool!
    var owners      : [User]!
    var stats       : GenericDictionary<String,Any>!
    var description : String!
    var modules     : [GenericDictionary<String,Any>]!
    var copyright   : GenericDictionary<String,Any>!
    var featuredOn  : [GenericDictionary<String,Any>]!
    var coverImage  : String!
    
    init(dictionary:GenericDictionary<String,Any>) {
        
        self.pid            = dictionary["id"]
        self.name           = dictionary["name"]
        self.url            = dictionary["url"]
        self.fields         = dictionary["fields"]
        self.coverImage     = dictionary["cover_image"]
        
        
        if let covers : [String:Any] = dictionary["covers"]! {
            self.covers = covers.map { dict -> GenericDictionary<String,Any> in
                return GenericDictionary(data: [dict.key:dict.value])
            }
        }
        
        self.matureContent   = dictionary["mature_content"]
        
        let ownersDictionary = GenericDictionary<String,Any>(data: dictionary["owners"]!)
        
        self.owners = ownersDictionary.keys().map { (key) -> GenericDictionary<String,Any> in
            return GenericDictionary<String,Any>(data: ownersDictionary[key]!)
            }.map { (dictionary) -> User in
                return User(dictionary: dictionary)
        }
        
        if(dictionary.exist(key: "stats")){
            self.stats = GenericDictionary<String,Any>(data: dictionary["stats"]!)
        }
        
        self.description    = dictionary["description"]
        
        if let modules : [[String:Any]] = dictionary["modules"]! {
            self.modules = modules.map { (dictionary) -> GenericDictionary<String,Any> in
                return GenericDictionary(data: dictionary)
            }
            
        }
        
        if dictionary.exist(key: "copyright"){
            self.copyright = GenericDictionary<String,Any>(data: dictionary["copyright"]!)
        }
        
        
        if let featured : [[String:Any]] = dictionary["featured_on"]! {
            self.featuredOn = featured.map { (dictionary) -> GenericDictionary<String,Any> in
                return GenericDictionary(data: dictionary)
            }
            
        }

    }
    
    static func==(lhs:Project, rhs:Project) -> Bool{
        return lhs.pid == rhs.pid
    }
    
}
