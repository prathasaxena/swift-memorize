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
    var previousCardIndex : Int? {
        get {
            let isUp = cards.filter({$0.isFaceUp}).oneAndOnly
            return cards.firstIndex(where: { $0.id == isUp?.id })
        }
        set {
            cards.indices.forEach({ cards[$0].isFaceUp = ($0 == newValue)})
        }
    }
    
    mutating func chooseCards(card selectedCard: CardType) {
        if let index = cards.firstIndex(where: {$0.id == selectedCard.id}),!cards[index].isFaceUp, !cards[index].isMatched {
            if let prevCard = previousCardIndex {
                if(cards[prevCard].content == cards[index].content){
                    cards[prevCard].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp.toggle()
            } else {
                previousCardIndex = index
            }
            
        }
    }
    
    init(theme: Theme,count: Int, setContent: (_ theme: Theme, _ index: Int) -> CardContent ) {
        self.theme = theme
        self.cards = []
        for i in 0..<count {
            let content = setContent(theme, i)
            cards.append(CardType(id: i * 2 + 1, content: content))
            cards.append(CardType(id: i * 2 + 2, content: content))
           
        }
        self.cards = cards.shuffled()
    }
    
    
    
    struct CardType : Identifiable {
        var id : Int
        var content: CardContent
        var isFaceUp : Bool = false
        var isMatched: Bool = false
    }
    
    public enum Theme: String {
        case Vehicle = "Vehicle"
        case Smiley = "Smiley"
        case Animals = "Animals"
    }
}

extension Array {
    var oneAndOnly : Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
    
}
