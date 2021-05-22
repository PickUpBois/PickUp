//
//  MapMainView.swift
//  PickUp
//
//  Created by David Reynolds on 5/21/21.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapMainView: View {
        @StateObject var mapData = MapViewModel()
        @State var locationManager = CLLocationManager()
    var body: some View {
        NavigationView{
        ZStack{
            
            
            //MapView..
            MapView()
                .environmentObject(mapData)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack{
                
                VStack(spacing: 0 ){
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search...", text: $mapData.searchTxt)
                            .colorScheme(.light)
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color.white)
                    
                    // Displaying Results...
                    if !mapData.places.isEmpty && mapData.searchTxt != ""{
                        
                        ScrollView{
                            
                            VStack(spacing: 15){
                                
                                ForEach(mapData.places){place in
                                    
                                    Text(place.place.name ?? "")
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading)
                                        .onTapGesture {
                                            mapData.selectPlaces(place: place)
                                        }
                                    
                                    Divider()
                                }
                            }
                            .padding(.top)
                        }
                        .background(Color.white)
                    }
                    
                }
                .padding()
                
                Spacer().frame(minHeight: 1, maxHeight: 1)
                
            //Button for Tab View
                
                HStack{
                
                Image(systemName: "list.bullet")
                            .foregroundColor(Color.black)
                    .padding(.leading, 20.0)
                    
                Button(action: {
                    withAnimation(.easeIn){mapData.showMenu.toggle()}
                        //Open Menu
                },label: {
                    Text("Filters")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                    
                })
                
                
                } .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    
                    Button(action: mapData.focusLocation, label: {
                        Image(systemName: "location.fill")
                            .font(.title2)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                    })
                    
                    Button(action: mapData.updateMapType, label: {
                        Image(systemName: mapData.mapType == .standard ? "network" : "map")
                            .font(.title2)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                    })
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            }
            
            // Side menu...
            HStack{
            MapSideMenuView(mapData: mapData)
                // Move Effect From Left...
                    .offset(x: mapData.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
                    
                Spacer(minLength: 0)
                }
            .background(Color.black.opacity(mapData.showMenu ? 0.3: 0).ignoresSafeArea())
                //Closing When Taps Outside...
            .onTapGesture(perform: {
                withAnimation(.easeIn){mapData.showMenu.toggle()}
                    })
            
        }
        .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("logo2")
                            .resizable()
                            .padding(.top, -15)
                            .frame(width: 125, height: 30)
                            .scaledToFit()
                        
                    }
                }
            }
        .onAppear(perform: {
                
            //Setting Delegate
                locationManager.delegate = mapData
                locationManager.requestWhenInUseAuthorization()
        })
        
        //Permission Deined Alert...
        
        .alert(isPresented: $mapData.permissionDeined, content: {
        
            Alert(title: Text("Permission Deined"),message: Text("Please Enable Permission In App Settings"), dismissButton: .default(Text("Go to Settings"), action: {
                            
                
            // redirecting User to Settings...
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                
            }))
            
        })
        .onChange(of: mapData.searchTxt, perform: {value in
            
        //Searching places...
            
        // Change delay time to avoid continous search requests...
        let delay = 0.3
        DispatchQueue.main.asyncAfter(deadline: .now() + delay)
        {

            if value == mapData.searchTxt{
            
            //Search...
            self.mapData.searchQuery()
                }
            }
        })
    }
    }
    
}


struct MapMainView_Previews: PreviewProvider {
    static var previews: some View {
        MapMainView()
    }
}
