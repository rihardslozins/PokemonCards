//
//  PokeyTableViewCell.swift
//  PokemonCards
//
//  Created by Rihards Lozins on 10/02/2021.
//

import UIKit

class PokeyTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var pokeyImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtypeLabel: UILabel!
    @IBOutlet weak var cardValue: UILabel!
    @IBOutlet weak var supertypeLabel: UILabel!
    
    func setUI (with: Pokemon){
        
        nameLabel.text = "Name: " + with.name
        
        subtypeLabel.text = "Stage: " + with.subtype
        
        supertypeLabel.text = with.supertype
        
        cardValue.text = "Power: " + with.number
        
        ImageController.getImage(for: with.imageUrl ?? "", completion: { image in self.pokeyImageView.image = image
        })
        
    }
}
