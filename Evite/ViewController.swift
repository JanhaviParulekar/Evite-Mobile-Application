//
//  ViewController.swift
//  Evite
//
//  Created by Maitri Brahmbhatt on 12/12/17.
//  Copyright © 2017 Janhavi Parulekar. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
    var checkStatus = false

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginTapped(_ sender: Any) {
        if let username = usernameTextField.text, let password = passwordTextField.text{
            Auth.auth().signIn(withEmail: username, password: password, completion: { user, error in
                if let firebaseError = error{
                    print(firebaseError.localizedDescription)
                    self.checkStatus = false
                    let alertController = UIAlertController(title: "Login Failed", message: "Login and password pair does not exist", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default){ action in
                        
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true)

                    return
                }
                print("success!")
                self.checkStatus = true
                self.performSegue(withIdentifier: "login", sender: self)
            })
        }
        
    }
    
    /*
    @IBAction func createAccountTapped(_ sender: Any) {
        if let username = usernameTextField.text, let password = passwordTextField.text{
            Auth.auth().createUser(withEmail: username, password: password, completion: { user, error in
                if let firebaseError = error{
                    print(firebaseError.localizedDescription)
                    return
                }
                let alertController = UIAlertController(title: "Success!!", message: "Acount has been created successfully. Please Login to proceed", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default){ action in
                    
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
                print("success!")
            })
        }
    }
 */
    
}

