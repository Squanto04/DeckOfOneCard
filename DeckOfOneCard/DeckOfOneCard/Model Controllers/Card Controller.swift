//
//  Card Controller.swift
//  DeckofOneCard
//
//  Created by Jordan Lamb on 9/30/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation
import UIKit

class CardController {
    
    // Step 1 - Create the URL
    private static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/")
    
    static func drawCard(numberOfCards: Int, completion: @escaping ((_ card: [Card]) -> Void)) {
        
        // First get the URL
        guard let url = self.baseURL else {fatalError("URL optional is nil")}
        
        // Build URL with whatever components or Query items as needed.
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let cardCountQueryItem = URLQueryItem(name: "count", value: "\(numberOfCards)")
        components?.queryItems = [cardCountQueryItem]
        guard let finalURL = components?.url else { return }
        print(finalURL)
        
        // Start the dataTask
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error decoding the Data: \(error.localizedDescription)")
            }
            // If there is no error - let's try to decode it
            do {
                guard let data = data else { return }
                let jsonDecoder = JSONDecoder()
                let deck = try! jsonDecoder.decode(TopLevelDictionary.self, from: data)
                completion(deck.cards)
            }
            /* There is not going to be a catch because there should always be data from "guard let data = data else { return }
                catch {
                completion([])
                return
             }
            */
        }
        dataTask.resume()
    } // End of drawCard Function
    
    static func getImage(forURL urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let finalURL = URL(string: urlString) else { return }
        // Start the dataTask
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            // Check for the error
            if let error = error {
                print("Error retriving the image: \(error.localizedDescription)")
            }
            // Check for the data
            guard let data = data else { return }
            // If I have data - then I can get my image
            guard let image = UIImage(data: data) else { return }
            completion(image)
        }
        dataTask.resume()
    } // End of getImage Function
    
} // End of Class
