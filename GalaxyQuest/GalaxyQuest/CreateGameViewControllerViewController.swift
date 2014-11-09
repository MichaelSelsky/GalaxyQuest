//
//  CreateGameViewControllerViewController.swift
//  GalaxyQuest
//
//  Created by Michael Selsky on 11/8/14.
//  Copyright (c) 2014 Michael Selsky. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class CreateGameViewControllerViewController: UIViewController {

    var session: ConnectivityManager?

    @IBOutlet weak var currentMembers: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserverForName(session?.updateTeamMembersNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (note) -> Void in
            if let connectedPeers = self.session?.session.connectedPeers {
                var peers = ""
                for peer in connectedPeers {
                    peers = "\(peers) \n\(peer.displayName)"
                }
                self.currentMembers.text = peers
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startGame(sender: AnyObject) {
        self.session!.beginGame()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
