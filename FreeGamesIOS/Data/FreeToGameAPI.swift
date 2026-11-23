//
//  FreeToGameAPI.swift
//  FreeGamesIOS
//
//  Created by Mananas on 23/11/2026.
//

import Foundation

class FreeToGameAPI {
    
    static let BASE_URL = "https://www.freetogame.com/api"
    
    static func getGameList() async -> [Game]{
        
        guard let url = URL(string: "\(FreeToGameAPI.BASE_URL)/games") else {
            print("Invalid URL")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            /*if let str = String(data: data, encoding: .utf8){
                print("Successfully decoded: \(str)")
            }*/
            
            return try JSONDecoder().decode([Game].self, from: data)
            
        } catch {
            print("Invalid data")
            return []
        }
    }
    
    static func getGameById(id: Int) async -> Game? {
        
        guard var url = URL(string: "\(FreeToGameAPI.BASE_URL)/game?id=\(id)") else {
            print("Invalid URL")
            return nil
        }
        
       /* url.append(queryItems: [URLQueryItem(name: "id", value: "\(id)")]) */
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            /*if let str = String(data: data, encoding: .utf8){
                print("Successfully decoded: \(str)")
            }*/
            
            return try JSONDecoder().decode(Game.self, from: data)
           
        } catch {
            print("Invalid data")
            return nil
        }
        
    }
}
