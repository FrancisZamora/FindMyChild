//
//  Client.swift
//  MHacks
//
//  Created by Francis Zamora on 10/8/16.
//  Copyright © 2016 Francis. All rights reserved.
//

import Foundation
import Alamofire


class Client {
    func login(username: String, password: String, onSuccess: () -> Void, onFailure: () -> Void) {
        Alamofire.request("https://server").responseJSON { response in
            debugPrint(response)
            
    
            if let json = response.result.value {
                
                
                
                print("JSON: \(json)")
                
          //      if let token = json["token"] as! String {
            //        print(token)
              //  }
            }
        }
    }
    
    //get info in form of JSON
    //once there is a JSON response, parse the response for the LAT and the LONG
    
}
