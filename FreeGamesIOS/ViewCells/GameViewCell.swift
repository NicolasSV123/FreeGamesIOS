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
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var platformImage: UIImageView!

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardShadowView: UIView!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.cornerRadius = 24
        cardView.layer.masksToBounds = true
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        cardShadowView.layer.cornerRadius = 24
        cardShadowView.layer.shadowRadius = 2
        cardShadowView.layer.shadowOpacity = 1
        cardShadowView.layer.shadowOffset = CGSize(width: 4, height: 4)
        cardShadowView.layer.shadowColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render(with game: Game){
        titleLabel.text = game.title
        thumbnailImageView.loadFrom(url: game.thumbnail)
        descriptionLabel.text = game.shortDescription
        genreLabel.text = game.genre
        if game.platform.contains("Windows") {
            platformImage.image = UIImage(systemName: "desktopcomputer")
        } else {
            platformImage.image = UIImage(systemName: "safari.fill")
        }
    }
}
