//
//  ViewController.swift
//  UeeraniApp
//
//  Created by Ross on 12/01/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var contraseña: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func login(_ sender: UIButton) {
        if let email = usuario.text, let pass = contraseña.text{
            Auth.auth().signIn(withEmail: email, password: pass){
                (result, error) in
                
                if let result = result, error == nil{
                    //self.navigationController?.pushViewController(BienvenidaViewController(email: result.user.email!, provider: .basic), animated: true)
                    self.performSegue(withIdentifier: "bienvenida", sender: BienvenidaViewController.self)
                }else{
                    let alert = UIAlertController(title: "Error", message: "Usuario y/o contraseña incorrectos", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
    }
    }
    
}

