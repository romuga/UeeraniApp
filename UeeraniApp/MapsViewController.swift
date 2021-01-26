//
//  MapsViewController.swift
//  UeeraniApp
//
//  Created by Ross on 26/01/21.
//

import UIKit
import MapKit
import CoreLocation

class MapsViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet private var mapView: MKMapView!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        //let michoacan = CLLocation(latitude: 19.1666700, longitude: -101.8333300)
        //let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
            //mapView.setCameraZoomRange(zoomRange, animated: true)
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.requestLocation()
        
        let angangueo = Pueblo(
          title: "Angangueo",
          locationName: "Angangueo",
          coordinate: CLLocationCoordinate2D(latitude: 19.6229652, longitude: -100.3071972))
        mapView.addAnnotation(angangueo)
        let patz = Pueblo(
          title: "Patzcuaro",
          locationName: "Patzcuaro",
          coordinate: CLLocationCoordinate2D(latitude: 19.5211878, longitude: -101.6423713))
        mapView.addAnnotation(patz)
        let cuitzeo = Pueblo(
          title: "Cuitzeo",
          locationName: "Cuitzeo",
          coordinate: CLLocationCoordinate2D(latitude: 19.9687052, longitude: -101.161194))
        mapView.addAnnotation(cuitzeo)

    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Se obtuvo la ubicacion")
        if let ubicaciones = locations.last{
            let latitud = ubicaciones.coordinate.latitude
            let longitud = ubicaciones.coordinate.longitude
            print("lat: \(latitud), long: \(longitud)")
            let ubicacionUser = Pueblo(
              title: "Tu ubicación",
              locationName: "Tu ubicación",
              coordinate: CLLocationCoordinate2D(latitude: latitud, longitude: longitud))
            mapView.addAnnotation(ubicacionUser)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    


}
