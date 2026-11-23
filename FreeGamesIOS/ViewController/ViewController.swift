//
//  ViewController.swift
//  FreeGamesIOS
//
//  Created by Mananas on 23/11/2026.
//

import UIKit

class ViewController: UIViewController {
    
    var gameList: [Game] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task{
            gameList = await FreeToGameAPI.getGameList()
            
            DispatchQueue.main.async {
                print(self.gameList)
            }
        }
    }


}

