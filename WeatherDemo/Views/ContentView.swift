//
//  ContentView.swift
//  WeatherDemo
//
//  Created by miguel tomairo on 26/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    
    @State var weather: ResponseBody?
    
    var body: some View {
        
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                }else {
                    LoadingView()
                        .task {
                            do {
                               weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                
                            }catch {
                                print("Error get fetch weather data: \(error)")
                            }
                        }
                }
            }else {
                
                if locationManager.isLoading {
                    LoadingView()
                }else {
                    VStack {
                        WellcomeView()
                        .environmentObject(locationManager)
                    }
                }
            }
        }
        .background(Color(hue: 0.655, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
