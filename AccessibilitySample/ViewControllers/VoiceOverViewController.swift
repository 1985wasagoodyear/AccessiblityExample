//
//  VoiceOverViewController.swift
//  AccessibilitySample
//
//  Created by Kevin Yu on 3/26/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

import UIKit

final class VoiceOverViewController: UIViewController {

    // MARK: - Storyboard Outlets
    
    @IBOutlet private var label: UILabel!
    @IBOutlet private var button: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        NotificationCenter
            .default
            .addObserver(self,
                         selector: #selector(setVoiceOverStatus),
                         name: UIAccessibility.voiceOverStatusDidChangeNotification,
                         object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // this changes the VoiceOver text for the button
        // alternatively, it would just say "<text> button"
        button.accessibilityLabel = "Yeehaw Awesome Button Pardner"
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setVoiceOverStatus()
    }
    
    // MARK: - Custom Actions
    
    @objc func setVoiceOverStatus() {
        // change the text depending on if VoiceOver is currently working
        let text = (UIAccessibility.isVoiceOverRunning) ? TextStrings.trains : TextStrings.enableVoiceOver
        label.accessibilityLabel = text
        label.text = text
    }


}

