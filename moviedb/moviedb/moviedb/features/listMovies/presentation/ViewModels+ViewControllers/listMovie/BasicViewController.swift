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
    
    func navigateToMovieDetails(item: Movie?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController else {
            return
        }
        
        // Pass the movie item to the MovieDetailsViewController
        //        viewController.movie = item
        
        if let topController = UIApplication.topViewController() {
            if let navigationController = topController.navigationController {
                navigationController.pushViewController(viewController, animated: true)
            } else {
                let navigationController = UINavigationController(rootViewController: viewController)
                navigationController.setNavigationBarHidden(true, animated: false)
                topController.present(navigationController, animated: true, completion: nil)
            }
        }
    }
}



extension UIApplication {
    class func topViewController(viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(viewController: nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(viewController: selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(viewController: presented)
        }
        return viewController
    }
}
