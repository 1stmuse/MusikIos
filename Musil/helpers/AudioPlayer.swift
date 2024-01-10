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
    
    //    init(currentSongPlaying: SongModel){
    //        self.currentSongPlaying = currentSongPlaying
    //
    //        self.audioPlayer = try? AVAudioPlayer(contentsOf: URL(string: currentSongPlaying.preview)!)
    //
    //    }
    
    init () {
        
    }
    
    deinit {
        
    }
    
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
        
//        if let id = currentSongPlaying?.id {
//            guard song.id != id else {return}
//        }
        
        
        guard let player = audioPlayer else {
            print("cannot play diw")
            return
        }
        
//        if isPlaying == true {
//            player.pause()
//            isPlaying = false
//        } else {
            player.play()
            isPlaying = true
            player.addProgressObserver { dur, tm in
              
                self.duration = dur
                self.currentTime = tm
            }
//        }
        
        
        
        

        
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
        
        //        duration = audioPlayer?.currentItem?.duration ?? CMTime()
        //        currentTime = audioPlayer?.currentTime()
        
    }
    
//    func removePeriodicTimeObserver() {
//        
//        guard let player = audioPlayer else {
//            print("cannot play mediw")
//            return
//        }
//        // If a time observer exists, remove it
//        if let token = timeObserverToken {
//            player.removeTimeObserver(token)
//            timeObserverToken = nil
//        }
//    }
    
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
