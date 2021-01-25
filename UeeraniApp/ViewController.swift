//
//  ViewController.swift
//  UeeraniApp
//
//  Created by Ross on 12/01/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    
    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var contraseña: UITextField!
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("users")
        
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
    @IBAction func fromLoginView(segue:UIStoryboardSegue!){
        let firebaseAuth = Auth.auth()
       do {
         try firebaseAuth.signOut()
        print("SALISTE")
       } catch let signOutError as NSError {
         print ("Error signing out: %@", signOutError)
       }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "bienvenida"{
            
           let usuario = segue.destination as! BienvenidaViewController
           /* let userID = Auth.auth().currentUser?.uid
            self.ref.child("users").child(userID!)
            ref.child("users").child(userID!).child("nombre").observe(.value, with: {
                    snapshot in
                    var groupNames = [String]()
                    for group in snapshot.children {
                        groupNames.append((group as AnyObject).key)
                    }
                    print(groupNames)
                })*/
            let nombre = ""
            usuario.nUsuario = nombre
            //usuario.pass = password.text!nombreDB
        }
    }
    
}

