//
//  ViewController.swift
//  PressGestureRecognizer
//
//  Created by David Engelhardt on 6/6/16.
//  Copyright © 2016 Viacom. All rights reserved.
//

import UIKit
import GameController

class ViewController: UIViewController { //GCEventViewController
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let upGesture = PressGestureRecognizer(target: self, action: #selector(handleUpClick(_:)), direction: .Up)
        upGesture.allowedTouchTypes = [NSNumber(integer: UITouchType.Indirect.rawValue)]
        view.addGestureRecognizer(upGesture)
        
        let downGesture = PressGestureRecognizer(target: self, action: #selector(handleDownClick(_:)), direction: .Down)
        downGesture.allowedTouchTypes = [NSNumber(integer: UITouchType.Indirect.rawValue)]
        view.addGestureRecognizer(downGesture)
        
        let rightGesture = PressGestureRecognizer(target: self, action: #selector(handleRightClick(_:)), direction: .Right)
        rightGesture.allowedTouchTypes = [NSNumber(integer: UITouchType.Indirect.rawValue)]
        view.addGestureRecognizer(rightGesture)
        
        let leftGesture = PressGestureRecognizer(target: self, action: #selector(handleLeftClick(_:)), direction: .Left)
        leftGesture.allowedTouchTypes = [NSNumber(integer: UITouchType.Indirect.rawValue)]
        view.addGestureRecognizer(leftGesture)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleUpClick(sender: UIGestureRecognizer) {
        switch sender.state {
        case .Began:
            print("Clicked Up")
            statusLabel.text = "Clicked Up"
            statusLabel.textColor = .greenColor()
        case .Ended:
            statusLabel.textColor = .blackColor()
        default:
            break
        }
    }
    
    func handleDownClick(sender: UIGestureRecognizer) {
        switch sender.state {
        case .Began:
            print("Clicked Down")
            statusLabel.text = "Clicked Down"
            statusLabel.textColor = .greenColor()
        case .Ended:
            statusLabel.textColor = .blackColor()
        default:
            break
        }
    }
    
    func handleLeftClick(sender: UIGestureRecognizer) {
        switch sender.state {
        case .Began:
            print("Clicked Left")
            statusLabel.text = "Clicked Left"
            statusLabel.textColor = .greenColor()
        case .Ended:
            statusLabel.textColor = .blackColor()
        default:
            break
        }
    }
    
    func handleRightClick(sender: UIGestureRecognizer) {
        switch sender.state {
        case .Began:
            print("Clicked Right")
            statusLabel.text = "Clicked Right"
            statusLabel.textColor = .greenColor()
        case .Ended:
            statusLabel.textColor = .blackColor()
        default:
            break
        }
    }
    
}