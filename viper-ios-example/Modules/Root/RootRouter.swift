//
//  RootRouter.swift
//  viper-ios-example
//
//  Created by Alexey Hatmullin on 8/7/17.
//  Copyright © 2017 Saritasa. All rights reserved.
//

import UIKit


class RootRouter: RootWireframe {
    
    func presentCountriesScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = CountriesRouter.assembleModule()
    }
    
}
