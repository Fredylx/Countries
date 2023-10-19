//
//  CountryListViewModel.swift
//  Countries
//
//  Created by Nicky Taylor on 1/16/23.
//

import Foundation

class CountryListViewModel: ObservableObject {
    
    static func preview() -> CountryListViewModel {
        CountryListViewModel()
    }
    
    @Published var countries = [CountryModel]()
    
    var fetchCountriesTask: Task<Void, Never>?
    
    func fetchCountries() {
        fetchCountriesTask?.cancel()
        fetchCountriesTask = Task {
            do {
                let _countries = try await fetchCountriesAsync()
                await MainActor.run {
                    self.countries = _countries
                }
            } catch let error {
                print("our error was this: \(error.localizedDescription)")
            }
        }
    }
    
    private func fetchCountriesAsync() async throws -> [CountryModel] {
     
        let urlString = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
        if let url = URL(string: urlString) {
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if Task.isCancelled {
                return []
            }
            
            let result = try JSONDecoder().decode([CountryModel].self, from: data)
            return result
            
        } else {
            //could not get the url...
            throw URLError(.badURL)
        }
        
        
    }
    
    
}
