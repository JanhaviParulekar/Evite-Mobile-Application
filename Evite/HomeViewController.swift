//
//  HomeViewController.swift
//  Evite
//
//  Created by Maitri Brahmbhatt on 12/15/17.
//  Copyright © 2017 Janhavi Parulekar. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HomeViewController: UITableViewController {
    
    static var eName = ""
    static var eDesc = ""
    static var ePrice = ""
    static var eVenue = ""
    static var eDate = ""
    static var eTime = ""
    
    var eventsData = [String: AnyObject]()
    var eventName = [String]()
    var eventPrice = [Double]()
    var eventDescription = [String]()
    var eventVenue = [String]()
    var eventDate = [String]()
    var eventTime = [String]()
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?

    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        
        databaseHandle = ref?.child("events").observe(.childAdded, with: { (snapshot) in
            //let event = snapshot.value as? String
            
            let eventDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            //if let actualEvent = eventDict {
                //self.eventsData.append(actualEvent)
                //print(self.eventsData[0])
            
            self.eventsData = eventDict
            print(self.eventsData)
            //var events = Array(self.eventsData.values)
            //print(events)
            
            self.eventName.append(self.eventsData["eventName"] as! String)
            self.eventPrice.append(self.eventsData["eventPrice"] as! Double)
            self.eventDescription.append(self.eventsData["eventDescription"] as! String)
            self.eventVenue.append(self.eventsData["eventVenue"] as! String)
            self.eventDate.append(self.eventsData["eventDate"] as! String)
            self.eventTime.append(self.eventsData["eventTime"] as! String)
            
                self.tableView.reloadData()
        //}
        })
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return eventsData.count
        return eventName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = eventName[indexPath.row]
        cell.detailTextLabel?.text = "\("$")\(eventPrice[indexPath.row])"
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        let name: String
        var count = 0
        name = eventName[indexPath.row]
        for i in eventName{
            
            if(i == name){
                HomeViewController.eName = eventName[count]
                HomeViewController.eDesc = eventDescription[count]
                HomeViewController.ePrice = "\(eventPrice[count])"
                HomeViewController.eVenue = eventVenue[count]
                HomeViewController.eDate = eventDate[count]
                HomeViewController.eTime = eventTime[count]
                 
            }
            count = count + 1
        }
       // passValue = object
       // performSegue(withIdentifier:"detailSegueId", sender: self)
 
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
