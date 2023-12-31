//
//  TabItem.swift
//  Musil
//
//  Created by iMuse on 31/12/2023.
//

import SwiftUI

struct TabItem: View {
    let item: Tabs
    @Binding var selected: Bool
    var body: some View {
        VStack{
            item.icon
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 70, height: 50)
                .foregroundColor(selected ? .white : .black)
            Text(item.rawValue)
        }
    }
}

struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
        TabItem(item: .Home, selected: .constant(false))
    }
}
