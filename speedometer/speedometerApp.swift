//
//  speedometerApp.swift
//  speedometer
//
//  Created by Lalith  on 25/06/21.
//

import SwiftUI

@main
struct speedometerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(locationController: LocationController())
        }
    }
}
