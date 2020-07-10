//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Abhijit Sarkar on 7/7/20.
//  Copyright © 2020 Abhijit Sarkar. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
             let task = session.dataTask(with: url) { (data, response, error) in
                if let safeData = data, error == nil {
                    do {
                        let results = try JSONDecoder().decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch {
                        print(error)
                    }
                } else {
                   print(error)
                   fatalError("Couldn't fetch posts")
               }
            }
            task.resume()
        }
    }
}
