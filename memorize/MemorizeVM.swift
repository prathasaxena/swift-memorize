//
//  MemorizeVM.swift
//  memorize
//
//  Created by Pratha Saxena on 17/10/22.
//

import Foundation

class MemorizeVM : ObservableObject {
    @Published private var model = initializeMemorize(setTheme : .Smiley, count: defaultCount)
    
    static private let animals = [ "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁","🐍", "🦚", "🦥"]
    static private let smileys = [ "😀", "😃", "😄", "🥲", "☺️", "😊", "😇", "😍", "🥰", "😘" ]
    static private let vehicles = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚" ]
    
    var ThemeAvailable = MemorizeModel<String>.Theme.self
    typealias Cards = MemorizeModel<String>.CardType
    typealias Theme = MemorizeModel<String>.Theme
    var theme : Theme = .Smiley
    static var defaultCount = 10
    static func getNumArray(theme : Theme) -> Int {
        switch theme {
            case .Animals :
              return animals.count
            case .Smiley :
              return smileys.count
            case .Vehicle :
              return vehicles.count
            default :
              return 0
            }
    }

    
    static func initializeMemorize(setTheme theme: Theme, count arrayLength : Int) -> MemorizeModel<String> {
        let arrayLength =  getNumArray(theme: theme)
        return MemorizeModel<String>(theme: theme, count: arrayLength) { theme , index in
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
    
   
    
    var cards : [Cards] {
        model.cards
    }
    
  

    
    //use intent
    func selectTheme(selected theme : Theme) {
        model = MemorizeVM.initializeMemorize(setTheme: theme, count: MemorizeVM.defaultCount)
    }
    
    func selectCard(selectedCard card : Cards) {
        model.chooseCards(card: card)
    }
    
}


