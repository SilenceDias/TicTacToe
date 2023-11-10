//
//  LoginViewController.swift
//  TicTacSukuna
//
//  Created by Диас Мухамедрахимов on 09.11.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var LoginTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! RatingViewController
        destination.arrayPlayers.append(PlayerModel(login: LoginTextField.text, score: 10))
        
    }
    
}

