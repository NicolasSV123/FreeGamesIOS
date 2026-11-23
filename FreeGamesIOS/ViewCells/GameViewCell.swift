//
//  GameViewCell.swift
//  FreeGamesIOS
//
//  Created by Mananas on 23/11/2026.
//

import UIKit

class GameViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render(with game: Game){
        titleLabel.text = game.title
    }

}
