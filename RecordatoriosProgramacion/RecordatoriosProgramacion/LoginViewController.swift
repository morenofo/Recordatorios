//
//  LoginViewController.swift
//  RecordatoriosProgramacion
//
//  Created by OSCAR on 24/9/22.
//

import UIKit
//import FirebaseCore
import FirebaseAuth

enum ProviderType: String {
    case basic
}

class LoginViewController: UIViewController {

   
    @IBOutlet weak var emailLoginTexfil: UITextField!
    
    @IBOutlet weak var contraseñaLoginTexfil: UITextField!
    
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

    }

    @IBAction func entrarLoginButtonAction(_ sender: Any) {

        
        }
    }
    


   
    


