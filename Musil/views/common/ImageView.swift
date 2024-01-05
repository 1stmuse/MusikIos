//
//  ImageView.swift
//  Musil
//
//  Created by iMuse on 02/01/2024.
//

import SwiftUI
import Foundation

struct ImageView: View {
    let url: String
   
    var body: some View {
        AsyncImage(url: URL(string: url)!) { phases in
            switch phases {
                
            case let .success(img):
                img.resizable()
                    .renderingMode(.original)
//                    .scaledToFit()
                   
            case .failure(_):
                Image("default")
                    .resizable()
                    .renderingMode(.original)
                   
            case .empty:
                Image("default")
                    .resizable()
                    .renderingMode(.original)
                    
            @unknown default:
                Image("default")
                    .resizable()
                    .renderingMode(.original)
            }
        }
        
    

    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://api.deezer.com/genre/0/image")
    }
}
