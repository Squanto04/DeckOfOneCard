//
//  CardViewController.swift
//  DeckofOneCard
//
//  Created by Jordan Lamb on 9/30/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var drawCardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designDrawCardButton()
    }
    
    @IBAction func drawCardButtonTapped(_ sender: Any) {
        drawCard()
    }
    
    
    // MARK: - Helper Functions
    func drawCard() {
        CardController.drawCard(numberOfCards: 1) { (cards) in
            let card = cards[0]
            CardController.getImage(forURL: card.image) { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.cardImageView.image = image
                }
            }
        }
    }
    
    func designDrawCardButton() {
        drawCardButton.layer.borderWidth = 2
        drawCardButton.layer.borderColor = UIColor.black.cgColor
        drawCardButton.layer.cornerRadius = drawCardButton.frame.height / 2
        drawCardButton.setTitle("Draw a new card!", for: .normal)
        drawCardButton.backgroundColor = .cyan
        drawCardButton.setTitleColor(.black, for: .normal)
    }
}
