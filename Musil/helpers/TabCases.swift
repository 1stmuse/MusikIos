//
//  TabCases.swift
//  Musil
//
//  Created by iMuse on 31/12/2023.
//

import Foundation
import SwiftUI

enum Tabs: String, CaseIterable {
    case Home
    case Explore
    case Others
    case Library 
    
    var icon: Image {
        switch(self){
        case .Home:
            return Image("home")
        case .Explore:
            return Image("explore")
        case .Others:
            return Image("others")
        case .Library:
            return Image("library")
        }
    }
}
