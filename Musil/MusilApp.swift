//
//  MusilApp.swift
//  Musil
//
//  Created by iMuse on 30/12/2023.
//

import SwiftUI
import AVFoundation

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, options: .duckOthers)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print("the error \(error)")
            // report for an error
        }
        return true
    }
}

@main
struct MusilApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject private var sessionManager = SessionManager()
    
    
    var body: some Scene {
        WindowGroup {
            MainApp()
                .environmentObject(sessionManager)
        }
    }
}
