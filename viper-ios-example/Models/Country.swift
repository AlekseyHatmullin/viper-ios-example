//
//  Country.swift
//  viper-ios-example
//
//  Created by Alexey Hatmullin on 8/7/17.
//  Copyright © 2017 Saritasa. All rights reserved.
//

import Foundation


class Country {
    
    
    // MARK: - Properties
    
    let name: String
    let flagURL: URL
    
    
    // MARK: - Initialization
    
    init(name: String, flagUrl: URL) {
        self.name = name
        self.flagURL = flagUrl
    }    
    
}
