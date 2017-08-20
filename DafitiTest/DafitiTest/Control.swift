//
//  Control.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 18/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit
import Alamofire

class Control: NSObject {

    static func customRequest(url:URLConvertible, method: HTTPMethod, parameters: Parameters? = nil, encoding: ParameterEncoding, headers: HTTPHeaders? = nil,completionHandler:((Any?,Error?) -> ())?) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).validate().responseJSON { (response) in

            switch response.result {
            case .success:
                completionHandler!(response.result.value,nil)
            case .failure(let error):
                completionHandler!(nil,error)
            }
        }
    }

    static func getTrendindMovies(completion: @escaping (([MoviePlus]?, String?) -> ())) {
        
        let url:URLConvertible = URL(string: Config.Api.method.Movie.URL)!
        var headers:HTTPHeaders = HTTPHeaders()
        headers["Content-Type"] = "application/json"
        headers["trakt-api-version"] = "2"
        headers["trakt-api-key"] = Config.Api.Keys.clientID.rawValue

        customRequest(url: url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers) {
            (data, error) in
            
            if error == nil {
  
                if let data = data as? Array<Any> {
                    
                    var trendingMovies:[MoviePlus] = [MoviePlus]()
                    
                    for mov in data {
                        trendingMovies.append(MoviePlus(dic: mov as! Dictionary<String, Any>))
                    }
                    
                    completion(trendingMovies,nil)
                
                } else {
                
                    completion(nil,"Ocorreu um erro ao buscar os dados")
                }
            } else {
                completion(nil,error.debugDescription)
            }
        }
    }
    
    static func getImages(imbdID:Int,completion: @escaping ((ImagesMovie?, String?) -> ())) {

        let url:URLConvertible = URL(string: String(format: "https://api.themoviedb.org/3/movie/%d/images?api_key=%@", imbdID, Config.Api.Keys.themoviedbKey.rawValue))!

        customRequest(url: url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil) { (result, error) in
            
            if error == nil {
                
                if let data = result as? Dictionary<String, Any> {
                    
                    completion(ImagesMovie(dic: data), nil)
            
                } else {
                    
                    completion(nil,"Ocorreu um erro ao buscar os dados")
                }
            } else {
                completion(nil,error.debugDescription)
            }
        }
    }
}
