//
//  OLDpastpickups.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/18/21.
//

import SwiftUI

struct OLDpastpickups: View {
    var body: some View {
        
                Spacer().frame(height: 5)
        
                VStack{
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
                                
                                Spacer().frame(minHeight: 10, maxHeight: 10)
                                
                                Image("wimby08").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width/1, height: UIScreen.main.bounds.height/4.75).clipped()
                
                            
                            Spacer().frame(height: 10)
                            HStack(alignment: .center){
                                Image(systemName:"person.circle")
                                Text("With Arian Rahbar + 2 more")}
                            }.padding([.leading, .bottom, .trailing], 15.0)
                                .background(Color(red: 0, green: 1, blue: 0, opacity: 0.25))
                                .cornerRadius(8)
                                .padding(.horizontal, 20)
                    
                    HStack{Text("Like")
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("👍")})
                        Text("999")
                    }
                    
                    Spacer().frame(height: 20)
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
                            
                            Spacer().frame(minHeight: 10, maxHeight: 10)
                            
                            Image("Tyrese").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width/1, height: UIScreen.main.bounds.height/4.75).clipped()
                                .cornerRadius(20)
                           
                            Spacer().frame(height: 10)
                            HStack(alignment: .center){
                                Image(systemName:"person.circle")
                                Text("With David Reynolds + 2 more")}
                            
                                }.padding([.leading, .bottom, .trailing], 15.0)
                                    .background(Color(red: 1, green: 0.5, blue: 0, opacity: 0.25))
                                    .cornerRadius(8)
                                .padding(.horizontal, 20)
                    
                    HStack{Text("Like")
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("👍")})}
                    
                    
                }
            }
        }

        struct OLDpastpickups_preview: PreviewProvider {
            static var previews: some View {
           OLDpastpickups()
            
            }
        }


