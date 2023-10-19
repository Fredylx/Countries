//
//  CountryModel.swift
//  Countries
//
//  Created by Nicky Taylor on 1/16/23.
//

import Foundation

struct CountryModel: Decodable {
    let capital: String
    let code: String
    let name: String
}

extension CountryModel: Identifiable {
    var id: String { return code }
}

extension CountryModel {
    
    static func preview() -> CountryModel {
        
        let jsonString = """
{
    "capital": "Kabul",
    "code": "AF",
    "currency": {
        "code": "AFN",
        "name": "Afghan afghani",
        "symbol": "؋"
    },
    "flag": "https://restcountries.eu/data/afg.svg",
    "language": {
        "code": "ps",
        "name": "Pashto"
    },
    "name": "Afghanistan",
    "region": "AS"
}
"""
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("unable to derive data from json string...")
        }
        
        guard let result = try? JSONDecoder().decode(CountryModel.self, from: jsonData) else {
            fatalError("unable to derive CountryModel from json data...")
        }
        
        return result
    }
    
}
