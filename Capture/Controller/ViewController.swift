//
//  ViewController.swift
//  Capture
//
//  Created by Jennifer Mah on 3/13/19.
//  Copyright © 2019 Jennifer Mah. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:"Logout",style: .plain , target: self, action: #selector(handleLogout))
        
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }
    }
    
    @objc func handleLogout(){
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        //launch login
        let loginController = LoginController()
        present(loginController,animated: true, completion:nil)
    }

}

