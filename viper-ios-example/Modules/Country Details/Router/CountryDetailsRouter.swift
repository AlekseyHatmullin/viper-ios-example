//
//  CountryDetailsRouter.swift
//  viper-ios-example
//
//  Created by Alexey Hatmullin on 8/7/17.
//  Copyright © 2017 Saritasa. All rights reserved.
//

import UIKit


class CountryDetailsRouter: CountryDetailsWireframe {
    
    static func assembleModule(_ country: Country) -> CountryDetailsViewController {
        let view = UIStoryboard(name: "CountryDetails", bundle: nil).instantiateViewController(withIdentifier: "CountryDetailsViewController") as! CountryDetailsViewController
        let presenter = CountryDetailsPresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.country = country
        
        return view
    }
    
}

