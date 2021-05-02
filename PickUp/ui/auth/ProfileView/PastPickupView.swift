//
//  PastPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct PastPickupView: View {
    var body: some View {
            Spacer()
        VStack{
        HStack{Image(systemName:
                        "circle.fill").foregroundColor(Color.green)
                .padding(.leading, 25.0)
                .frame(minWidth: 1, maxWidth: 10)
                    VStack{
                    Spacer()
                        HStack{
                            Text("W or L")
                                .fontWeight(.heavy)
                        Spacer().frame(minWidth: 10, maxWidth: 45)
                Image(systemName:"calendar")
                            Text("Date")
                        Spacer()
                            .frame(minWidth: 10, maxWidth: 45)
                Image(systemName:"location.fill")
                            Text("Location")}
                        Image("wimby08").frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/5).clipped()
                    }.padding([.leading, .bottom, .trailing], 25.0)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.5))
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
            }
  Spacer()
        HStack{Image(systemName:
                            "circle.fill").foregroundColor(Color.orange)
                    .padding(.leading, 25.0)
                    .frame(minWidth: 1, maxWidth: 10)
                        VStack{
                        Spacer()
                            HStack{
                                Text("W or L")
                                    .fontWeight(.heavy)
                            Spacer().frame(minWidth: 10, maxWidth: 45)
                    Image(systemName:"calendar")
                                Text("Date")
                            Spacer()
                                .frame(minWidth: 10, maxWidth: 45)
                    Image(systemName:"location.fill")
                                Text("Location")}
                            Image("Tyrese").frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/5).clipped()
                        }.padding([.leading, .bottom, .trailing], 25.0)
                            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.5))
                            .cornerRadius(8)
                        .padding(.horizontal, 20)
        }
        }
    }
}

struct PastPickupView_Previews: PreviewProvider {
    static var previews: some View {
        PastPickupView()
    }
}

