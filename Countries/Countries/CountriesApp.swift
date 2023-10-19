//
//  CountriesApp.swift
//  Countries
//
//  Created by Nicky Taylor on 1/16/23.
//

import SwiftUI

@main
struct CountriesApp: App {
    
    var countryListViewModel = CountryListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(countryListViewModel: countryListViewModel)
        }
    }
}
