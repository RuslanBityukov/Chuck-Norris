//
//  NetworkManager.swift
//  Chuck Norris
//
//  Created by Руслан Битюков on 16.11.2020.
//
import Foundation

class NetworkManager {
    
    static func fetchInfo(url: String, completion: @escaping (Model) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            if let error = error {
                print(error)
                return
            }
            do {
                let json = try JSONDecoder().decode(Model.self, from: data)
                completion(json)
            } catch let error as NSError{
                print(error)
            }
        }.resume()
    }
}

