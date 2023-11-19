//
//  BattleShipController.swift
//  TicTacSukuna
//
//  Created by Диас Мухамедрахимов on 20.11.2023.
//

import Foundation
import UIKit

class BattleShipController {
    var firstIndecies: [Int] = []
    var secondIndecies: [Int] = []
    var firstShips: [ShipButtonModel] = []
    var secondShips: [ShipButtonModel] = []
    var firstDestroyedShipsCounter = 0
    var secondDestroyedShipsCounter = 0
    
    init(){
        for _ in 0...24 {
            let firstShip = ShipButtonModel()
            firstShips.append(firstShip)
            let secindShip = ShipButtonModel()
            secondShips.append(secindShip)
        }
    }
    
    func writeFirstShips(index: Int){
    
        if firstIndecies.contains(index){
            firstShips[index].background = UIColor.red
            firstDestroyedShipsCounter += 1
        }
        else {
            firstShips[index].background = UIColor.blue
        }
        firstShips[index].isWritten = true
    }
    func writeSecondShips(index: Int){
    
        if secondIndecies.contains(index){
            secondShips[index].background = UIColor.red
            secondDestroyedShipsCounter += 1
        }
        else {
            secondShips[index].background = UIColor.blue
        }
        secondShips[index].isWritten = true
    }
    func win() -> String?{
        if firstDestroyedShipsCounter == 6 {
            return "Second Player Won!"
        }
        else if secondDestroyedShipsCounter == 6 {
            return "First Player won!"
        }
        else {
            return nil
        }
    }
}
