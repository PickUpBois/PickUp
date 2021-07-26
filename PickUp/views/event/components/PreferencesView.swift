//
//  PreferencesView.swift
//  PickUp
//
//  Created by David Reynolds on 7/25/21.
//

import SwiftUI

struct PreferencesView: View {
    @State var offsetAge : CGFloat = 0
    @State var offsetLocation : CGFloat = 0
    @State var currentGenderType = "Both"
    @State var currentLevelType = "Amature"
    @State var selectedEvent: EventDetails? = nil
    var body: some View {
        ScrollView{
        VStack (alignment: .leading){
            
            Spacer().frame(height: 40)
            
            //VStack for Level and Gender
            VStack(alignment: .leading){
        
            HStack{
                Text("Level")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
                    
            }

            HStack(spacing: 10 ){
                
                ForEach(["Amature","Intermediate","Professional"],id: \.self) {tab in
                
                    LevelButton(title: tab, currentType: $currentLevelType)
                
                }
            }
            
            Spacer().frame(height: 60)
                
            HStack{
                Text("Gender")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
                    
            }
            
            HStack(spacing: 10 ){
                
                ForEach(["Both","Male","Female"],id: \.self) {tab in
                
                    GenderButton(title: tab, currentType: $currentGenderType)
                
                }

            }
            }
            
            Spacer().frame(height: 60)
            
            //HStack for Age
            HStack{
                Text("Age")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
                
                Spacer()
                
                Text(getAge())
                    
            }
            
            //ZStack for Age
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
            
                Capsule()
                    .fill(Color.black.opacity(0.8))
                    .frame(height: 30)
                
                Capsule()
                    .fill(Color.blue.opacity(0.9))
                    .frame(width: offsetAge + 20, height: 30)
                
                
                //Dots..
                
                HStack(spacing: (UIScreen.main.bounds.width - 100) / 12){

                    ForEach(0..<12,id: \.self){index in

                    Circle()
                        .fill(Color.white)
                        .frame(width: index % 4 == 0 ? 7 : 4, height: index % 4 == 0 ? 7 : 4)
                        }
                }
                .padding(.leading)
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 35, height: 35)
                    .background(Circle().stroke(Color.white, lineWidth: 5))
                    .offset(x: offsetAge)
                    .gesture(DragGesture().onChanged({ (value) in
                        
                        if value.location.x >= 20 && value.location.x <= UIScreen.main.bounds.width - 50{
                            
                            // Circle Radius = 20
                            offsetAge = value.location.x - 20
                        }
                    }))
                
            })
            
            Spacer().frame(height: 60)
            
            //HStack for Location
            HStack{
                Text("Location")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
                
                Spacer()
                
                Text(getLocation())
                    
            }
            
            //ZStack for Location
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
            
                Capsule()
                    .fill(Color.black.opacity(0.8))
                    .frame(height: 30)
                
                Capsule()
                    .fill(Color.blue.opacity(0.9))
                    .frame(width: offsetLocation + 20, height: 30)
                
                
                //Dots..
                
                HStack(spacing: (UIScreen.main.bounds.width - 100) / 12){

                    ForEach(0..<12,id: \.self){index in

                    Circle()
                        .fill(Color.white)
                        .frame(width: index % 4 == 0 ? 7 : 4, height: index % 4 == 0 ? 7 : 4)
                        }
                }
                .padding(.leading)
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 35, height: 35)
                    .background(Circle().stroke(Color.white, lineWidth: 5))
                    .offset(x: offsetLocation)
                    .gesture(DragGesture().onChanged({ (value) in
                        
                        if value.location.x >= 20 && value.location.x <= UIScreen.main.bounds.width - 50{
                            
                            // Circle Radius = 20
                            offsetLocation = value.location.x - 20
                        }
                    }))
                
            })
            
            Spacer()
            
        }.padding(.horizontal)
        }
    }
    //Calculate age
    
    func getAge() ->String{
        
        let age = offsetAge / (UIScreen.main.bounds.width - 70)
        
        let amount = age * 100
        
        return String(format: "%.0f", amount)
    }
    
    func getLocation() ->String{
        
        let location = offsetLocation / (UIScreen.main.bounds.width - 70)
        
        let amount = location * 100
        
        return String(format: "%.0f", amount)
    }
}


struct GenderButton: View {
    var title: String
    @Binding var currentType: String
    
    var body: some View {
        
        Button{
            
            withAnimation{
                
                currentType = title
                
            }
            
        } label: {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(Color("Text"))
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .background(
                    
                    Capsule()
                .stroke(Color("DescriptionEvent"))
            )
            
                .background(
                    
                    Capsule()
                        .fill(Color("DescriptionEvent").opacity(title == currentType ? 1 : 0))
            )
            
        }
    }
}


struct LevelButton: View {
    var title: String
    @Binding var currentType: String
    
    var body: some View {
        
        Button{
            
            withAnimation{
                
                currentType = title
                
            }
            
        } label: {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(Color("Text"))
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .background(
                    
                    Capsule()
                .stroke(Color("DescriptionEvent"))
            )
            
                .background(
                    
                    Capsule()
                        .fill(Color("DescriptionEvent").opacity(title == currentType ? 1 : 0))
            )
            
        }
    }
}


struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
