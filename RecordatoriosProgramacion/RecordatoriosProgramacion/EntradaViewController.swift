//
//  ViewController.swift
//  RecordatoriosProgramacion
//
//  Created by OSCAR on 13/9/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
//enum ProveedorTipo: String {
//    case basic
//}


class EntradaViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var contraseñaTextField: UITextField!
    @IBOutlet weak var registroTextField: UIButton!
    
    @IBOutlet weak var loginTextField: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func loginButtonAction(_ sender: Any) {
        print("entra")
        if let email = emailTextField.text, let contraseña = contraseñaTextField.text {
            Auth.auth().signIn(withEmail: email, password: contraseña){
                (result, error) in

                if let result = result, error == nil {
                    self.navigationController? .pushViewController(LoginViewController(email: result.user.email!, provaider: .basic), animated: true)
                
                } else {
                    
                    
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando al usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style:  .default))
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                
                

            }
        
    }
    }
    @IBAction func registriButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let contraseña = contraseñaTextField.text {
            Auth.auth().createUser(withEmail: email, password: contraseña){
                (result, error) in

                if let result = result, error == nil {
                    self.navigationController? .pushViewController(LoginViewController(email: result.user.email!, provaider: .basic), animated: true)
                
                } else
                {
                                        
                                        
                                        let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando al usuario", preferredStyle: .alert)
                                        alertController.addAction(UIAlertAction(title: "Aceptar", style:  .default))
                                        self.present(alertController, animated: true, completion: nil)
                                        
                                    }

                

            }
        
        }
    }
}
    
            

    


    
