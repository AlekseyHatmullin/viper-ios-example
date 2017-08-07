//
//  CountriesAPI.swift
//  viper-ios-example
//
//  Created by Alexey Hatmullin on 8/7/17.
//  Copyright © 2017 Saritasa. All rights reserved.
//

import Foundation
import Moya


// MARK: - Provider setup

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

let CountriesProvider = MoyaProvider<Countries>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])


// MARK: - Provider support

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum Countries {
    case all
}

extension Countries: TargetType {
    public var baseURL: URL { return URL(string: "https://restcountries.eu/rest/v2")! }
    public var path: String {
        switch self {
        case .all:
            return "/all"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var parameters: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var task: Task {
        return .request
    }
    
    public var validate: Bool {
        switch self {
        case .all:
            return true
        default:
            return false
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .all:
            return "[{\"name\": \"Colombia\",\"topLevelDomain\": [\".co\"],\"alpha2Code\": \"CO\",\"alpha3Code\": \"COL\",\"callingCodes\": [\"57\"],\"capital\": \"Bogotá\",\"altSpellings\":[\"CO\", \"Republic of Colombia\", \"República de Colombia\"],\"region\": \"Americas\",\"subregion\": \"South America\",\"population\": 48759958,\"latlng\": [4.0, -72.0],\"demonym\": \"Colombian\",\"area\": 1141748.0,\"gini\": 55.9,\"timezones\": [\"UTC-05:00\"],\"borders\": [\"BRA\", \"ECU\", \"PAN\", \"PER\", \"VEN\"],\"nativeName\": \"Colombia\",\"numericCode\": \"170\",\"currencies\": [{\"code\": \"COP\",\"name\": \"Colombian peso\",\"symbol\": \"$\"}],\"languages\": [{\"iso639_1\": \"es\",\"iso639_2\": \"spa\",\"name\": \"Spanish\",\"nativeName\": \"Español\"}],\"translations\": {\"de\": \"Kolumbien\",\"es\": \"Colombia\",\"fr\": \"Colombie\",\"ja\": \"コロンビア\",\"it\": \"Colombia\",\"br\": \"Colômbia\",\"pt\": \"Colômbia\"},\"flag\": \"https://restcountries.eu/data/col.svg\",\"regionalBlocs\": [{\"acronym\": \"PA\",\"name\": \"Pacific Alliance\",\"otherAcronyms\": [],\"otherNames\": [\"Alianza del Pacífico\"]}, {\"acronym\": \"USAN\",\"name\": \"Union of South American Nations\",\"otherAcronyms\": [\"UNASUR\", \"UNASUL\", \"UZAN\"],\"otherNames\": [\"Unión de Naciones Suramericanas\", \"União de Nações Sul-Americanas\", \"Unie van Zuid-Amerikaanse Naties\", \"South American Union\"]}]}]".data(using: String.Encoding.utf8)!
        }
    }
    
    public var headers: [String: String]? {
        return nil
    }
    
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}


//MARK: - Response Handlers

extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}

