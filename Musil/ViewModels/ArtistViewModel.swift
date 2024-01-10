//
//  ArtistViewModel.swift
//  Musil
//
//  Created by iMuse on 11/01/2024.
//

import Foundation

class ArtistViewModel: ObservableObject {
    
    let service = ServiceManager.shared
    @Published var artistdetails: Artist? = nil
    @Published var isLoading: Bool = false
    @Published var traklist: [TrackModel] = []
    @Published var error: ApiError? = nil
    @Published var hasError:Bool = false
    
    
    init() {
        
    }
    
    @MainActor
    func getArtist(id: Int) async {
        isLoading = true
       await service.getArtist(id: id) { [weak self] result in
            
            switch result {
            case let .success(artist):
                self?.artistdetails = artist
                self?.isLoading = false
            case let .failure(error):
                print("The Error \(error.localizedDescription)")
                self?.error = error
                self?.hasError = true
                self?.isLoading = false
            }
        }
        
    }
    
    @MainActor
    func getArtistTracks(id: Int) async {
        isLoading = true
        
        await service.getArtistTracks(id: id) { [weak self] result in
            switch result {
            case let .success(res):
                self?.traklist = res.data
                self?.isLoading = false
            
            case let .failure(error):
                print("The Error \(error.localizedDescription)")
                self?.error = error
                self?.isLoading = false
            }
        }
    }
    
}
