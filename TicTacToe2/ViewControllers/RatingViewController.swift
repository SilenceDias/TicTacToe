//
//  RatingViewController.swift
//  TicTacSukuna
//
//  Created by Диас Мухамедрахимов on 09.11.2023.
//

import UIKit

class RatingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        RatingTableView.dataSource = self
        RatingTableView.delegate = self
    }
    var arrayPlayers:[PlayerModel] = [PlayerModel(login: "Silince", score: 10), PlayerModel(login: "Dias", score: 8), PlayerModel(login: "John", score: 4)]
    @IBOutlet var RatingTableView: UITableView!
    
}
extension RatingViewController:UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RatingTableView.dequeueReusableCell(withIdentifier: "PlayerViewCell") as! PlayerViewCell
        cell.loginLabel.text = arrayPlayers[indexPath.row].login
        cell.profilePic.image = arrayPlayers[indexPath.row].image
        cell.scoreLabel.text = "\(arrayPlayers[indexPath.row].score ?? 0)"
        return cell
        
    }
    
    
}
