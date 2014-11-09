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
    var isCreating: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
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

    @IBAction func createGame(sender: AnyObject) {
        self.session.beginAdvertising()
        self.isCreating = true
    }
    
    @IBAction func findGame(sender: AnyObject) {
        self.session.beginBrowsing()
        self.isCreating = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController
        
        if self.isCreating! {
            let vC = destinationViewController as CreateGameViewControllerViewController
            vC.session = session
            
        } else {
            let vC = destinationViewController as FindGameTableViewController
            vC.session = session
        }
    
    }
    
}

