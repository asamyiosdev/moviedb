//
//  BasicViewController.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import UIKit

class BasicViewController: UIViewController {
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupActivityIndicator()
    }
    
    
    // MARK: - Private Methods
    
    private func setupActivityIndicator() {
        // Add the activity indicator to the view
        self.view.addSubview(activityIndicator)
        
        // Center the activity indicator
        activityIndicator.center = view.center
        
        // Configure the activity indicator
        activityIndicator.color = .blue
        activityIndicator.hidesWhenStopped = true
    }
    
    // MARK: - showLoading Methods
    
    func showLoading() {
        // Show the activity indicator
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
        
    }
    
    func hideLoading() {
        // Hide the activity indicator
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
    
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
