//
//  PokemonDetailViewController.swift
//  PokemonCards
//
//  Created by Rihards Lozins on 09/02/2021.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var pokemon: Pokemon?
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeRarity: UILabel!
    @IBOutlet weak var pokeNumber: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let pokemon = pokemon {
            ImageController.getImage(for: pokemon.imageUrl ?? "") { (image) in
                self.pokemonImageView.image = image
            }
        }else{
            print("pokemon image is nil")
        }
        
        pokeName.text = "Poke - \(pokemon?.name ?? "No name")"
        pokeRarity.text = "Rarity - \(pokemon?.rarity ?? "Rarity info not available")"
        pokeNumber.text = "No - \(pokemon?.number ?? "No number to show")"
    }
}
