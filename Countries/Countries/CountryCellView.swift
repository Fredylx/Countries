//
//  CountryCellView.swift
//  Countries
//
//  Created by Nicky Taylor on 1/16/23.
//

import SwiftUI

struct CountryCellView: View {
    let country: CountryModel
    var body: some View {
        HStack {
            HStack {
                Text(country.code)
                    .font(.title.bold())
                    .foregroundColor(.red)
                Text(country.name)
                    .font(.title)
                Text(country.capital)
                    .font(.title)
                Spacer()
            }
            .padding(.all, 12.0)
            .foregroundColor(.yellow)
        }
        .background(RoundedRectangle(cornerRadius: 9.0).foregroundColor(.black))
        .padding(.horizontal, 16.0)
        .padding(.vertical, 8.0)
    }
}

struct CountryCellView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            CountryCellView(country: CountryModel.preview())
            CountryCellView(country: CountryModel.preview())
            CountryCellView(country: CountryModel.preview())
        }
    }
}
