//
//  HigherFunctions.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation



func readJSONFromFile(fileName: String) -> [String:Any]?
{
    var json: Any?
    if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
        do {
            let fileUrl = URL(fileURLWithPath: path)
            // Getting data from JSON file using the file URL
            let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
            json = try? JSONSerialization.jsonObject(with: data)
        } catch {
            // Handle error here
        }
    }
    return json as! [String : Any]
}

func makeGenericDictionary(key:String, dictionary:[String:Any]) -> GenericDictionary<String,Any>? {
    
    return GenericDictionary<String,Any>(data: dictionary[key] as! [String : Any])
    
}

func makeGenericDictionaryArray(key:String, dictionary:[String:Any]) -> [GenericDictionary<String,Any>]? {
    
    let projects : [[String:Any]] = (dictionary[key] as! [[String : Any]])

    let result = projects.map { (dictionary) -> GenericDictionary<String,Any> in
        return GenericDictionary(data: dictionary)
    }
    
    return result
    
}

//TODO: Make this a usecase
func getUser() -> User?{
    if let userDictionary = makeGenericDictionary(key: "user", dictionary: readJSONFromFile(fileName: "user")!) {
        let user = User(dictionary: userDictionary)
        return user
    }
    
    return nil
}

func getProjects() -> [Project]? {
    if let allprojectsDictionary = makeGenericDictionaryArray(key: "projects", dictionary: readJSONFromFile(fileName: "projects")!) {
        
        let projects = allprojectsDictionary.map { (dictionary) -> Project in
            return Project(dictionary: dictionary)
        }
        
        return projects
    }
    
    return nil 
}

func getProject() -> Project?{
    if let projectDictionary = makeGenericDictionary(key: "project", dictionary: readJSONFromFile(fileName: "project")!) {
        return Project(dictionary: projectDictionary)
    }
    
    return nil 
}



