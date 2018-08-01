//
//  UserProfileViewController.swift
//  Evite
//
//  Created by Maitri Brahmbhatt on 12/15/17.
//  Copyright © 2017 Janhavi Parulekar. All rights reserved.
//

import UIKit
import FirebaseAuth

class UserProfileViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = Auth.auth().currentUser
        if let user = user {
            // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with your backend server,
            // if you have one. Use getTokenWithCompletion:completion: instead.
            let email = user.email
            let value1 = email!.index(of: "@")!
            username = "\(email![..<value1])"
            // ...
        }
        
        if let label = usernameLabel {
           label.text = username
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
