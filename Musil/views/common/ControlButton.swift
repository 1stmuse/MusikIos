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
    case pause
    
    var icon: Image {
        switch(self){
        case .next:
           return Image(systemName: "forward.end.fill")
        case .play:
            return Image(systemName: "play.fill")
        case .prev:
           return  Image(systemName: "backward.end.fill")
        case .pause:
            return Image(systemName: "pause.circle")
        }
    
    }
}

struct ControlButton: View {
    let type: ContolType
    let width: CGFloat
    let height: CGFloat
    let iconSize: CGFloat
    let action: () -> Void
    
    
    
    
    var body: some View {
        Button {
            action()
        } label: {
            type.icon
                .resizable()
                .scaledToFit()
                .frame(width: iconSize, height: iconSize)
                .foregroundColor(.black)
        }
        .frame(width: width, height: height, alignment: .center)
        .background(Color.white)
        .clipShape(Circle())

    }
}

struct ControlButton_Previews: PreviewProvider {
    static var previews: some View {
        ControlButton(type: .next, width: 50, height: 50, iconSize: 10){
            print("hello worl")
        }
            .preferredColorScheme(.dark)
    }
}
