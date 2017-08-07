//
//  CountriesInteractor.swift
//  viper-ios-example
//
//  Created by Alexey Hatmullin on 8/7/17.
//  Copyright © 2017 Saritasa. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON


class CountriesInteractor: CountriesUseCase {
    
    weak var output: CountriesInteractorOutput!
    
    func fetchCountries() {
        CountriesProvider.request(.all) { (result) in
            switch result {
            case let .success(response):
                let json = JSON(data: response.data)
                
                let dictionaries = json.arrayObject as! [[String : Any]]
                
                let countries = dictionaries.flatMap({ (dict) -> Country? in
                    let countryName = dict["name"] as! String                    
                    let flagUrlString = dict["flag"] as! String
                    let flagURL = URL(string: flagUrlString)!
                    
                    return Country(name: countryName, flagUrl: flagURL)
                })
                
                self.output.countriesFetched(countries)
                break
                
            case .failure(_):
                self.output.countriesFetchFailed()
                break
            }
        }
    }
    
}
