//
//  MemorizeVM.swift
//  memorize
//
//  Created by Pratha Saxena on 17/10/22.
//

import Foundation

class MemorizeVM : ObservableObject {
    static let animals = [ "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁"]
    static let smileys = [ "😀", "😃", "😄", "🥲", "☺️", "😊", "😇", "😍", "🥰", "😘", "🤓", "🥸" ]
    static let vehicles = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚" ]
    
    typealias Cards = MemorizeModel<String>.CardType
    typealias Theme = MemorizeModel<String>.Theme
    var theme : Theme = .Smiley
    

    
    static func initializeMemorize(setTheme theme: Theme, count arrayLength : Int) -> MemorizeModel<String> {
        MemorizeModel<String>(theme: theme, count: arrayLength) { theme , index in
        switch theme {
            case .Animals :
                return animals[index]
            case .Smiley :
                return smileys[index]
            case .Vehicle :
                return vehicles[index]
            }
        }
    }
    
    @Published var model = initializeMemorize(setTheme : .Smiley, count: smileys.count)
    
    var cards : [Cards] {
        return model.cards
    }
    
    //use intent
    func selectTheme(selected theme : String) {
        
    }
    
}


