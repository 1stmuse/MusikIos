//
//  SongViewModel.swift
//  Musil
//
//  Created by iMuse on 02/01/2024.
//

import Foundation

class SongViewModel: ObservableObject {
    
    @Published private(set) var songs: [SongModel] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var error: ApiError? = nil
    
    let service: ServiceManager
    
    init(){
        service = ServiceManager.shared
        Task {
            await loadSong()
        }
    }
    
    
    @MainActor
    func loadSong() async {
        isLoading = true
        
            await service.getSongs(completionHandler: { [weak self] (result)  in
                switch result {
                case let .success(res):
                    self?.songs = res.tracks.data
                    self?.isLoading = false
                  
                case let .failure(error):
                    print("the error \(error.localizedDescription)")
                    self?.isLoading = false
                    self?.error = error
                }
            })
        
        
      
        
    }
}
