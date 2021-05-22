//
//  PlacesView.swift
//  PickUp
//
//  Created by David Reynolds on 5/21/21.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    var id = UUID().uuidString
    var place: CLPlacemark

}
