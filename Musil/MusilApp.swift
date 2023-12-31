//
//  MusilApp.swift
//  Musil
//
//  Created by iMuse on 30/12/2023.
//

import SwiftUI

@main
struct MusilApp: App {
    @ObservedObject private var sessionManager = SessionManager()
    var body: some Scene {
        WindowGroup {
            MainApp()
                .environmentObject(sessionManager)
        }
    }
}
