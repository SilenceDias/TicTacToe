//
//  Database.swift
//  TicTacSukuna
//
//  Created by Диас Мухамедрахимов on 11.11.2023.
//

import Foundation
import UIKit
struct Database {
    static var db:[PlayerModel] = []
    static var theme:[Theme] = [Theme(image: UIImage(named: "sukunaTrueFormBack"), name: "Sukuna X Itadori"), Theme(image: UIImage(named: "sukunaBack"), name: "Sukuna Domain"),
                                Theme(image: UIImage(named: "manga"), name: "Manga Panels")]
}
