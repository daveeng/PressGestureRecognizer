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
        
        let pressGesture = PressGestureRecognizer(target: self, action: #selector(handleClick(_:)))
        pressGesture.allowedTouchTypes = [NSNumber(integer: UITouchType.Indirect.rawValue)]
        view.addGestureRecognizer(pressGesture)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleClick(sender: PressGestureRecognizer) {
        switch sender.state {
        case .Began:
            switch sender.recognizedDirection {
            case .Up:
                print("Clicked Up")
                statusLabel.text = "Clicked Up"
            case .Down:
                print("Clicked Down")
                statusLabel.text = "Clicked Down"

            case .Left:
                print("Clicked Left")
                statusLabel.text = "Clicked Left"

            case .Right:
                print("Clicked Right")
                statusLabel.text = "Clicked Right"

            default:
                print("Clicked ???")
                statusLabel.text = "Clicked ???"

            }
            statusLabel.textColor = .greenColor()
        case .Ended:
            statusLabel.textColor = .blackColor()
        default:
            break
        }
    }

}