//
//  LaunchViewController.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 12/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit
import RxSwift
import ReSwift

class LaunchViewController: UIViewController {

    
    let disposeBag      = DisposeBag()
    var viewModel       : LaunchViewModel!
    var container       : LaunchDependencyContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subscribe()
        
    }
    
    
    // Observe screen changes
    private func subscribe(){
        viewModel.screen.subscribe(onNext:{ [weak self] screen in
            switch screen {
            case .none:
                break
                
            case .profile(let profileViewState):
                
                if let profileVC   = self?.container.makeProfileViewController(viewState: profileViewState) {
                    self?.navigationController?.pushViewController(profileVC, animated: true)
                }
                
            case .projects:
                self?.alert(message: "Projects will developed soon")
                
                
            case .creativesToFollow:
                self?.alert(message: "Creatives to Follow will developed soon")
                
            default:
                break
            }
        }).disposed(by: disposeBag)
    }
    
    @IBAction func tapProfile(_ sender: UIButton) {
        
        //TODO: Make this User usecase to fetch data.
        if let user = getUser() {
            // User Action is a trigger to push the view Profile View
            container.store.dispatch(UserAction(user: user))
        }
        
    }
    
    @IBAction func tapProjects(_ sender: UIButton) {
        
        container.store.dispatch(ProjectsAction())
        
    }
    
    @IBAction func tapCreativesToFollow(_ sender: UIButton) {
        
        container.store.dispatch(CreativesToFollowAction())
    }
}

extension LaunchViewController {
    //TODO: Delete this later
    private func alert(message:String){
        
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
