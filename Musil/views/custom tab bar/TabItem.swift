//
//  TabItem.swift
//  Musil
//
//  Created by iMuse on 31/12/2023.
//

import SwiftUI

struct TabItem: View {
    let item: Tabs
     var selected: Bool
    let action: (Tabs) -> Void
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment:.center){
                item.icon
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: geo.size.width, height: 25)
                    .foregroundColor(selected ? .white : .background)
                Text(item.rawValue)
                    .foregroundColor(selected ? .white : .background)
            }
        }.onTapGesture {
            action(item)
        }
    }
}

struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
        TabItem(item: .Home, selected: false){ tab in
            
        }
    }
}
