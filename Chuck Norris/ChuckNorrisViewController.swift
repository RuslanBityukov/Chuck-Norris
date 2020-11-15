//
//  ChuckNorrisViewController.swift
//  Chuck Norris
//
//  Created by Руслан Битюков on 15.11.2020.
//

import UIKit

class ChuckNorrisViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    
    let url = "https://api.chucknorris.io/jokes/random"
    
    @IBAction func buttomRandomTap() {
        NetworkManager.fetchInfo(url: url) { (Model) in
            guard let stringUrl = Model.icon_url else { return }
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageDate = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.label.text = Model.value
                self.imageView.image = UIImage(data: imageDate)
            }
        }
    }
}
   
