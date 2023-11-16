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
    @IBOutlet var RatingTableView: UITableView!
    
}
extension RatingViewController:UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Database.db.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RatingTableView.dequeueReusableCell(withIdentifier: "PlayerViewCell") as! PlayerViewCell
        cell.loginLabel.text = Database.db[indexPath.row].login
        cell.profilePic.image = Database.db[indexPath.row].image
        cell.scoreLabel.text = "\(Database.db[indexPath.row].score ?? 0)"
        
        return cell
        
    }
    
    
}
