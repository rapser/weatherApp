//
//  WellcomeView.swift
//  WeatherDemo
//
//  Created by miguel tomairo on 27/11/22.
//

import SwiftUI
import CoreLocationUI

struct WellcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {

        VStack {
            VStack(spacing: 20){
                Text("Wellcome to the Weather App")
                    .bold().font(.title)
                Text("Please share your current location to get weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WellcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WellcomeView()
    }
}
