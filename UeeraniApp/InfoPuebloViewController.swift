//
//  InfoPuebloViewController.swift
//  UeeraniApp
//
//  Created by Ross on 16/01/21.
//

import UIKit
import AVFoundation

class InfoPuebloViewController: UIViewController {

    @IBOutlet weak var recibirNombre: UILabel!
    @IBOutlet weak var imageClima: UIImageView!
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var recomendacion: UILabel!
    @IBOutlet weak var infoPueblo: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*let utterance = AVSpeechUtterance(string: speechText.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-mx")
        utterance.rate = 0.5

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)*/
    }
    


}
