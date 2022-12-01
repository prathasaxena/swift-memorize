//
//  CustomGrid.swift
//  memorize
//
//  Created by Pratha Saxena on 01/12/22.
//

import SwiftUI


struct CustomGrid : View {
    let cards : [MemorizeVM.Cards]
    let selectCard : (MemorizeVM.Cards) -> Void
    let aspectRatio : CGFloat
    var body : some View {
        GeometryReader { geo in
        let width = widthThatFits(itemCount: cards.count, in: geo.size, itemAspectRatio: aspectRatio)
        VStack {
            LazyVGrid(columns: gridThatFits(widthThatFits: width)) {
                ForEach(cards){item in
                    CardView(item: item).aspectRatio(styles.aspectRatio, contentMode: .fit).onTapGesture {
                        selectCard(item)
                    }
                }
            }
            Spacer(minLength: 0)
          }
       }
    }
}

private func gridThatFits(widthThatFits : CGFloat) -> [GridItem] {
    return [GridItem(.adaptive(minimum: widthThatFits), spacing: 10)]
}

private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
     var columnCount = 1
     var rowCount = itemCount
     repeat {
       let itemWidth = size.width / CGFloat(columnCount)
       let itemHeight = itemWidth / itemAspectRatio
       if CGFloat(rowCount) * itemHeight < size.height {
         break
       }
       columnCount += 1
       rowCount = (itemCount + (columnCount - 1)) / columnCount
     } while columnCount < itemCount
     if columnCount > itemCount {
       columnCount = itemCount
     }
     return floor(size.width / CGFloat(columnCount)) - 10
   }

//struct CustomGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomGrid()
//    }
//}
