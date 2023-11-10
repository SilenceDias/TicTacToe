//
//  ChoiceViewController.swift
//  TicTacSukuna
//
//  Created by Диас Мухамедрахимов on 02.11.2023.
//

import UIKit

class ChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayWithAi" {
            let destination = segue.destination as! ViewController
            destination.game.playWithAi = true
        }
    }

}
