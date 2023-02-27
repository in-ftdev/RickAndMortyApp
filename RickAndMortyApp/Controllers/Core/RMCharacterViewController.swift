//
//  RMCharacterViewController.swift
//  RickAndMortyApp
//
//  Created by Hai Nguyen on 06/02/2023.
//

import UIKit

class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        title = "Characters"
        
        
        
        
        RMService.shared.execute(RMRequest.listCharactersRequests, expecting: RMGetAllCharatersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: " + String(model.results.count))
                break
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
        
    }
    


}
