//
//  ViewController.swift
//  Haptify
//
//  Created by Anand Kore on 25/10/18.
//  Copyright © 2018 Anand Kore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Variables
    let sections: [(title: String, options: [String])] = [
        ("Basic", ["Standard Vibration", "Alert Vibration"]),
        ("Taptic Engine", ["Peek", "Pop", "Cancelled", "Retry", "Failed"]),
        ("Haptic Feedback", ["Success", "Warning", "Error"])]

    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Class Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Current device platform:\(UIDevice.current.platform.rawValue)")
        print(UIDevice.current.hasHapticFeedback ? "Haptic feedback supported." :(UIDevice.current.hasTapticEngine ? "Taptic engin supported.":"Standard vibrations supported."))
        if let feedbackSupportLevel = UIDevice.current.value(forKey: "_feedbackSupportLevel") as? Int {
            print("UIDevice.current _feedbackSupportLevel: \(feedbackSupportLevel)")
        }
    }
}

//MARK:- Table delegate and data source.
extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].options.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = sections[section].title
        
        let supported = " (SUPPORTED)"
        let unsupported = " (UNSUPPORTED)"
        switch section {
        case 0:
            //-- Older Devices
            break
        case 1:
            //-- Taptic Engine
            if UIDevice.current.hasTapticEngine {
                title.append(supported)
            } else {
                title.append(unsupported)
            }
        case 2, 3, 4:
            //-- Haptic Feedback
            if UIDevice.current.hasHapticFeedback {
                title.append(supported)
            } else {
                title.append(unsupported)
            }
        default:
            break
        }
        
        return title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = sections[indexPath.section].options[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            //--- Older iPhones
            switch indexPath.row {
            case 0:
                Haptify(.StandardVibration)
            case 1:
                Haptify(.StandardAlertVibration)
            default:
                break
            }
        case 1:
            //--- Taptic Engine
            switch indexPath.row {
            case 0:
                Haptify(.Peek)
            case 1:
                Haptify(.Pop)
            case 2:
                Haptify(.Cancelled)
            case 3:
                Haptify(.Retry)
            case 4:
                Haptify(.Failed)
            default:
                break
            }
        case 2:
            //--- UINotificationFeedbackGenerator
            switch indexPath.row {
            case 0:
                Haptify(.Success)
            case 1:
                Haptify(.Warning)
            case 2:
                Haptify(.Error)
            default:
                break
            }
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
