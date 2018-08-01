//
//  CreateEventViewController.swift
//  Evite
//
//  Created by Maitri Brahmbhatt on 12/15/17.
//  Copyright © 2017 Janhavi Parulekar. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class CreateEventViewController: UIViewController {

    @IBOutlet weak var eventNameTextField: UITextField!
    
    @IBOutlet weak var eventTimePicker: UIDatePicker!
    
    @IBOutlet weak var eventDescriptionTextView: UITextView!
    
    @IBOutlet weak var eventPriceTextField: UITextField!
    
    @IBOutlet weak var eventVenueTextField: UITextField!
    
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    
    var ref: DatabaseReference?
    
    //var eventName = "event2"
    //var eventDescription = "my Second Event"
    //var eventPrice = 35.46
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createEventButtonTapped(_ sender: Any) {
    let eventName = eventNameTextField.text
        let eventDescription = eventDescriptionTextView.text
        let eventPrice = Double(eventPriceTextField.text!)
        let eventVenue = eventVenueTextField.text
        let eventDate = "\(eventDatePicker.date)"
        let eventTime = "\(eventTimePicker.date)"
        
        if eventNameTextField.text?.isEmpty ?? true || eventDescriptionTextView.text?.isEmpty ?? true || eventPriceTextField.text?.isEmpty ?? true || eventVenueTextField.text?.isEmpty ?? true{
            
            let alertController = UIAlertController(title: "Empty Fields", message: "Kindly enter all fields", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default){ action in
                
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
        else{
        
        let key = ref?.child("events").childByAutoId().key

        let event = ["eventName": eventName,
                     "eventDescription": eventDescription,
                     "eventPrice": eventPrice,
                     "eventVenue": eventVenue,
                     "eventDate": eventDate,
                     "eventTime": eventTime] as [String : Any]
       
        let childUpdates = ["/events/\(key)": event,
                            "/user-events/\(eventName)/\(key)/": event]
        ref?.updateChildValues(childUpdates)
            
            let alertController = UIAlertController(title: "Success!!", message: "Event has been created successfully", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default){ action in
                
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
            
        }
        


    }
    /*
    @IBAction func createEventTapped(_ sender: Any) {
        let key = ref?.child("events").childByAutoId().key
        let event = ["eventName": eventName,
                    "eventDescription": eventDescription,
                    "eventPrice": eventPrice] as [String : Any]
        let childUpdates = ["/events/\(key)": event,
                            "/user-events/\(eventName)/\(key)/": event]
        ref?.updateChildValues(childUpdates)
    }
 */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
