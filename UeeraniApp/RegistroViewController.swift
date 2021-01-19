//
//  RegistroViewController.swift
//  UeeraniApp
//
//  Created by Ross on 14/01/21.
//

import UIKit
import Firebase

class RegistroViewController: UIViewController {

    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var apellidos: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var contraseña: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func register(_ sender: UIButton) {
        if let email = email.text, let pass = contraseña.text{
            Auth.auth().createUser(withEmail: email, password: pass){
                (result, error) in
                
                if let result = result, error == nil{
                   // self.navigationController?.pushViewController(InicioViewController(email: result.user.email!, provider: .basic), animated: true)
                    self.performSegue(withIdentifier: "bienvenida", sender: BienvenidaViewController.self)
                }else{
                    let alert = UIAlertController(title: "Error", message: "Error al registrar al usuario", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "bienvenida"{
            let usuario = segue.destination as! BienvenidaViewController
            usuario.nUsuario = nombre.text!
            //usuario.pass = password.text!
           
        }
    }
    
}
