//
//  AppDelegate.swift
//  bot
//
//  Created by Scott Wadden on 2014-08-13.
//  Copyright (c) 2014 Scott Wadden. All rights reserved.
//

import Cocoa
import Robot

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet weak var window: NSWindow!
    var robot = Robot()
    


    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        var bean = robot.connect()
        bean.
        //var hi = "hi"
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

