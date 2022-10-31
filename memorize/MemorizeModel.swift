//
//  MemorizeModel.swift
//  memorize
//
//  Created by Pratha Saxena on 17/10/22.
//

import Foundation

struct MemorizeModel<CardContent> where CardContent: Equatable {
    private(set) var cards : [CardType]
    var theme: Theme
    
//    func chooseCards(card selectedCard: CardType) {
//        
//    }
    
    init(theme: Theme,count: Int, setContent: (_ theme: Theme, _ index: Int) -> CardContent ) {
        self.theme = theme
        self.cards = []
        for i in 0..<count {
            let content = setContent(theme, i)
            cards.append(CardType(id: i * 2 + 1, content: content))
//            cards.append(CardType(id: i * 2 + 2, content: content))
        }
    }
    
    
    
    struct CardType : Identifiable {
        var id : Int
        var content: CardContent
        var isFaceUp : Bool = true
        var isMatched: Bool = false
    }
    
    enum Theme {
        case Vehicle
        case Smiley
        case Animals
    }
}
