//
//  TennisPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/12/21.
//


import SwiftUI


struct TennisPickupView: View {
    @State private var showPopUp = false
    var body: some View {
        ScrollView{
        VStack{
            Spacer()
                HStack{
                    Text("Singles")
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                    Image(systemName:"calendar")
                        .foregroundColor(Color.red)
                    Text("Date")
                            Spacer()
                                .frame(minWidth: 10, maxWidth: 10)
                                .lineLimit(1)
                    
                }
                        
                        Spacer().frame(height: 2)
                        HStack(alignment: .center){
                            Image(systemName:"location.fill")
                                .foregroundColor(Color.blue)
                                .lineLimit(1)
                            Text("Location")
                            Text("Going")
                                .foregroundColor(Color.green)
                                .lineLimit(1)
                        }
            
                        Spacer().frame(height: 2)
                        HStack(alignment: .center){
                            Button(action: {
                                self.showPopUp.toggle()
                            }, label: {
                                Text("More Details?")
                                    .foregroundColor(Color.purple)
                                
                            })
                                
                            }.sheet(isPresented: $showPopUp, content: {
                                Button(action: {
                                    self.showPopUp.toggle()
                                },label: {
                                    Text("Dismiss")
                                })
                            })

                Spacer().frame(height: 8)
        }.frame(width: 175, height: 80, alignment: .center)
                            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                            .cornerRadius(8)
        
                Spacer().frame(height: 25)
            
            VStack{
                Spacer()
                    HStack{
                        Text("Doubles")
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                        Image(systemName:"calendar")
                            .foregroundColor(Color.red)
                        Text("Date")
                                Spacer()
                                    .frame(minWidth: 10, maxWidth: 10)
                                    .lineLimit(1)
                        
                            }
                            
                            
                            Spacer().frame(height: 2)
                            HStack(alignment: .center){
                                Image(systemName:"location.fill")
                                    .foregroundColor(Color.blue)
                                    .lineLimit(1)
                                Text("Location")
                                Text("Going")
                                    .foregroundColor(Color.green)
                                    .lineLimit(1)


                                    }
            }.frame(width: 175, alignment: .center)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                                .cornerRadius(8)
            
                    Spacer().frame(height: 25)
            VStack{
                Spacer()
                    HStack{
                        Text("Doubles")
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                        Image(systemName:"calendar")
                            .foregroundColor(Color.red)
                        Text("Date")
                                Spacer()
                                    .frame(minWidth: 10, maxWidth: 10)
                                    .lineLimit(1)
                        
                            }
                            
                            
                            Spacer().frame(height: 2)
                            HStack(alignment: .center){
                                Image(systemName:"location.fill")
                                    .foregroundColor(Color.blue)
                                    .lineLimit(1)
                                Text("Location")
                                Text("Closeby")
                                    .foregroundColor(Color.orange)
                                    .lineLimit(1)


                                    }
            }.frame(width: 175, alignment: .center)
                                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                                .cornerRadius(8)
            
                    Spacer().frame(height: 25)
            VStack{
                Spacer()
                    HStack{
                        Text("Singles")
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                        Image(systemName:"calendar")
                            .foregroundColor(Color.red)
                        Text("Date")
                                Spacer()
                                    .frame(minWidth: 10, maxWidth: 10)
                                    .lineLimit(1)
                        
                            }
                            
                            
                            Spacer().frame(height: 2)
                            HStack(alignment: .center){
                                Image(systemName:"location.fill")
                                    .foregroundColor(Color.blue)
                                    .lineLimit(1)
                                Text("Location")
                                Text("Going")
                                    .foregroundColor(Color.green)
                                    .lineLimit(1)


                                    }
            }.frame(width: 175, alignment: .center)
                                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                                .cornerRadius(8)
            
                    Spacer().frame(height: 25)
            }
    }
    }

struct TennisPickupView_Previews: PreviewProvider {
    static var previews: some View {
        TennisPickupView()
    }
}

