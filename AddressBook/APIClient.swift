//
//  APIClient.swift
//  AddressBook
//
//  Created by Miwand Najafe on 2016-04-21.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import SwiftyJSON
import UIKit

class APIClient {
    static let sharedInstance = APIClient()
    private var contacts = [Person]()
    
    func getData(completion:(data:[Person]?,responseCode:Int?, error:NSError?) -> ()) -> () {
        let urlString = URL_BASE + URL_NUM_RESULTS
        if let url = NSURL(string: urlString) {
            let session = NSURLSession.sharedSession()
            session.dataTaskWithURL(url, completionHandler: { (data, response, error) in
                
                let resp = response as! NSHTTPURLResponse
                
                let json = JSON(data: data!)
                
                for value in json["results"] {
                    let person = Person(dict: value.1)
                    self.contacts.append(person)
                }
                completion(data: self.contacts, responseCode: resp.statusCode, error: error)
            }).resume()
        } else {
            print("Url is not correct")
        }
    }
}


