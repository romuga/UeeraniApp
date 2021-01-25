//
//  BienvenidaViewController.swift
//  UeeraniApp
//
//  Created by Ross on 16/01/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class BienvenidaViewController: UIViewController {

    @IBOutlet weak var nombreUserLabel: UILabel!
    var ref: DatabaseReference!
    var nUsuario : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("users")
        //nombreUserLabel.text = nUsuario!
        self.navigationItem.setHidesBackButton(true, animated:true)
        nombreUser()

    }
    
    @IBAction func fromInicioView(segue:UIStoryboardSegue!){
       
    }
    func nombreUser(){
        let userID = Auth.auth().currentUser?.uid
        self.ref.child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
          let value = snapshot.value as? NSDictionary
            let info = value?["nombre"] as? String ?? ""
            //print(info)
            let infoP = info
            //print(infoP)
            self.nombreUserLabel.text = "\(infoP.uppercased())!"
            

          // ...
          }) { (error) in
            print(error.localizedDescription)
    }

    
}
}
