//
//  LoginViewController.swift
//  RecordatoriosProgramacion
//
//  Created by OSCAR on 24/9/22.
//

import UIKit
//import FirebaseCore
import FirebaseAuth
import GoogleSignIn

enum ProviderType: String {
    case basic
    case google
}

class LoginViewController: UIViewController {

   
    @IBOutlet weak var emailLoginTexfil: UITextField!
    
    @IBOutlet weak var provaiderLabelTexfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    private let email: String
    private let provaider: ProviderType



    init(email: String , provaider: ProviderType ){
        self.email = email
        self.provaider = provaider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }






    override func viewDidLoad() {
        super.viewDidLoad()
title = "inicio"
        navigationItem.setHidesBackButton(true, animated: false)
        emailLoginTexfil.text = email
        provaiderLabelTexfield.text = provaider.rawValue
//        guardar datos
        let defaults = UserDefaults.standard
        defaults.set(email, forKey: "email")
        defaults.set(provaider.rawValue, forKey: "provaider")
        defaults.synchronize()

    }

    @IBAction func entrarLoginButtonAction(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "provaider")
        defaults.synchronize()

        switch provaider {
        case .basic:
            firebaseLogOut()
        case .google:
            GIDSignIn.sharedInstance()?.signOut()
            firebaseLogOut()
        }
        navigationController?.popViewController(animated: true)
    }
    private func firebaseLogOut() {
        
        do { try Auth.auth().signOut()
            
        } catch {
           
        }
        
        }
    
}


   
    


