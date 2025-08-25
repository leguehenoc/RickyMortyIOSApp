//
//  RMService.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 21/08/2025.
//

import Foundation

/// Pimary API service object to get Ricky and Morty data
final class RMService{
    static let shared = RMService()
    
    enum RMRequestError: Error{
        case failedTocreatURLRequest
        case failedToGetData
        case invalidURL
        case decodingFailed
        case networkingFailed
    }
    
    init(){
        
    }
    
    /// type que nous attendons en retour
    func execute<T:Codable>(_ request: RMRequest, execption: T.Type
    ,completion: @escaping(Result<T, Error>) -> Void){
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMRequestError.failedTocreatURLRequest))
            return
        }
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else{
                completion(.failure(RMRequestError.failedToGetData))
                return
            }
            do{
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    private func request(from rmRequest: RMRequest) -> URLRequest?{
        
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
