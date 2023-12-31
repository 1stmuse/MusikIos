//
//  LoginView.swift
//  Musil
//
//  Created by iMuse on 30/12/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack(alignment:.bottomLeading){
            Image("loginBg")
                .resizable()
            
            VStack{
                VStack(alignment:.leading, spacing: 10){
                    Text("Music Like No Other")
                        .foregroundColor(.white)
                        .font(Font.system(.headline, design: .rounded, weight: .bold))
                    Text("Lorem ipsum dolor sit amet consectetur. Sapien imperdiet mauris suscipit tincidunt ipsum egestas. Hac integer ")
                        .foregroundColor(.white)
                        .font(.footnote)
                }.padding(.bottom, 40)
                
                LongButton(label: "Log In", background: .primaryColor) {
                    
                }
                LongButton(label: "Sign Up", background: .secondaryColor) {
                    
                }
                
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 80)
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
