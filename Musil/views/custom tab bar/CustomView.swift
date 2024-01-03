//
//  CustomView.swift
//  Musil
//
//  Created by iMuse on 31/12/2023.
//

import SwiftUI

struct CustomView: View {
    @Binding var selectedTab: Tabs
    var body: some View {
        HStack(alignment: .center){
            ForEach(Tabs.allCases, id: \.self) { tab in
                TabItem(item: tab, selected: selectedTab == tab ? true : false){ res in
                    selectedTab = res
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .padding(.horizontal, 10)
        .padding(.top, 20)
        .background(Color.lightBackground)
        
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView(selectedTab: .constant(.Home))
    }
}
