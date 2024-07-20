//
//  ImageLoader.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation
import UIKit


class ImageLoader {

    static let shared = ImageLoader()
    private let cache = NSCache<NSURL, UIImage>()

    private init() {}

    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        // Check if the image is already cached
        if let cachedImage = cache.object(forKey: url as NSURL) {
            completion(cachedImage)
            return
        }

        // Perform the image loading on a background queue
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                // Cache the loaded image
                self.cache.setObject(image, forKey: url as NSURL)

                // Once the image is loaded, switch back to the main queue to update the UI
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                // Handle error by returning nil
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
