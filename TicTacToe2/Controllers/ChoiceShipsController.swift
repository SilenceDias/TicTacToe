//
//  ChoiceShipsController.swift
//  TicTacSukuna
//
//  Created by Диас Мухамедрахимов on 20.11.2023.
//

import Foundation
import UIKit

class ChoiceShipsController {
    var shipsCounter = 6
    var ships: [ShipButtonModel] = []
    
    init(){
        for _ in 0...24 {
            let ship = ShipButtonModel()
            ships.append(ship)
        }
    }
    func writeShip(index: Int){
        if shipsCounter != 0 {
            ships[index].background = UIColor.red
            ships[index].isWritten = true
        }
        shipsCounter -= 1
        
    }
}
