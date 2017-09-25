//
//  Country.swift
//  CountryPhoneCodePicker
//
//  Created by Ragaie alfy on 9/25/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class Country: NSObject {
    
    var name : String!
    var dial_code : String!
    var code : String!
    var format : String!
    
    
    
    override init(){
        super.init()
    }
    init(countryCode: String, phoneExtension: String, formatPattern: String = "###################", name : String) {
        self.code = countryCode
        self.dial_code = phoneExtension
        self.format = formatPattern
        self.name = name
    }
  
    
}
