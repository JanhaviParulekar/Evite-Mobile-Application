//
//  CreateUserViewController.swift
//  Evite
//
//  Created by Maitri Brahmbhatt on 12/15/17.
//  Copyright © 2017 Janhavi Parulekar. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class CreateUserViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate  {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var ref: DatabaseReference?
    
    let imagePicker = UIImagePickerController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        imagePicker.delegate = self

        
        // Do any additional setup after loading the view.
    }

    @IBAction func selectImage(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        // use the image
        userImage.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backToLoginButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func createUserButtonTapped(_ sender: Any) {
        
        let username = usernameTextField.text
        let password = passwordTextField.text
        let email = emailTextField.text
        let phone = phoneTextField.text
        let photoURL = "\(UIImageJPEGRepresentation(userImage.image!,1))"
        
        if usernameTextField.text?.isEmpty ?? true || passwordTextField.text?.isEmpty ?? true || emailTextField.text?.isEmpty ?? true || phoneTextField.text?.isEmpty ?? true||userImage.image == nil{
            
            let alertController = UIAlertController(title: "Empty Fields", message: "Kindly enter all fields", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default){ action in
                
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
        else{
            Auth.auth().createUser(withEmail: email!, password: password!, completion: { user, error in
                if let firebaseError = error{
                    print(firebaseError.localizedDescription)
                    let alertController = UIAlertController(title: "Sign up Failed", message: "Please try again", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default){ action in
                        
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true)
                    return
                }
                let alertController = UIAlertController(title: "Success!!", message: "Acount has been created successfully. Please Login to proceed", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default){ action in
                    
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
                print("success!")
            })
            
            let key = ref?.child("users").childByAutoId().key
            
            let user = ["username": username,
                         "email": email,
                         "photoURL": photoURL,
                         "phone": phone] as [String : Any]
            
            let childUpdates = ["/users/\(key)": user,
                                "/user-users/\(username)/\(key)/": user]
            ref?.updateChildValues(childUpdates)
            
            let alertController = UIAlertController(title: "Success!!", message: "User has been created successfully", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default){ action in
                
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }

        
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
