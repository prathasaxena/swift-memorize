//
//  MemorizeModel.swift
//  memorize
//
//  Created by Pratha Saxena on 17/10/22.
//
//var previousCardIndex : Int? {
//    get {
//    let previousCard : CardType?
//       let numOfCardsUp = cards.filter { card in card.isFaceUp }
//        if(numOfCardsUp.count == 1) {
//             previousCard = numOfCardsUp.first
//        } else {
//            previousCard = nil
//        }
//        if let pc = previousCard {
//            return nil
//        }
//        return nil
//    }
//    set {
//
//    }
//}

import Foundation

struct MemorizeModel<CardContent> where CardContent: Equatable {
    private(set) var cards : [CardType]
    var theme: Theme
    var previousCardIndex : Int? {
        get {
            let isUp = cards.filter({$0.isFaceUp})
            if(isUp.count == 1){
                let carde  = isUp.first
                return cards.firstIndex(where: { $0.id == carde?.id })
            }
            return nil
        }
        set {
            for var card in cards {
                card.isFaceUp = false
            }
        }
    }
    
    mutating func chooseCards(card selectedCard: CardType) {
        let index = cards.firstIndex(where: {$0.id == selectedCard.id})!
        cards[index].isFaceUp.toggle()
//        print(cards)
//        if let previousIndex = previousCardIndex, !selectedCard.isFaceUp, !selectedCard.isMatched {
//            cards[index].isFaceUp = true
//                if(selectedCard.content == cards[previousIndex].content){
//                    cards[previousIndex].isMatched = true
//                    cards[index].isMatched = true
//                }
//            previousCardIndex = nil
//        } else {
//            cards[index].isFaceUp = true
//        }
        
    }
    
    init(theme: Theme,count: Int, setContent: (_ theme: Theme, _ index: Int) -> CardContent ) {
        self.theme = theme
        self.cards = []
        for i in 0..<count {
            let content = setContent(theme, i)
            cards.append(CardType(id: i * 2 + 1, content: content))
            cards.append(CardType(id: i * 2 + 2, content: content))
        }
    }
    
    
    
    struct CardType : Identifiable {
        var id : Int
        var content: CardContent
        var isFaceUp : Bool = true
        var isMatched: Bool = false
    }
    
    public enum Theme: String {
        case Vehicle = "Vehicle"
        case Smiley = "Smiley"
        case Animals = "Animals"
    }
}
