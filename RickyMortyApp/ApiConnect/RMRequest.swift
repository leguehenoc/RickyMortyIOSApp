//
//  RMRequest.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 21/08/2025.
//

import Foundation

final class RMRequest {
   private struct Constantes {
        static let baseURLString = "https://rickandmortyapi.com/api/"
    }
    
    private let endPoint: RMEndpoint
    private let pathComponents: [String]
    private let queryParameters: [URLQueryItem]
    
    private var urlString: String{
        var url = Constantes.baseURLString
        url += endPoint.rawValue
        
        if !self.pathComponents.isEmpty{
            self.pathComponents.forEach({
                url += "/\($0)"
            })
        }
        
        if !self.queryParameters.isEmpty{
            url += "?"
           let argumentString =  self.queryParameters.compactMap({
                return "\($0.name)=\($0.value ?? "")"
           }).joined(separator: "&")
            url += argumentString
        }
        
        return url
    }
    public var httpMethod = "GET"
    
    public var url: URL? {
        return URL(string: self.urlString)
    }
    
    init(endPoint: RMEndpoint, pathComponents: [String] = [],queryParameters: [URLQueryItem] = [] ) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
