//
//  ViewController.swift
//  LocationLogger
//
//  Created by shota_th on 2016/04/17.
//  Copyright © 2016年 s.kurihara. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet private weak var latitudeLabel: UILabel!
    @IBOutlet private weak var longitudeLabel: UILabel!
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        latitudeLabel.text = " - "
        longitudeLabel.text = " - "
        setUpLocationManager()
    }
    
    private func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        latitudeLabel.text = "\(newLocation.coordinate.latitude)"
        longitudeLabel.text = "\(newLocation.coordinate.longitude)"
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        latitudeLabel.text = " - "
        longitudeLabel.text = " - "
        print(error)
    }
    
}

