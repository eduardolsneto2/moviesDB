//
//  MovieRequest.swift
//  Movies
//
//  Created by Eduardo Leite on 05/09/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import UIKit
import Alamofire

class MovieRequest {
    
    class func getPopularMovies(withPage page: Int,
                                onComplete: @escaping ([Movie]) -> Void, onError: @escaping (Error) -> Void) {
        
        let params = [
            "api_key": APIKey,
            "language": language,
            "page": page
            ] as [String: Any]
        Alamofire.request(moviesURL, parameters: params).responseJSON { (response) in
            if let error = response.error {
                onError(error)
            } else {
                if let data = response.result.value as? [String: Any] {
                    if let result = data["results"] as? [[String: Any]] {
                        do {
                            let data = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                            let moviesResponse = try JSONDecoder().decode([Movie].self, from: data)
                            onComplete(moviesResponse)
                        } catch {
                            onError(error)
                        }
                    }
                }
            }
        }
    }
}
