//
//  ViewController.swift
//  FreeGamesIOS
//
//  Created by Mananas on 23/11/2026.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    var gameList: [Game] = []
    var allGames: [Game] = []

    @IBOutlet weak var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableVIew.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
                searchController.searchBar.delegate = self
                navigationItem.searchController = searchController
        
        Task{
            let games = await FreeToGameAPI.getGameList()
            
            DispatchQueue.main.async {
                self.allGames = games
                self.gameList = games
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

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                gameList = allGames
            } else {
                gameList = allGames.filter { it in
                    it.title.lowercased().contains(searchText.lowercased()) ||
                    it.genre.lowercased().contains(searchText.lowercased())
                }
            }
            tableVIew.reloadData()
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            gameList = allGames
            tableVIew.reloadData()
        }
        
        /*
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let detailViewController = segue.destination as! DetailViewController
            let indexPath = tableVIew.indexPathForSelectedRow!
            let game = gameList[indexPath.row]
            detailViewController.game = game
            tableVIew.deselectRow(at: indexPath, animated: false)
        } */
}

