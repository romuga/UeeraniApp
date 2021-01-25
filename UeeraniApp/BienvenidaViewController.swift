//
//  BienvenidaViewController.swift
//  UeeraniApp
//
//  Created by Ross on 16/01/21.
//

import UIKit
import Firebase

class BienvenidaViewController: UIViewController {

    @IBOutlet weak var nombreUserLabel: UILabel!
    var nUsuario : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        //nombreUserLabel.text = nUsuario!
        self.navigationItem.setHidesBackButton(true, animated:true)

    }
    
    @IBAction func fromInicioView(segue:UIStoryboardSegue!){
       
    }

    
}
