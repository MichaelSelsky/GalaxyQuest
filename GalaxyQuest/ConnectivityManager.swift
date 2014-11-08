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
    var session:MCSession
    
    override init() {
        self.advertiser = MCNearbyServiceAdvertiser(peer: self.localPeerID, discoveryInfo: nil, serviceType: self.GalaxyQuestServiceType)
        self.browser = MCNearbyServiceBrowser(peer: self.localPeerID, serviceType: self.GalaxyQuestServiceType)
        self.session = MCSession(peer: self.localPeerID)
        super.init()
        self.advertiser.delegate = self;
        self.browser.delegate=self;
        self.session.delegate = self;
    }
    
    // MARK: Advertising
    
    func beginAdvertising(){
        self.advertiser.startAdvertisingPeer()
    }
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didReceiveInvitationFromPeer peerID: MCPeerID!, withContext context: NSData!, invitationHandler: ((Bool, MCSession!) -> Void)!) {
        
        
        invitationHandler(true, self.session)
        
        
        
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
        browser.invitePeer(peerID, toSession: self.session, withContext: nil, timeout: 30.0)
        browser.stopBrowsingForPeers()
        self.advertiser.stopAdvertisingPeer()
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
        let message = NSString(data: data, encoding: NSUTF8StringEncoding);
        print(message);
    }
    
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState) {
        //TODO: handle session state
        self.sendTextToSession("hey")
        if state == .Connected {
            if session.connectedPeers.count > 2 {
                self.advertiser.stopAdvertisingPeer()
                //TODO: Start gaemz
            }
        }
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
    
    func sendTextToSession(text: String){
        let data = text.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        
        self.session.sendData(data, toPeers: self.session.connectedPeers, withMode: .Reliable, error: nil)
    }
}
