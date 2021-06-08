//
//  FinishPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/24/21.
//

import SwiftUI

struct FinishPickupView: View {
    var arrayOfNames = ["Arian", "David", "Ashwin", "Jimmy"]
    @State private var selectedIndex = 0
    let viewModel: NotificationViewModel

    var body: some View {
        
        Spacer().frame(height: 20)
        
        VStack (alignment: .leading){
            //Name Stack
            HStack {
                Image("serena")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 25, height: 25, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 2)
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                
                Text("Ashwin Yedavalli")
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .lineLimit(1)
            }
            
            Spacer().frame(height: 10)
            
            //Adding Picture and Public/Private Stack
            HStack{
            Text("Vote for MVP:")
                .font(.subheadline)
                .fontWeight(.bold)
            Spacer().frame(width: 5)
                Picker("Names", selection: $selectedIndex) {
                    ForEach(0 ..< arrayOfNames.count) {
                            Text(self.arrayOfNames[$0])
                                   }
                    .pickerStyle(WheelPickerStyle())
                           }

                .frame(width: 300.0, height: 175.0)
            }
            HStack {
                    Button(action: {},
                           label: {
                    Text("Private or Public")
                        .foregroundColor(Color.blue).opacity(0.8)
                        .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                            .cornerRadius(9)
                    })
                    
                    Spacer().frame(width: 10)
                    
                    Button(action: {
                    },label: {
                    Text("Add Picture")
                        .foregroundColor(Color.blue).opacity(0.8)
                        .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                            .cornerRadius(9)
                    })

            }.frame(width: 400)
            
            Spacer().frame(height: 10)
            
            //Caption Stack
            HStack{
                Text(" Caption...").fontWeight(.ultraLight)
                    .foregroundColor(Color.black).opacity(0.8)
            }.frame(width: 405, height: 180, alignment: .topLeading)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 0.5)
            
            //Add Teammates Stack
            HStack{
                Button(action: {},
                       label: {
                Text("Add Teammates")
                    .foregroundColor(Color.blue).opacity(0.8)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 140)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        .cornerRadius(9)
            })
            }
            
            //Post Stack
            HStack{
                Button(action: {},
                       label: {
                Text("Post")
                    .foregroundColor(Color.blue).opacity(0.8)
                    .padding(.vertical, 10)
                        .padding(.horizontal, 185)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        .cornerRadius(9)
            })
            }
            
            
        }
                
        
        Spacer()
        
        }
}

struct FinishPickupView_Previews: PreviewProvider {
    static var previews: some View {
        FinishPickupView(viewModel: MockNotificationViewModel())
    }
}
