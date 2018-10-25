//
//  Haptifier.swift
//  Haptify
//
//  Created by Anand Kore on 25/10/18.
//  Copyright © 2018 Anand Kore. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox.AudioServices


//MARK:- Public Functions
func Haptifyy(feed:HaptifierMode){
    switch feed {
    case .StandardVibration, .StandardAlertVibration, .Peek, .Pop, .Cancelled, .Retry, .Failed:
        AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(feed.rawValue), {})
        break
    case .Success:
        Haptifier.shared.feedbackNotificationGenerator.notificationOccurred(.success)
        break
    case .Warning:
        Haptifier.shared.feedbackNotificationGenerator.notificationOccurred(.warning)
        break
    case .Error:
        Haptifier.shared.feedbackNotificationGenerator.notificationOccurred(.error)
        break
    }
}


//MARK:- Helpers
public class Haptifier{
    
    //MARK: Public properties
    static var shared:Haptifier = Haptifier()
    var haptifierImpact:HaptifierImpact{
        didSet(newHaptifierImpact){
            switch newHaptifierImpact {
            case .Light:
                feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
                break
            case .Medium:
                feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
                break
            case .Heavy:
                feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
                break
            }
        }
    }
    
    //MARK: Private properties
    fileprivate var feedbackGenerator: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator()
    fileprivate var feedbackNotificationGenerator:UINotificationFeedbackGenerator = UINotificationFeedbackGenerator()
    
    //MARK: Initializer
    init() {
        //-- Default impact
        haptifierImpact = .Medium
        
        //-- Prepare Generators
        feedbackNotificationGenerator.prepare()
        feedbackGenerator.prepare()
    }
}


//MARK:- Enums
enum HaptifierMode:Int{
    //--- Older iPhone supported
    case StandardVibration = 4095
    case StandardAlertVibration = 1011
    
    //--- iPhone 7 and above supported
    case Peek = 1519
    case Pop = 1520
    case Cancelled = 1521
    case Retry = 1102
    case Failed = 1107
    
    //--- iPhone 8 and above supported
    case Success = 0
    case Warning = 1
    case Error = 2
}

enum HaptifierImpact:String{
    case Light = "Light"
    case Medium = "Medium"
    case Heavy = "Heavy"
}
