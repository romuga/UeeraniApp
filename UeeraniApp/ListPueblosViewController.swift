//
//  ListPueblosViewController.swift
//  UeeraniApp
//
//  Created by Ross on 22/01/21.
//

import UIKit

class ListPueblosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func fromListPueblosView(segue:UIStoryboardSegue!){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Angangueo"{
            
           let pueblo = segue.destination as! InfoPuebloViewController
            pueblo.pueblo = "Angangueo"
        }
        else if segue.identifier == "Cuitzeo"{
            
           let pueblo = segue.destination as! InfoPuebloViewController
            pueblo.pueblo = "Cuitzeo"
        }
        else if segue.identifier == "Patzcuaro"{
            
           let pueblo = segue.destination as! InfoPuebloViewController
            pueblo.pueblo = "Patzcuaro"
        }
        else if segue.identifier == "Santa Clara del Cobre"{
            
           let pueblo = segue.destination as! InfoPuebloViewController
            pueblo.pueblo = "Santa Clara del Cobre"
        }
        else if segue.identifier == "Tacambaro"{
            
           let pueblo = segue.destination as! InfoPuebloViewController
            pueblo.pueblo = "Tacambaro"
        }
        else if segue.identifier == "Jiquilpan"{
            
           let pueblo = segue.destination as! InfoPuebloViewController
            pueblo.pueblo = "Jiquilpan"
        }
        else if segue.identifier == "Tlalpujahua"{
            
           let pueblo = segue.destination as! InfoPuebloViewController
            pueblo.pueblo = "Tlalpujahua"
        }
        else if segue.identifier == "Tzintzuntzan"{
            
           let pueblo = segue.destination as! InfoPuebloViewController
            pueblo.pueblo = "Tzintzuntzan"
        }
        
        
    }

}
