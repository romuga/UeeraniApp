//
//  Pueblo.swift
//  UeeraniApp
//
//  Created by Ross on 26/01/21.
//

import Foundation
import MapKit

class Pueblo: NSObject, MKAnnotation {
  let nombre: String?
  let locationName: String?
  let coordinate: CLLocationCoordinate2D

  init(
    title: String?,
    locationName: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.nombre = title
    self.locationName = locationName
    self.coordinate = coordinate

    super.init()
  }

  var subtitle: String? {
    return locationName
  }
}
