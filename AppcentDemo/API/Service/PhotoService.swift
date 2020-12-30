//
//  Service.swift
//  AppcentDemo
//
//  Created by Hakan Üstünbaş on 25.12.2020.
//

import Foundation
import Alamofire

class PhotoService {
 
    func fetchData(rover:String,page:Int,callback:@escaping ([Photo]?) -> Void) {

        let params :Parameters = ["sol":Constans.sol,
                                  "api_key":Constans.apiKey,
                                  "page":page]
        
        AF.request(Constans.baseUrl + rover + "/photos",method: .get,parameters: params).responseJSON {  response in
            
            do {
                guard let data = response.data else {return}
                
                let dataResponse = try JSONDecoder().decode(PhotoResponse.self, from: data)
                let infoData = dataResponse.photos
                callback(infoData)
                
            }catch let e{
                print(e)
            }
        }
    }
    
    func fetchDataCamera(rover:String,page:Int,camera:String,callback:@escaping ([Photo]?) -> Void) {

        let params :Parameters = ["sol": Constans.sol,
                                  "api_key":Constans.apiKey,
                                  "page" : page,
                                  "camera": camera]
        
        AF.request(Constans.baseUrl + rover + "/photos",method: .get,parameters: params).responseJSON {  response in
            
            do {
                guard let data = response.data else {return}
                
                let dataResponse = try JSONDecoder().decode(PhotoResponse.self, from: data)
                let infoData = dataResponse.photos
                callback(infoData)
                
            }catch let e{
                print(e)
            }
        }
    }
}
