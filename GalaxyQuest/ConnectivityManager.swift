//
//  ConnectivityManager.swift
//  GalaxyQuest
//
//  Created by Michael Selsky on 11/8/14.
//  Copyright (c) 2014 Michael Selsky. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ConnectivityManager: NSObject, MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate, MCSessionDelegate {
    let GalaxyQuestServiceType = "gq-game"
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
    
    // MARK: Advertising
    
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
    // MARK: Browsing
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
    // MARK: Sessions
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!) {
        //TODO: handle data
    }
    
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState) {
        //TODO: handle session state
    }
    
    func session(session: MCSession!, didStartReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!) {
        //Will not be using probably
    }
    
    func session(session: MCSession!, didFinishReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, atURL localURL: NSURL!, withError error: NSError!) {
        //Will not be using probably
    }
    
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!, withName streamName: String!, fromPeer peerID: MCPeerID!) {
        //Will probably not be using
    }
}
