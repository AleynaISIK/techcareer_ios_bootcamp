//
//  ViewController.swift
//  LokasyonKullanimi
//
//  Created by Aleyna IŞIK on 5.10.2023.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
  
  @IBOutlet weak var labelEnlem: UILabel!
  @IBOutlet weak var labelHiz: UILabel!
  @IBOutlet weak var labelBoylam: UILabel!
  
  @IBOutlet weak var mapView: MKMapView!
  var locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    locationManager.desiredAccuracy = kCLLocationAccuracyBest //hassasiyeti ama pil yer
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
    locationManager.delegate = self

//
//    let konum = CLLocationCoordinate2D(latitude: 37.0357887, longitude: 27.3921744)
//    let zoom = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//    let bolge = MKCoordinateRegion(center: konum, span: zoom)
//    mapView.setRegion(bolge, animated: true)
//    
//    let pin = MKPointAnnotation()
//    pin.coordinate = konum
//    pin.title = "İzmir"
//    pin.subtitle = "Altbaşlık"
//    mapView.addAnnotation(pin)
//                                       
  }


}

extension ViewController : CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let sonKonum = locations[locations.count-1]
    
    let enlem = sonKonum.coordinate.latitude
    let boylam = sonKonum.coordinate.longitude
    
    labelEnlem.text = "Enlem : \(sonKonum.coordinate.latitude)"
    labelBoylam.text = "Boylam : \(sonKonum.coordinate.longitude)"
    labelHiz.text = "Hız : \(sonKonum.speed)"

    
    let konum = CLLocationCoordinate2D(latitude: enlem, longitude: boylam)
    let zoom = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    let bolge = MKCoordinateRegion(center: konum, span: zoom)
    mapView.setRegion(bolge, animated: true)
    
    let pin = MKPointAnnotation()
    pin.coordinate = konum
    pin.title = "Konum"
    pin.subtitle = "\(enlem) - \(boylam)"
    mapView.addAnnotation(pin)
    
    mapView.showsUserLocation = true
  }
}
