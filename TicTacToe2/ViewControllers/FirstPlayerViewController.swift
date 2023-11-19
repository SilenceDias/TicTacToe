//
//  FirstPlayerViewController.swift
//  TicTacSukuna
//
//  Created by Диас Мухамедрахимов on 20.11.2023.
//

import UIKit

class FirstPlayerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isHidden = true
        for i in buttons.indices {
            buttons[i].setTitle(String(i), for: .normal)
        }
    }
    var chooseIndex: [Int] = []
    @IBOutlet var remainShipsLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    var choice = ChoiceShipsController()
    
    @IBAction func buttonClick(_ sender: UIButton) {
        let index = buttons.firstIndex(of: sender)!
        choice.writeShip(index: index)
        chooseIndex.append(index)
        print(chooseIndex)
        updateView()
        
    }
    
    func updateView(){
        for i in choice.ships.indices{
            if choice.ships[i].isWritten == true{
                buttons[i].backgroundColor = choice.ships[i].background
                buttons[i].isEnabled = false
                
            }
            if choice.shipsCounter == 0 {
                for i in buttons{
                    i.isEnabled = false
                }
                nextButton.isHidden = false
            }
            remainShipsLabel.text = "\(choice.shipsCounter) Ships Remain"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! SecondPlayerViewController
        destination.firstPlayerIndecies = chooseIndex
    }
    
    

 

}
