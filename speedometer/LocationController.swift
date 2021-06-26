//
//  LocationController.swift
//  speedometer
//
//  Created by Lalith  on 25/06/21.
//

import Foundation
import CoreLocation
import SwiftUI
import Combine

class LocationController: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    let objectWillChange = PassthroughSubject<LocationController, Never>()

    
    var speed: Double = 0 {
        didSet {
            objectWillChange.send(self)
        }
    }
    var speedProgress: Double = 0 {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    override init() {
        super.init()
        setupLocationService()
    }
    
    
    func setupLocationService() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func getLocation(){
        print(locationManager.requestLocation())
    }
    
    private func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("a")
        if status != CLAuthorizationStatus.denied{
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        if status != CLAuthorizationStatus.denied{
            locationManager.startUpdatingLocation()
//        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if(locationManager.location!.speed > 0){
            speed = locationManager.location!.speed*3.6
            if(speed>200){
                speedProgress = 200
            }
            else{
                speedProgress = speed
            }
        }
        else{
            speed = 0
        }
//        print(locationManager.location!.speedAccuracy)
        objectWillChange.send(self)
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {

    }
    
}
