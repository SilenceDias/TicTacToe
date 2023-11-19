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
    var choice = 1
    @IBOutlet var ThemeCollectionView: UICollectionView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        if segue.identifier == "PlayWithAi" {
            
            destination.game.playWithAi = true
          
        }
        destination.choiceBackground = choice
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = ThemeCollectionView.cellForItem(at: indexPath) as? ThemeCollectionViewCell
        cell?.contentView.backgroundColor = .red
        choice = indexPath.row
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = ThemeCollectionView.cellForItem(at: indexPath) as? ThemeCollectionViewCell
        cell?.contentView.backgroundColor = .clear
    }
    
}
