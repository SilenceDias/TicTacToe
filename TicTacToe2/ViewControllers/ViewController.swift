//
//  ViewController.swift
//  TicTacToe2
//
//  Created by Диас Мухамедрахимов on 19.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true
        loginButton.isHidden = true
        if choiceBackground == 0{
            backgroundImahe.image = UIImage(named: "sukunaTrueFormBack")
            for i in buttons{
                i.backgroundColor = .blue
            }
        }
        else if choiceBackground == 1{
            backgroundImahe.image =  UIImage(named: "sukunaBack")
        }
        else if choiceBackground == 2{
            backgroundImahe.image = UIImage(named: "manga")
            for i in buttons{
                i.backgroundColor = .red
            }
        }
    }
    var choiceBackground = 1
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var drawsLabel: UILabel!
    @IBOutlet var xWinsLabel: UILabel!
    @IBOutlet var oWinsLabel: UILabel!
    @IBOutlet var resetButton: UIButton!
    var game = TicTacController()
    @IBOutlet var buttons: [UIButton]!
    @IBAction func buttonClick(_ sender: UIButton) {
        let index = buttons.firstIndex(of: sender)!
        game.writeXO(index: index)
        updateView()
    }
    @IBOutlet var winningLabel: UILabel!
    
    @IBAction func resetButtonClick(_ sender: Any) {
        game.reset()
        updateView()
        for i in buttons{
            i.isEnabled = true
        }
        winningLabel.text = ""
//        xWinsLabel.text = "ITADORI WINS:  \(game.itadoriWins)"
//        oWinsLabel.text = "SUKUNA WINS: \(game.sukunaWins)"
//        drawsLabel.text = "DRAWS:  \(game.draws)"
        resetButton.isHidden = true
        loginButton.isHidden = true
    }
    @IBOutlet var backgroundImahe: UIImageView!
    func updateView() {
        for i in game.XOs.indices {
            if game.XOs[i].isWritten {
                buttons[i].setBackgroundImage(game.XOs[i].background, for: .normal)
                buttons[i].isEnabled = false
            }
            else{
                buttons[i].setBackgroundImage(nil, for: .normal)
            }
        }
        if let win = game.win(){
            winningLabel.text = "\(win)"
            resetButton.isHidden = false
            loginButton.isHidden = false
            for i in buttons{
                i.isEnabled = false
            }
        }
}
    }

