//
//  BattleShipViewController.swift
//  TicTacSukuna
//
//  Created by Диас Мухамедрахимов on 20.11.2023.
//

import UIKit

class BattleShipViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in firstPlayerButtons.indices {
            firstPlayerButtons[i].setTitle(String(i), for: .normal)
            firstPlayerButtons[i].isEnabled = false
        }
        for i in secondPlayerButtons.indices {
            secondPlayerButtons[i].setTitle(String(i), for: .normal)
        }
        print(firstPlayerIndecies)
        print(secondPlayerIndecies)
        game.firstIndecies = firstPlayerIndecies
        game.secondIndecies = secondPlayerIndecies
        
    }
    var firstPlayerIndecies: [Int] = []
    var secondPlayerIndecies: [Int] = []
    var game = BattleShipController()
    var counter = 1
    
    @IBOutlet var statusLabel: UILabel!
    @IBAction func firstPlayerButtonsClick(_ sender: UIButton) {
        let index = firstPlayerButtons.firstIndex(of: sender)!
        game.writeFirstShips(index: index)
        counter += 1
        updateView()
    }
    @IBAction func secondPlayerButtonsClick(_ sender: UIButton) {
        let index = secondPlayerButtons.firstIndex(of: sender)!
        game.writeSecondShips(index: index)
        counter += 1
        updateView()
    }
    
    @IBOutlet var firstPlayerButtons: [UIButton]!
  
    @IBOutlet var secondPlayerButtons: [UIButton]!
    
    func updateView(){
        if counter % 2 == 0 {
            for i in firstPlayerButtons{
                i.isEnabled = true
            }
            for i in secondPlayerButtons{
                i.isEnabled = false
            }
            statusLabel.text = "Second players turn"
        }
        else {
            for i in secondPlayerButtons{
                i.isEnabled = true
            }
            for i in firstPlayerButtons{
                i.isEnabled = false
            }
            statusLabel.text = "First players turn!"
        }
        for i in game.firstShips.indices {
            if game.firstShips[i].isWritten == true{
                firstPlayerButtons[i].backgroundColor = game.firstShips[i].background
                firstPlayerButtons[i].isEnabled = false
            }
        }
        for i in game.secondShips.indices {
            if game.secondShips[i].isWritten == true{
                secondPlayerButtons[i].backgroundColor = game.secondShips[i].background
                secondPlayerButtons[i].isEnabled = false
            }
        }
        
        if let status = game.win() {
            statusLabel.text = "\(status)"
            for i in firstPlayerButtons{
                i.isEnabled = false
            }
            for i in secondPlayerButtons{
                i.isEnabled = false
            }
        }
//        else if counter % 2 == 0 {
//
//        }
//        else {
//
//        }
    }
    
}
