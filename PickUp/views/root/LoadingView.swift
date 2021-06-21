//
//  LoadingView.swift
//  PickUp
//
//  Created by David Reynolds on 6/19/21.
//

import SwiftUI

struct LoadingView: View {
        
        @State var animate = false
        
        var body: some View{
            
            VStack{
                
                Circle()
                    .trim(from: 0.0, to: 0.8)
                    .stroke(AngularGradient(gradient: .init(colors: [.green,.blue]), center: .center), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .frame(width: 45, height: 45)
                    .rotationEffect(.init(degrees: self.animate ? 360: 0))
                    .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
                
                Text("Please Wait....").padding(.top)
                
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(15)
            .onAppear {
                self.animate.toggle()
            }
            
        }
    }

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
