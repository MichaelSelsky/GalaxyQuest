//
//  ViewController.swift
//  GalaxyQuest
//
//  Created by Michael Selsky on 11/8/14.
//  Copyright (c) 2014 Michael Selsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let session = ConnectivityManager()
    let factory = DashboardModuleFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.session.beginAdvertising() 
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func advertise(sender: AnyObject) {

        self.session.beginBrowsing()
    }
    
    override func viewDidAppear(animated:Bool){
        for var i = 0; i < 3; i = i + 1{
                let module = self.factory.createModule()
                println("\(module.name): \(module.action) the \(module.name)")
            }
    }

}

