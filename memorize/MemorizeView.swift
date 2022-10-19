//
//  MemorizeView.swift
//  memorize
//
//  Created by Pratha Saxena on 07/10/22.
//

import SwiftUI

struct MemorizeView: View {
    @ObservedObject var vm = MemorizeVM()
    
    var body: some View {
        VStack {
            Text("Memorize").font(.system(size: 40)).fontWeight(.bold).multilineTextAlignment(.leading)
            ForEach(vm.cards){item in
                CardView(item: item).aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            ThemeButtons()
            
        }.padding(4)
    }
}

struct ThemeButtons : View {
    var body : some View {
        HStack{
            Button("Vehicle"){
                print("pressed vehicle")
            }
            Spacer()
            Button("Smiley"){
                print("pressed smiley")
            }
            Spacer()
            Button("Animal"){
                print("pressed animal")
            }
        }
    }
}

struct CardView: View {
    var item : MemorizeVM.Cards
    var body : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
            Text(item.content)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeView()
    }
}
