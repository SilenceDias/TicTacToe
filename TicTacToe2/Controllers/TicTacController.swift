//
//  TicTacController.swift
//  TicTacSukuna
//
//  Created by Диас Мухамедрахимов on 02.11.2023.
//

import Foundation
import UIKit

class TicTacController {
    
    var counter = 0
    var itadoriWins = 0
    var sukunaWins = 0
    var draws = 0
    var personPlayX = true
    var XOs: [XOModel] = []
    let winCombination: [[Int]] = [
        [0,1,2], [3,4,5], [6,7,8],
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [2,4,6]
    ]
    let sukunaImage = UIImage(named: "sukuna2")
    let itadoriImage = UIImage(named: "itadori3")
    var playWithAi = false
    
    init(){
        for _ in 0...8 {
            let XO = XOModel()
            XOs.append(XO)
        }
    }
    
    func writeXO(index: Int){
        counter += 1
        if counter % 2 == 0{
            XOs[index].background = sukunaImage
        }
        else {
            XOs[index].background = itadoriImage
            
        }
        XOs[index].isWritten = true
        var randomChoice = aiChoice()
        if playWithAi && counter < 9 {
            
            while XOs[randomChoice].isWritten == true {
                randomChoice = aiChoice()
            }
            counter += 1
            if counter % 2 == 0{
                XOs[randomChoice].background = sukunaImage
            }
            else {
                XOs[randomChoice].background = itadoriImage
            }
           
            XOs[randomChoice].isWritten = true
        }
    }
    func aiChoice() -> Int {
        var choice = 0
        if let takeWin = checkIsAiWinnig(isX: personPlayX){
            choice = takeWin
            return choice
        }
        if let destroyWin = checkIsPlayerWinning(isX: personPlayX){
            choice = destroyWin
            return choice
        }
        else {
            choice = Int.random(in: 0...8)
        }
//        if XOs[0].background == itadoriImage && personPlayX
//                    || XOs[8].background == itadoriImage && personPlayX
//                    || XOs[2].background == itadoriImage && personPlayX
//                    || XOs[6].background == itadoriImage && personPlayX{
//            if XOs[4].isWritten == false{
//                choice = 4
//            }
//            else if XOs[0].isWritten == false {
//                choice = 0
//            }
//            else if XOs[2].isWritten == false {
//                choice = 2
//            }
//            else if XOs[6].isWritten == false {
//                choice = 6
//            }
//            else if XOs[8].isWritten == false {
//                choice = 2
//            }
//            return choice
//        }
//        else if XOs[0].background == sukunaImage && personPlayX == false
//                    || XOs[8].background == sukunaImage && personPlayX == false
//                    || XOs[2].background == sukunaImage && personPlayX == false
//                    || XOs[6].background == sukunaImage && personPlayX == false{
//            if XOs[4].isWritten == false{
//                choice = 4
//            }
//            else if XOs[0].isWritten == false {
//                choice = 0
//            }
//            else if XOs[2].isWritten == false {
//                choice = 2
//            }
//            else if XOs[6].isWritten == false {
//                choice = 6
//            }
//            else if XOs[8].isWritten == false {
//                choice = 2
//            }
//            return choice
//        }
//        for i in XOs.indices{
//            if XOs[0].background == nil && XOs[2].background == nil && XOs[6].background == nil && XOs[8].background == nil{
//                if XOs[i].isWritten == false{
//                    choice = i
//                }
//            }
//           
//        }
        
       return choice
    }
    func checkIsPlayerWinning(isX: Bool) -> Int? {
        for i in winCombination{
            if XOs[i[0]].background == XOs[i[1]].background &&
                XOs[i[0]].isWritten == true && XOs[i[2]].isWritten == false && XOs[i[1]].isWritten == true{
                if XOs[i[0]].background == UIImage(named: "itadori3") && isX == true{
                    return i[2]
                }
                else if XOs[i[0]].background == UIImage(named: "sukuna2") && isX == false{
                    return i[2]
                }
                
            }
            else if XOs[i[0]].background == XOs[i[2]].background && 
                        XOs[i[0]].isWritten == true && XOs[i[1]].isWritten == false && XOs[i[2]].isWritten == true{
                if XOs[i[0]].background == UIImage(named: "itadori3") && isX == true{
                    return i[1]
                }
                else if XOs[i[0]].background == UIImage(named: "sukuna2") && isX == false{
                    return i[1]
                }
            }
            else if XOs[i[1]].background == XOs[i[2]].background && XOs[i[1]].isWritten == true
                        && XOs[i[0]].isWritten == false && XOs[i[2]].isWritten == true{
                if XOs[i[1]].background == UIImage(named: "itadori3") && isX == true{
                    return i[0]
                }
                else if XOs[i[1]].background == UIImage(named: "sukuna2") && isX == false{
                    return i[0]
                }
            }
        }
        return nil
    }
    func checkIsAiWinnig(isX: Bool) -> Int?{
        for i in winCombination{
            if XOs[i[0]].background == XOs[i[1]].background &&
                XOs[i[0]].isWritten == true && XOs[i[2]].isWritten == false && XOs[i[1]].isWritten == true{
                if XOs[i[0]].background == UIImage(named: "itadori3") && isX == false{
                    return i[2]
                }
                else if XOs[i[0]].background == UIImage(named: "sukuna2") && isX == true{
                    return i[2]
                }
                
            }
            else if XOs[i[0]].background == XOs[i[2]].background && XOs[i[0]].isWritten == true
                        && XOs[i[1]].isWritten == false && XOs[i[2]].isWritten == true{
                if XOs[i[0]].background == UIImage(named: "itadori3") && isX == false{
                    return i[1]
                }
                else if XOs[i[0]].background == UIImage(named: "sukuna2") && isX == true{
                    return i[1]
                }
            }
            else if XOs[i[1]].background == XOs[i[2]].background && XOs[i[1]].isWritten == true
                        && XOs[i[0]].isWritten == false && XOs[i[2]].isWritten == true{
                if XOs[i[1]].background == UIImage(named: "itadori3") && isX == false{
                    return i[0]
                }
                else if XOs[i[1]].background == UIImage(named: "sukuna2") && isX == true{
                    return i[0]
                }
            }
        }
        return nil
    }
    func win() -> String?{
        for i in winCombination{
            if XOs[i[0]].background == XOs[i[1]].background &&
                XOs[i[1]].background == XOs[i[2]].background &&
                XOs[i[0]].isWritten == true{
                if XOs[i[1]].background == UIImage(named: "itadori3"){
                    itadoriWins += 1
                    return "ITADORI WON!"
                    
                }
                else {
                    sukunaWins += 1
                    return "SUKUNA WON!"
                }
            }
            if counter == 9{
                draws += 1
                return "Draw"
            }
        }
        
        return nil
    }
    
    func reset(){
        counter = 0
        for i in XOs.indices {
            XOs[i].background = nil
            XOs[i].isWritten = false
        }
        
        if personPlayX  {
            
            if playWithAi{
                var randomChoice = aiChoice()
                XOs[randomChoice].background = itadoriImage
                XOs[randomChoice].isWritten = true
                counter += 1
            }
            
        }
        personPlayX.toggle()
    }
    
}
