//
//  bt.swift
//  bot
//
//  Created by Scott Wadden on 2014-08-17.
//  Copyright (c) 2014 Scott Wadden. All rights reserved.
//

import Foundation
import SwiftBean

@objc public class Robot {
    var connection = RobotConnection()
    
    public func connect() -> PTDBean {
        connection.connect()
        while self.connection.connectedBean != nil {
            var date = NSDate(timeIntervalSinceNow: 2.0)
            NSRunLoop.currentRunLoop().runUntilDate(date)
        }
        return self.connection.connectedBean!
    }
    
}

//import Bean
class RobotConnection : NSObject, PTDBeanManagerDelegate {
    var connectedBean:PTDBean?
    var manager:PTDBeanManager?
    
    func connect() {
        manager = PTDBeanManager(delegate:self)
    }
    
    func beanManagerDidUpdateState(manager:PTDBeanManager) {
        if(manager.state == .PoweredOn){
            manager.startScanningForBeans_error(nil)
        } else {
            println(manager.state)
            println("bluetooth error")
        }
    }
    
    func BeanManager(beanManager: PTDBeanManager!, didDiscoverBean bean: PTDBean!, error: NSError!) {
        if bean.name() == "Robot" {
            beanManager.connectToBean(bean, error: nil)
        }
        
    }
    
    func BeanManager(beanManager: PTDBeanManager!, didConnectToBean bean: PTDBean!, error: NSError!) {
        connectedBean = bean
    }
    
    func BeanManager(beanManager: PTDBeanManager!, didDisconnectBean bean: PTDBean!, error: NSError!) {
        connectedBean = nil
    }
}
