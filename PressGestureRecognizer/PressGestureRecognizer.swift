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
    }
    
    private var edgeThreshold: Float = 0.5
    private var siriRemotePad: GCMicroGamepad?
    private var directionToRecognize: Direction!
    
    init(target: AnyObject?, action: Selector, direction: Direction, edgeThreshold: Float = 0.5) {
        super.init(target: target, action: action)
        self.directionToRecognize = direction
        self.edgeThreshold = edgeThreshold
        registerForGameControllerNotifications()
    }
    
    //MARK: Touches & Presses
    
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent) {
        for press in presses {
            switch press.type {
            case .Select:
                
                var edgeCondition: Bool
                
                if let remotePadXValue = siriRemotePad?.dpad.xAxis.value,
                    let remotePadYValue = siriRemotePad?.dpad.yAxis.value {
                    
                    switch directionToRecognize! {
                    case .Up:
                        edgeCondition = remotePadYValue > edgeThreshold
                    case .Down:
                        edgeCondition = remotePadYValue < -edgeThreshold
                    case .Right:
                        edgeCondition = remotePadXValue > edgeThreshold
                    case .Left:
                        edgeCondition = remotePadXValue < -edgeThreshold
                    }
                    
                    if edgeCondition {
                        state = .Began
                    } else {
                        state = .Failed
                    }
                    
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
    
    //MARK: Siri Remote
    
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
            if let pad = controllerList.first?.microGamepad {
                siriRemotePad = pad
                siriRemotePad!.reportsAbsoluteDpadValues = true
            }
        }
    }
    
}
