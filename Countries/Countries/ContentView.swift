//
//  ContentView.swift
//  Countries
//
//  Created by Nicky Taylor on 1/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var countryListViewModel: CountryListViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(countryListViewModel.countries) { country in
                    CountryCellView(country: country)
                }
            }
        }
        .onAppear {
            countryListViewModel.fetchCountries()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(countryListViewModel: CountryListViewModel.preview())
    }
}
