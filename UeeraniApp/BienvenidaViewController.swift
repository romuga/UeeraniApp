//
//  BienvenidaViewController.swift
//  UeeraniApp
//
//  Created by Ross on 16/01/21.
//

import UIKit

class BienvenidaViewController: UIViewController {

    @IBOutlet weak var nombreUserLabel: UILabel!
    var nUsuario : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        nUsuario = "MArio"

    }
    
    @IBAction func fromInicioView(segue:UIStoryboardSegue!){
        
    }


}
