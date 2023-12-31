//
//  CustomView.swift
//  Musil
//
//  Created by iMuse on 31/12/2023.
//

import SwiftUI

struct CustomView: View {
    var body: some View {
        HStack(){
            ForEach(Tabs.allCases, id: \.self) { tab in
                TabItem(item: tab, selected: .constant(false))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
        .background(Color.lightBackground)
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}
