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

    var disposable      : Disposable!
    let disposeBag      = DisposeBag()
    
    //Model
    var viewModel       : LaunchViewModel!
    
    //Dependency
    var container       : LaunchDependencyContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Subscribe screen changes
        subscribeScreen()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        self.disposable.dispose()
    }
}

//MARK: UI Actions
extension LaunchViewController {
    
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

//MARK: Funcs
extension LaunchViewController {
    
    // Observe screen changes
    private func subscribeScreen(){
        
        self.disposable = viewModel.screen.skip(1).subscribe(onNext:{ [weak self] screen in
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
        })
    }
    
    //TODO: Delete this later
    private func alert(message:String){
        
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

