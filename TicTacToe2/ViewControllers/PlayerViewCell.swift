//
//  PlayerViewCell.swift
//  TicTacSukuna
//
//  Created by Диас Мухамедрахимов on 09.11.2023.
//

import UIKit

class PlayerViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var loginLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
