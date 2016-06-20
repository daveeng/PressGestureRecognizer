//
//  PressGestureRecognizer.swift
//  PressGestureRecognizer
//
//  Created by David Engelhardt on 6/6/16.
//  Copyright © 2016 Viacom. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass
import GameController

class PressGestureRecognizer: UIGestureRecognizer {
    
    enum Direction {
        case Up
        case Down
        case Left
        case Right
        case None
    }
    
    private var edgeThreshold: Float = 0.5
    private var remotePadXValue: Float = 0
    private var remotePadYValue: Float = 0
    
    var recognizedDirection: Direction = .None

    init(target: AnyObject?, action: Selector, edgeThreshold: Float = 0.5) {
        super.init(target: target, action: action)
        self.edgeThreshold = edgeThreshold
        registerForGameControllerNotifications()
    }
    
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent) {
        for press in presses {
            switch press.type {
            case .Select:
                
                
                if abs(remotePadYValue) > edgeThreshold {
                    
                    if remotePadYValue > edgeThreshold {
                        
                        recognizedDirection = .Up
                        
                    } else if remotePadYValue < -edgeThreshold {
                        
                        recognizedDirection = .Down
                    }
                    state = .Began
                    
                } else if abs(remotePadXValue) > edgeThreshold {
                    
                    if remotePadXValue > edgeThreshold {
                        
                        recognizedDirection = .Right
                        
                    } else if remotePadXValue < -edgeThreshold {
                        
                        recognizedDirection = .Left
                    }
                    state = .Began
                }
                
            default:
                print("clicked something else")
                state = .Failed
            }
        }
    }
    
    override func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent) {
        super.pressesEnded(presses, withEvent: event)
        state = .Ended
    }
    
    override func pressesChanged(presses: Set<UIPress>, withEvent event: UIPressesEvent) {
        super.pressesChanged(presses, withEvent: event)
        state = .Changed
    }
    
    override func pressesCancelled(presses: Set<UIPress>, withEvent event: UIPressesEvent) {
        super.pressesCancelled(presses, withEvent: event)
        state = .Cancelled
    }
    
    //MARK: Apple TV Remote
    
    func registerForGameControllerNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(handleControllerDidConnectNotification), name: GCControllerDidConnectNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(handleControllerDidDisconnectNotification), name: GCControllerDidDisconnectNotification, object: nil)
    }
    
    func handleControllerDidConnectNotification() {
        setupRemoteControlPad()
    }
    
    func handleControllerDidDisconnectNotification() {
        
    }

    func setupRemoteControlPad() {
        
        let controllerList = GCController.controllers()
        if controllerList.count < 1 {
            print("no controller found")
        } else {
            if let siriRemotePad = controllerList.first?.microGamepad {
                siriRemotePad.reportsAbsoluteDpadValues = true
                siriRemotePad.dpad.valueChangedHandler = { (dpad: GCControllerDirectionPad, xValue: Float, yValue: Float) -> Void in

                    self.remotePadXValue = xValue
                    self.remotePadYValue = yValue
                }
            }
        }
        
    }
    
}
