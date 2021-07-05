//
//  BlurView.swift
//  PickUp
//
//  Created by David Reynolds on 7/5/21.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
   
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context){
        
    }
}

