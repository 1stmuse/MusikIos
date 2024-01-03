//
//  ImageModifiers.swift
//  Musil
//
//  Created by iMuse on 02/01/2024.
//

import Foundation
import SwiftUI

struct SongImage: ViewModifier {
    
    let width: CGFloat
    let height: CGFloat
    
    func body(content: Content) -> some View {
            content
                .frame(width: width, height: height)
        }
    
}
