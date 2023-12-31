//
//  SplashScreen.swift
//  Musil
//
//  Created by iMuse on 31/12/2023.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack{
            HStack{
                Text("MUSIK")
                    .font(.system(size: 50, weight: .thin, design: .serif))
                    .foregroundColor(.white)
                Color.primaryColor
                    .clipShape(Circle())
                    .frame(width: 20)
                    .padding(.top, 20)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color.background)
        .ignoresSafeArea()
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
