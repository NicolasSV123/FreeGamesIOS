//
//  ViewController.swift
//  FreeGamesIOS
//
//  Created by Mananas on 23/11/2026.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var gameList: [Game] = []

    @IBOutlet weak var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableVIew.dataSource = self
        
        Task{
            gameList = await FreeToGameAPI.getGameList()
            
            DispatchQueue.main.async {
                print(self.gameList)
                self.tableVIew.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Game Cell", for: indexPath) as! GameViewCell
        let game = gameList[indexPath.row]
        cell.render(with: game)
        return cell
    }
}

