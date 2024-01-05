//
//  GenreModel.swift
//  Musil
//
//  Created by iMuse on 02/01/2024.
//

import Foundation
import SwiftUI

struct Genre: Identifiable {
    let id = UUID()
    let title: String
    let label: String
    let color: Color
    
}


let genres: [Genre] = [
    .init(title: "Soft Jazz", label: "Jazz", color: .blue),
    .init(title: "R&B", label: "R&B", color: .yellow),
    .init(title: "Afrobeats", label: "Afrobeats", color: .purple),
    .init(title: "Dark Metal", label: "Metal", color: .red),
    .init(title: "Classical", label: "Classical", color: .green),
    .init(title: "Rock", label: "Rock", color: .indigo),
    .init(title: "Alternative", label: "Alternative", color: .orange),
    .init(title: "Dance", label: "Dance", color: .mint)
]
