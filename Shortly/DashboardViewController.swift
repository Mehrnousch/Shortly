//
//  ViewController.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 16.06.22.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        let myNewView=UIView(frame: CGRect(x: 20, y: 600, width: 350, height: 150))
               
               // Change UIView background colour
               myNewView.backgroundColor=UIColor.purple
               
               // Add rounded corners to UIView
              // myNewView.layer.cornerRadius=25
               
               // Add border to UIView
               //myNewView.layer.borderWidth=2
               
               // Change UIView Border Color to Red
               //myNewView.layer.borderColor = UIColor.red.cgColor
               
               // Add UIView as a Subview
               self.view.addSubview(myNewView)
        
               
           }
           
           override func didReceiveMemoryWarning() {
               super.didReceiveMemoryWarning()
               // Dispose of any resources that can be recreated.
               
            
           }
           
    }




