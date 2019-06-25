//
//  User.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation

struct User : Equatable{
    
    var uid             : Int!
    var firstName       : String!
    var lastName        : String!
    var username        : String!
    var city            : String!
    var state           : String!
    var country         : String!
    var company         : String!
    var occupation      : String!
    var url             : String!
    var displayName     : String!
    var images          : [GenericDictionary<String, Any>]!
    var fields          : [String]!
    var twitter         : String!
    var links           : [GenericDictionary<String,Any>]!
    var sections        : GenericDictionary<String,Any>!
    var profilePicture  : String!
    
    init(dictionary:GenericDictionary<String,Any>) {
        
        self.uid            = dictionary["id"]
        
        self.firstName      = dictionary["first_name"]
        self.lastName       = dictionary["last_name"]
        self.username       = dictionary["username"]
        self.city           = dictionary["city"]
        self.state          = dictionary["state"]
        self.country        = dictionary["country"]
        self.company        = dictionary["company"]
        self.occupation     = dictionary["occupation"]
        self.url            = dictionary["url"]
        self.displayName    = dictionary["display_name"]
        self.fields         = dictionary["fields"]
        self.twitter        = dictionary["twitter"]
        self.profilePicture = dictionary["profile_picture"]
        
        if dictionary.exist(key: "sections"){
            
            self.sections       = GenericDictionary<String,Any>(data: dictionary["sections"]!)
            
        }
        
        
        if let images : [String:Any] = dictionary["images"]! {
            self.images = images.map { dict -> GenericDictionary<String,Any> in
                return GenericDictionary(data: [dict.key:dict.value])
            }
        }
     
        
        if let links : [[String:Any]] = dictionary["links"]! {
            self.links = links.map { (dictionary) -> GenericDictionary<String,Any> in
                return GenericDictionary(data: dictionary)
            }
            
        }
        
    }
    
    static func==(lhs:User, rhs:User) -> Bool{
        return lhs.uid == rhs.uid
    }
    
}
