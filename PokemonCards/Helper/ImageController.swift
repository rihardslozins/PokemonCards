//
//  ImageController.swift
//  PokemonCards
//
//  Created by Rihards Lozins on 09/02/2021.
//

import UIKit

class ImageController {
    
    static func getImage(for url: String, completion: @escaping(UIImage?) -> Void ){
        
        guard let imageUrl = URL(string: url) else{
            fatalError("Could not create URL form this String \(url)")
            
        }
        
        NetworkController.performRequest(for: imageUrl, httpMethod: .get) { (data, err) in
            guard let data = data, let image = UIImage(data: data) else {
                
                DispatchQueue.main.async { completion(nil) }
                return
            }
            
            DispatchQueue.main.async { completion(image) }
        }
    }
}
