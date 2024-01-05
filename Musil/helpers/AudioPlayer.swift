//
//  AudioPlayer.swift
//  Musil
//
//  Created by iMuse on 04/01/2024.
//

import Foundation
import AVKit
import AVFoundation

class AudioPlayer: ObservableObject {
    
    static let shared = AudioPlayer()
    
    private var audioPlayer: AVPlayer?
    @Published var currentSongPlaying: SongModel? = nil
    @Published private(set) var isPlaying:Bool = false
    @Published var duration: TimeInterval = 0.0
    @Published var currentTime: TimeInterval = 0.0
    
    //    init(currentSongPlaying: SongModel){
    //        self.currentSongPlaying = currentSongPlaying
    //
    //        self.audioPlayer = try? AVAudioPlayer(contentsOf: URL(string: currentSongPlaying.preview)!)
    //
    //    }
    
    init () {
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, options: .duckOthers)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print("the error \(error)")
            // report for an error
        }
    }
    
    func play(song: SongModel){
        currentSongPlaying = song
        if let url = URL(string: song.preview) {
            audioPlayer = try? AVPlayer(url: url)
        }
        
        guard let player = audioPlayer else {
            print("cannot play mediw")
            return
        }
        
        player.play()
        isPlaying = true
        //        duration = player.currentItem?.duration ?? CMTime()
        //            currentTime = player.currentTime()
        
    }
    
    //    func play(song: SongModel){
    //        guard let url = URL(string: song.preview) else { return }
    //
    //        do {
    //            let soundData = try Data(contentsOf: url)
    //
    //            self.audioPlayer = try AVAudioPlayer(data: soundData)
    //            guard let audioPlayer = audioPlayer else { return }
    //            audioPlayer.prepareToPlay()
    //
    //            if audioPlayer.isPlaying {
    //                isPlaying = false
    //                audioPlayer.pause()
    //                duration = audioPlayer.duration
    //                currentTime = audioPlayer.currentTime
    //            } else {
    //                isPlaying = true
    //                duration = audioPlayer.duration
    //                currentTime = audioPlayer.currentTime
    //                audioPlayer.play()
    //            }
    //
    //        } catch {
    //
    //        }
    //    }
    
    func pause(){
        
        guard isPlaying, audioPlayer != nil else {
            return
        }
        
        audioPlayer?.pause()
        isPlaying = false
        //        duration = audioPlayer?.currentItem?.duration ?? CMTime()
        //        currentTime = audioPlayer?.currentTime()
        
    }
    
    
}
