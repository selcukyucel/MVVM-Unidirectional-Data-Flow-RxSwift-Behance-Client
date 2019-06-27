//
//  Scene+Extension.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 27/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//


import UIKit

extension Scene{
    func viewController() -> UIViewController{
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        
        switch self {
        case .launch:
            return UIViewController()
            
        case .profile:
            let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
            return vc
        case .project:
            let vc = storyboard.instantiateViewController(withIdentifier: "ProjectViewController")
            return vc
            
        }
    }
}
