//
//  Api.swift
//  CinemaTix
//
//  Created by Eky on 12/12/23.
//

import Foundation
import Alamofire

protocol Api {
    
    static var baseURL: String { get }
    var key: String { get }
    var headers: HTTPHeaders { get }
    
}

class TmdbApi: Api {
    
    static let baseURL: String = "https://api.themoviedb.org/3/"
    
    let key: String = "f9786e6c408860d5243366d56f4565fb"
    var headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOTc4NmU2YzQwODg2MGQ1MjQzMzY2ZDU2ZjQ1NjVmYiIsIm5iZiI6MTU5NzkyOTE4OC40ODk5OTk4LCJzdWIiOiI1ZjNlNzZlNGMxNzViMjAwMzY1Y2FkMmUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.2kGWt2cZl-FAbex5TT9L1PUiqAYijObgO49WOu0Pugg"
    ]
    
    init() {
//        if let path = Bundle.main.path(forResource: "Secret", ofType: "plist") {
//            if let dict = NSDictionary(contentsOfFile: path) as? [String: Any] {
//                if let apiKey = dict["APIKEY"] as? String {
//                    let value = "Bearer
//                    headers.add(name: "Authorization", value: value)
//                }
//            }
//        }
    }
    
    internal func createEndpoint(path: String,
                                 method: HTTPMethod,
                                 query: Parameters? = nil,
                                 body: Parameters? = nil) -> Endpoint {
        return Endpoint(
            baseURL: TmdbApi.baseURL,
            headers: headers,
            path: path,
            method: method,
            query: query,
            body: body
        )
    }
    
    enum ImageType {
        case original
        case w500
    }
    
    static func getImageURL(_ path: String, type: ImageType = .original) -> URL? {
        var typeStr = "original"
        switch type {
        case .w500:
            typeStr = "w500"
        default:
            break
        }
        return URL(string: "https://image.tmdb.org/t/p/\(typeStr)/\(path)")
    }
}
