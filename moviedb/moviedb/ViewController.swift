//
//  ViewController.swift
//  moviedb
//
//  Created by Ahmed samy on 17/07/2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func testMethod(_ sender: Any) {
        
        ApiClient.shared.call(webserviceType: WebserviceType.popular,
                              success: { response in
            let reponseItem = ListMovieApiResponseDataMapper.fromApiMap(response: response)
            print(reponseItem)
            
        },
                              failed: { _ in
            
        })
        
    }
    
    
}
