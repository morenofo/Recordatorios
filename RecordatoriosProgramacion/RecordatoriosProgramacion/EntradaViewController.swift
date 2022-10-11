//
//  ViewController.swift
//  RecordatoriosProgramacion
//
//  Created by OSCAR on 13/9/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
//enum ProveedorTipo: String {
//    case basic
//    case google
//}


class EntradaViewController: UIViewController {
    
    
    @IBOutlet weak var entradaStackView: UIStackView!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var contraseñaTextField: UITextField!
    @IBOutlet weak var registroTextField: UIButton!
    
    @IBOutlet weak var loginTextField: UIButton!
    
    @IBOutlet weak var googleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        comprobar la sesion de usuario autentificado
        let defaults = UserDefaults.standard
        if let email = defaults.value(forKey: "email") as? String,
            let provaider = defaults.value(forKey: "provaider") as? String {
            entradaStackView.isHidden = true
            navigationController? .pushViewController(LoginViewController(email: email, provaider: ProviderType.init(rawValue: provaider)!), animated: true)
        }
    
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        entradaStackView.isHidden = false
    }
    
    
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        print("entra")
        if let email = emailTextField.text, let contraseña = contraseñaTextField.text {
            Auth.auth().signIn(withEmail: email, password: contraseña){
                (result, error) in

                self.loginHome(result: result, error: error, provaider: .basic)
                

            }
        
    }
    }
    @IBAction func registriButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let contraseña = contraseñaTextField.text {
            Auth.auth().createUser(withEmail: email, password: contraseña){
                (result, error) in

                self.loginHome(result: result, error: error, provaider: .basic)
            }
        
        }
    }
    @IBAction func googleButtonAction(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        GIDSignIn.sharedInstance()?.signIn()
    }

    
    private func loginHome (result: AuthDataResult?, error: Error?, provaider: ProviderType){
    if let result = result, error == nil {
        self.navigationController? .pushViewController(LoginViewController(email: result.user.email!, provaider: provaider), animated: true)
    
    } else
    {
        let alertController = UIAlertController(title: "Error", message: "Se ha producido un error de autentificacion mediante\(provaider.rawValue)", preferredStyle: .alert)
                            alertController.addAction(UIAlertAction(title: "Aceptar", style:  .default))
                            self.present(alertController, animated: true, completion: nil)
                            
                        }

    

}

   
}
            
extension EntradaViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil && user.authentication != nil {
            let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
            Auth.auth().signIn(with: credential) { (result, error) in
                self.loginHome(result: result, error: error, provaider: .google)
            }
        }
    }
    
    
}
    


    
