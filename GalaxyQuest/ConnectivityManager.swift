//
//  ConnectivityManager.swift
//  GalaxyQuest
//
//  Created by Michael Selsky on 11/8/14.
//  Copyright (c) 2014 Michael Selsky. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ConnectivityManager: NSObject, MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate {
    let GalaxyQuestServiceType = "GalaxyQuestGameService"
    let localPeerID = MCPeerID(displayName: UIDevice.currentDevice().name)
    var advertiser:MCNearbyServiceAdvertiser
    var browser:MCNearbyServiceBrowser
    
    override init() {
        self.advertiser = MCNearbyServiceAdvertiser(peer: self.localPeerID, discoveryInfo: nil, serviceType: self.GalaxyQuestServiceType)
        self.browser = MCNearbyServiceBrowser(peer: self.localPeerID, serviceType: self.GalaxyQuestServiceType)
        super.init()
        self.advertiser.delegate = self;
        self.browser.delegate=self;
    }
    
    func beginAdvertising(){
        self.advertiser.startAdvertisingPeer()
    }
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didReceiveInvitationFromPeer peerID: MCPeerID!, withContext context: NSData!, invitationHandler: ((Bool, MCSession!) -> Void)!) {
        
        let session = MCSession(peer: self.localPeerID)
        
        invitationHandler(true, session);
        //TODO: handle getting an invitation
    }
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didNotStartAdvertisingPeer error: NSError!) {
        //TODO: error handle when not start advertising
    }
   
    func beginBrowsing(){
        self.browser.startBrowsingForPeers()
    }
    
    func browser(browser: MCNearbyServiceBrowser!, foundPeer peerID: MCPeerID!, withDiscoveryInfo info: [NSObject : AnyObject]!) {
        //TODO: handle finding a peer
    }
    
    func browser(browser: MCNearbyServiceBrowser!, lostPeer peerID: MCPeerID!) {
        //TODO: handle losing a peer
    }
    
    func browser(browser: MCNearbyServiceBrowser!, didNotStartBrowsingForPeers error: NSError!) {
        //TODO: handle error when starting a browse;
    }
}
