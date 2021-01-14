//
//  ViewController.swift
//  UeeraniApp
//
//  Created by Ross on 12/01/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var speechText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let utterance = AVSpeechUtterance(string: speechText.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-mx")
        utterance.rate = 0.5

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }


}

