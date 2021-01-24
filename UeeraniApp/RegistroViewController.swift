//
//  RegistroViewController.swift
//  UeeraniApp
//
//  Created by Ross on 14/01/21.
//

import UIKit
import Firebase
import FirebaseDatabase
class RegistroViewController: UIViewController {

    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var apellidos: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var contraseña: UITextField!
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
    }
    

    @IBAction func register(_ sender: UIButton) {
        guard let nombreDB = nombre.text else {return}
        guard let apDB = apellidos.text else{return}
        guard let correoDB = email.text else {return}
        
        if nombreDB == "" || apDB == "" || correoDB == "" {
            let alertVacio = UIAlertController(title: "Alerta", message: "Completa todos los datos", preferredStyle: .alert)
            let actionVacio = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertVacio.addAction(actionVacio)
            self.present(alertVacio, animated: true, completion: nil  )
        }else{
        if let email = email.text, let pass = contraseña.text{
            Auth.auth().createUser(withEmail: email, password: pass){
                (result, error) in
                
                if let result = result, error == nil{
                   // self.navigationController?.pushViewController(InicioViewController(email: result.user.email!, provider: .basic), animated: true)
                    
                    self.ref.child("users").child(nombreDB).setValue(["apellidos": apDB, "email": correoDB])
                    self.performSegue(withIdentifier: "bienvenida", sender: BienvenidaViewController.self)
                
                }else{
                    let alert = UIAlertController(title: "Error", message: "Error al registrar al usuario", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alert, animated: true, completion: nil)
                }
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
