//
//  InfoPuebloViewController.swift
//  UeeraniApp
//
//  Created by Ross on 16/01/21.
//

import UIKit
import AVFoundation
import FirebaseDatabase

class InfoPuebloViewController: UIViewController, ClimaManagerDelegate {
    func actualizarClima(clima: ClimaModelo) {
        
        print(clima.temperaturaDecimal)
        DispatchQueue.main.async {
            self.recomendacion.text = clima.descripcionClima
            self.imageClima.image = UIImage(named: clima.condicionClima)
            self.tempMin.text = clima.tempMinDecimal
            self.tempMax.text = clima.tempMaxDecimal
        }
    }
    
    func error(cualError: Error) {
        
    }
    
    var ref: DatabaseReference!
    @IBOutlet weak var recibirNombre: UILabel!
    @IBOutlet weak var imageClima: UIImageView!
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var recomendacion: UILabel!
    @IBOutlet weak var infoPueblo: UITextView!
    var pueblo : String?
    
    var climaManager = ClimaManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*let utterance = AVSpeechUtterance(string: speechText.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-mx")
        utterance.rate = 0.5

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)*/
        climaManager.delegado = self
        
        recibirNombre.text = pueblo!
        
        obtenerClima()
        ref = Database.database().reference()
        obtenerInfoPueblo()
    }
    
    func obtenerClima(){
        climaManager.fetchClima(nombreCiudad: pueblo!)
    }
    
    func obtenerInfoPueblo(){
        /*self.ref.child("Pueblos").child("\(recibirNombre.text!)/").observeSingleEvent(of: .value, with: { snapshot in
                if !snapshot.exists() { return print("no se encontro")}
                let info = snapshot.value! as? String
                self.infoPueblo.text = info!
            
            let utterance = AVSpeechUtterance(string: self.infoPueblo.text!)
            utterance.voice = AVSpeechSynthesisVoice(language: "es-mx")
            utterance.rate = 0.5

            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
            
        })*/
        
        //Accediendo a los datos del json pueblos
        self.ref.child("Pueblos").observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
          let value = snapshot.value as? NSDictionary
            let info = value?[self.pueblo!] as? String ?? ""
            //print(info)
            let infoP = info
            //print(infoP)
            self.infoPueblo.text = infoP
            
            //añadiendo el texto que se leera
            let utterance = AVSpeechUtterance(string: self.infoPueblo.text!)
            //estableciendo idioma del speech español mexico
            utterance.voice = AVSpeechSynthesisVoice(language: "es-mx")
            //velocidad del speech
            utterance.rate = 0.5
            //asignando para que comience la voz
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)

          // ...
          }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    @IBAction func fromInfoPuebloView(segue:UIStoryboardSegue!){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pueblo"{
            let pueblo = segue.destination as! GaleriaViewController
            pueblo.pueblo = self.pueblo?.lowercased()
           
        }
    }


}
