//
//  ServiceManager.swift
//  Musil
//
//  Created by iMuse on 02/01/2024.
//

import Foundation

enum ApiError: Error {
    
    case InvalidUrl
    case NotFound

    var description: String {
        switch self {
        case .InvalidUrl:
            return "Invalid url provided"
        case .NotFound:
            return "Resouce not found"
        }
    }
}

class ServiceManager {
    
    static let shared = ServiceManager()
    
    let BASE_URL = "https://api.deezer.com/"
    
    
    func getArtist(id: Int, completionHandler: @escaping (Result<Artist, ApiError>) -> ()) async {
        let artistUrl = "\(BASE_URL)/artist/\(id)"
        
        guard let url = URL(string: artistUrl) else {
            completionHandler(.failure(ApiError.InvalidUrl))
            return
        }
        
        await self.loadAndDecode(url: url, completionHandler: completionHandler)
    }
    
    func getArtistTracks(id: Int, completionHandler: @escaping (Result<TracksResponse, ApiError>) -> ()) async {
        let trasksUrl = "\(BASE_URL)artist/\(id)/top?limit=10"
        
        guard let url = URL(string: trasksUrl) else {
            completionHandler(.failure(ApiError.InvalidUrl))
            return
        }
        
        await self.loadAndDecode(url: url, completionHandler: completionHandler)
    }
   
    
    func getSongs(completionHandler: @escaping (Result<SongResponse, ApiError>) -> ()) async {
      
        let trackUrl = "\(BASE_URL)chart"
        
        guard let url = URL(string: trackUrl) else {
            
            completionHandler(.failure(ApiError.InvalidUrl))
            return
        }
        
        await self.loadAndDecode(url: url, completionHandler: completionHandler)
       
    }
    
    private func loadAndDecode<D: Decodable>(url:URL, completionHandler: @escaping (Result<D, ApiError>) -> ()) async  {
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(D.self, from: data)
           
            DispatchQueue.main.async {
                completionHandler(.success(decoded))
            }
        } catch {
            
            DispatchQueue.main.async {
                print(error)
                completionHandler(.failure(ApiError.NotFound))
            }
        }
    }
    
//    func getSong(trackId track: String) async throws -> [SongModel] {
//
//        let trackUrl = TRACK_URL + "\(track)"
//
//        guard let url = URL(string: trackUrl) else {
//            throw ApiError.InvalidUrl
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//
//            return try JSONDecoder().decode([SongModel].self, from: data)
//
//        } catch {
//
//        }
//
//
//    }
        
    
}
