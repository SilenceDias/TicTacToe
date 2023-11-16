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
        
        if segue.identifier == "Rating"{
            if LoginTextField.text != ""{
                if let index = Database.db.firstIndex(where: {$0.login == LoginTextField.text}){
                    Database.db[index].score! += 10
                }
                else{
                    Database.db.append(PlayerModel(login: LoginTextField.text, score: 10))

                }
                Database.db.sort(by: {$0.score! > $1.score!})
                
            }
        }
        
    }
    
}

