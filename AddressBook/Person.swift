//
//  Person.swift
//  AddressBook
//
//  Created by Miwand Najafe on 2016-04-21.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Person {
    private var _fullName:String!
    private var _cellNum:String!
    private var _phoneNum:String!
    private var _personImgURL:NSURL!
    private var _fullAddress:String!
    private var _email:String!
    
    var fullName:String {
        return _fullName
    }
    var cellNum:String {
        return _cellNum
    }
    var phoneNum:String {
        return _phoneNum
    }
    var personImgURL:NSURL {
        return _personImgURL
    }
    var fullAddress:String {
        return _fullAddress
    }
    var email:String {
        return _email
    }
    
    init(dict:JSON) {
        let nameDict = dict["name"]
        let firstName = nameDict["first"].stringValue.capitalizedString
        let lastName = nameDict["last"].stringValue.capitalizedString
        self._fullName = firstName  + " " + lastName
        
        let addressDict = dict["location"]
        let street = addressDict["street"].stringValue + ","
        let city = addressDict["city"].stringValue.capitalizedString + ","
        let state = addressDict["state"].stringValue.capitalizedString
        self._fullAddress = street + city + state
        
        let imgURLString = dict["picture"]["thumbnail"].stringValue
        
        if let url = NSURL(string: imgURLString) {
            self._personImgURL = url
        }
        
        self._cellNum = dict["cell"].stringValue
        self._email = dict["email"].stringValue
        self._phoneNum = dict["phone"].stringValue
    }
}
