//
//  MemorizeView.swift
//  memorize
//
//  Created by Pratha Saxena on 07/10/22.
//

import SwiftUI

struct MemorizeView: View {
    @ObservedObject var vm : MemorizeVM
    var body: some View {
        VStack{
        Text("Memorize").font(.system(size: 30)).fontWeight(.bold).multilineTextAlignment(.leading)
            CardsScreen(vm: vm)
            ThemeButtons(vm: vm)
        }.padding()
    }
}

struct CardsScreen : View {
    @ObservedObject var vm : MemorizeVM
    var body: some View {
        GeometryReader { geo in
        ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: geo.size.width * 0.3, maximum: geo.size.width * 0.4))]) {
                ForEach(vm.cards){item in
                    CardView(item: item).aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).onTapGesture {
                        vm.selectCard(selectedCard: item)
                    }
                }
            }
          }
       }
    }
}

struct ThemeButtons : View {
    var vm : MemorizeVM
    var body : some View {
        HStack{
            Button(vm.ThemeAvailable.Vehicle.rawValue){
                vm.selectTheme(selected: .Vehicle)
            }
            Spacer()
            Button(vm.ThemeAvailable.Smiley.rawValue){
                vm.selectTheme(selected: .Smiley)
            }
            Spacer()
            Button(vm.ThemeAvailable.Animals.rawValue){
                vm.selectTheme(selected: .Animals)
            }
        }
    }
}

struct CardView: View {
    var item : MemorizeVM.Cards
    var body : some View {
        GeometryReader { geometry in
            ZStack {
                if(item.isFaceUp){
                    if(item.isMatched){
                        RoundedRectangle(cornerRadius: 10).opacity(0)
                    } else {
                    RoundedRectangle(cornerRadius: 10)
                    }
                    Text(item.content).font(.system(size: geometry.size.width * 0.8))
                } else {
                    RoundedRectangle(cornerRadius: 10)
                }
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = MemorizeVM()
        MemorizeView(vm: game)
    }
}
