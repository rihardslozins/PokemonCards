//
//  ViewController.swift
//  PokemonCards
//
//  Created by Rihards Lozins on 09/02/2021.
//

import UIKit

class PokemonViewController: UIViewController {
    
    var pokey : [Pokemon] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokemons"
        getPokemonData()
        
    }
    func getPokemonData(){
        
        let url = URL(string: "https://api.pokemontcg.io/v1/cards")!
        
        NetworkController.performRequest(for: url, httpMethod: .get) {(data, err) in
            if let error = err {
                print("getting err from url \(url.absoluteString) , error: \(error.localizedDescription)")
            }
            
            if let data = data {
                do{
                    
                    let card = try JSONDecoder().decode(Card.self, from: data)
                    self.pokey = card.cards
                }catch{
                    print("failed to decode pokemon data \(error) , data: \(data)")
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }else{
                print("data is nil")
            }
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "pokemonDetail" {
            
            if let vc = segue.destination as? PokemonDetailViewController, let row = tableView.indexPathForSelectedRow?.row {
                
                vc.pokemon = pokey[row]
                
            }
        }
    }
    
}

extension PokemonViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokeyTableViewCell else {
            return UITableViewCell()
        }
        
        //        cell.textLabel?.text = pokey[indexPath.row].name
        //
        //        cell.detailTextLabel?.text = pokey[indexPath.row].subtype
        
        let poke = pokey[indexPath.row]
        cell.setUI(with: poke)
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}
