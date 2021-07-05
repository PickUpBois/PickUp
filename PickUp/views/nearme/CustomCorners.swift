//
//  CustomCorners.swift
//  PickUp
//
//  Created by David Reynolds on 7/5/21.
//

import SwiftUI

struct CustomCorners: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
    
}
