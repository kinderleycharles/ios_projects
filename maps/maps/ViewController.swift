//
//  ViewController.swift
//  maps
//
//  Created by Kinderley Charles on 9/16/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let currentLocation = locations[0] as CLLocation
        let lat = currentLocation.coordinate.latitude
        let long = currentLocation.coordinate.longitude
        
        // The delta specifies how big is your zoom
        let latDelta: CLLocationDegrees = 0.01
        let longDelta: CLLocationDegrees = 0.01
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let locationCoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(locationCoord, span)
    
        map.setRegion(region, animated: true)
        
    }
    
    @IBAction func zoomMe(sender: AnyObject) {
    }

    @IBAction func zoomCISE(sender: AnyObject) {
        locationManager.stopUpdatingLocation()
        
        let lat: CLLocationDegrees = 29.64821
        let long: CLLocationDegrees = -82.344
        
        // The delta specifies how big is your zoom
        let latDelta: CLLocationDegrees = 0.01
        let longDelta: CLLocationDegrees = 0.01
        
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let locationCoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(locationCoord, span)
        
        map.setRegion(region, animated: true)
    }
}

