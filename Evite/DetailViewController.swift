//
//  DetailViewController.swift
//  Evite
//
//  Created by Maitri Brahmbhatt on 12/15/17.
//  Copyright © 2017 Janhavi Parulekar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventVenueTextView: UITextView!
    @IBOutlet weak var eventPriceLabel: UILabel!
    @IBOutlet weak var eventDescTextView: UITextView!
    @IBOutlet weak var eventNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let value1 = HomeViewController.eDate.index(of: " ")!
        let edate = "\(HomeViewController.eDate[...value1])"

        let value2 = HomeViewController.eDate.index(of: "+")!
        let etime = "\(HomeViewController.eTime[value1..<value2])"
        
        if let label = eventNameLabel {
            label.text = HomeViewController.eName
        }
        if let label = eventPriceLabel {
            label.text = "\("$")\(HomeViewController.ePrice)"
        }
        if let label = eventDateLabel {
            label.text = edate
        }
        if let label = eventTimeLabel {
            label.text = etime
        }
        if let textView = eventDescTextView{
            textView.text = HomeViewController.eDesc
        }
        if let textView = eventVenueTextView{
            textView.text = HomeViewController.eVenue
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
