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
    
    private var audioPlayer: AVPlayer?
    private var audioPlayer2: AVAudioPlayer?
    @Published var currentSongPlaying: SongModel? = nil
    @Published private(set) var isPlaying:Bool = false
    @Published var duration: Double = 0.0
    @Published var currentTime: Double = 0.0
        
    
    func load(song: SongModel){
        
        if currentSongPlaying == nil {
            isPlaying = false
            currentSongPlaying = song
            if let url = URL(string: song.preview) {
                audioPlayer = try AVPlayer(url: url)
            }
        } else {
            guard let id = currentSongPlaying?.id else {
               return
           }
           
           if song.id == id {
               return
           }else {
               audioPlayer?.replaceCurrentItem(with: nil)
               isPlaying = false
               currentSongPlaying = song
               
               if let url = URL(string: song.preview) {
                   audioPlayer = try AVPlayer(url: url)
               }
           }
        }
        
    }
    
    func play(song: SongModel){
        
        guard let player = audioPlayer else {
            print("cannot play diw")
            return
        }
        
            player.play()
            isPlaying = true
            player.addProgressObserver { dur, tm in
                self.duration = dur
                self.currentTime = tm
            }
        
    }
    
    func stop(){
        guard isPlaying, audioPlayer != nil else {
            return
        }
      
        audioPlayer?.replaceCurrentItem(with: nil)
        isPlaying = false
        
    }
    
    func pause(){
        
        guard isPlaying, audioPlayer != nil else {
            return
        }
        isPlaying = false
        audioPlayer?.pause()
        
    }
    
    
}

extension AVPlayer {
    func addProgressObserver(action:@escaping ((Double, Double) -> Void)) -> Any {
        return self.addPeriodicTimeObserver(forInterval: CMTime.init(value: 1, timescale: 1), queue: .main, using: { time in
            if let duration = self.currentItem?.duration {
                let duration = CMTimeGetSeconds(duration), time = CMTimeGetSeconds(time)
                let progress = (time/duration)
//                print("the progress ooo \(time)")
                action(duration, time)
            }
        })
    }
}
