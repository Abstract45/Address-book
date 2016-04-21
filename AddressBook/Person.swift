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
    private var _personImgURLString:String?
    private var _fullAddress:String!
    private var _email:String!
    private var _imgFromPicker:UIImage!
    
    var fullName:String {
        return _fullName
    }
    var cellNum:String {
        return _cellNum
    }
    var phoneNum:String {
        return _phoneNum
    }
    var personImgURLString:String {
        if _personImgURLString != nil {
        return _personImgURLString!
        }
        return ""
    }
    var fullAddress:String {
        return _fullAddress
    }
    var email:String {
        return _email
    }
    var imgFromPicker:UIImage {
        return _imgFromPicker
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
        
        self._personImgURLString = dict["picture"]["thumbnail"].stringValue
        
        self._cellNum = dict["cell"].stringValue
        self._email = dict["email"].stringValue
        self._phoneNum = dict["phone"].stringValue
    }
    
    init(name:String, cellNum:String, image:UIImage, email:String) {
        self._fullName = name
        self._email = email
        self._cellNum = cellNum
        self._imgFromPicker = image
    }
}
