//
//  LongButton.swift
//  Musil
//
//  Created by iMuse on 30/12/2023.
//

import SwiftUI

struct LongButton: View {
    let label: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
       
        VStack {
            Button {
                action()
            } label: {
                Text(label).foregroundColor(.black)
                    .font(.callout)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: 30))
        }
        .padding(.horizontal, 20)
    }
}

struct LongButton_Previews: PreviewProvider {
    static var previews: some View {
        LongButton(label: "Log in", background: Color.primaryColor){
            
        }
    }
}
