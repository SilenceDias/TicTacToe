//
//  ChoiceViewController.swift
//  TicTacSukuna
//
//  Created by Диас Мухамедрахимов on 02.11.2023.
//

import UIKit

class ChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeCollectionView.dataSource = self
        ThemeCollectionView.delegate = self

    }
    @IBOutlet var ThemeCollectionView: UICollectionView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayWithAi" {
            let destination = segue.destination as! ViewController
            destination.game.playWithAi = true
        }
    }

}
extension ChoiceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Database.theme.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ThemeCollectionView.dequeueReusableCell(withReuseIdentifier: "Theme", for: indexPath) as! ThemeCollectionViewCell
        cell.image.image = Database.theme[indexPath.row].image
        cell.nameTheme.text = Database.theme[indexPath.row].name
        return cell
    }
    
    
}
