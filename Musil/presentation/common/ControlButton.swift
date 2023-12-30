//
//  ControlButton.swift
//  Musil
//
//  Created by iMuse on 30/12/2023.
//

import SwiftUI

enum ContolType {
    case play
    case next
    case prev
    
    var icon: Image {
        switch(self){
        case .next:
           return Image(systemName: "forward.end.fill")
        case .play:
            return Image(systemName: "play.fill")
        case .prev:
           return  Image(systemName: "backward.end.fill")
        }
    }
}

struct ControlButton: View {
    let type: ContolType
    let width: CGFloat
    let height: CGFloat
    let action: () -> Void
    
    
    
    
    var body: some View {
        Button {
            action()
        } label: {
            type.icon
                .foregroundColor(.black)
        }
        .frame(width: width, height: height)
        .background(Color.white)
        .clipShape(Circle())

    }
}

struct ControlButton_Previews: PreviewProvider {
    static var previews: some View {
        ControlButton(type: .next, width: 50, height: 50){
            print("hello worl")
        }
            .preferredColorScheme(.dark)
    }
}
