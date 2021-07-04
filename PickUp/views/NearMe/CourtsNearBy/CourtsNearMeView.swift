//
//  CourtInfoView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/12/21.
//

import SwiftUI

struct PlaceModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let radius: Int
    let percentage: Int
    let hours: String
    let status: String
}
    
class ArrayModificationViewModel: ObservableObject {
        
        @Published var dataArray: [PlaceModel] = []
        //@Published var filteredArrary: [PlaceModel] = []
    
    
        init() {
            getPlaces()
        }
    
//    func updateFilteredArray(){
//        //sort
//        filteredArrary = dataArray.sorted { (place1,place2) -> Bool in
//            return place1.radius > place2.radius
//
//        }
//
//        //filter
//
//        //map
//
//
//    }
    
    
        func getPlaces() {
            let place1 = PlaceModel(title: "State Gym", radius: 25, percentage: 30, hours: "8:00 AM - 10:00 PM", status: "Open")
            let place2 = PlaceModel(title: "Planet Fitness", radius: 10, percentage: 20, hours: "6:00 AM - 12:00 PM", status: "Open")
            let place3 = PlaceModel(title: "La Fitness", radius: 60, percentage: 30, hours: "2:00 AM - 10:00 PM",  status: "Closed")
            let place4 = PlaceModel(title: "Anytime Fitness", radius: 80, percentage: 25, hours: "8:00 PM - 10:00 PM",  status: "Open")
            let place5 = PlaceModel(title: "La Basketall Courts", radius: 120, percentage: 10, hours: "11:00 AM - 10:00 PM",  status: "Open")
            let place6 = PlaceModel(title: "San Fran Tennis Courts", radius: 10, percentage: 15, hours: "6:00 AM - 10:00 PM",  status: "Closed")
            let place7 = PlaceModel(title: "Chicago Soccer Fields", radius: 90, percentage: 95, hours: "12:00 PM - 10:00 PM",  status: "Open")
            let place8 = PlaceModel(title: "Miami Rec Pool", radius: 1000, percentage: 80, hours: "1:00 PM - 10:00 PM",  status: "Closed")
            let place9 = PlaceModel(title: "Rocky Mountain Rock Climbing", radius: 900, percentage: 30, hours: "2:00 PM - 10:00 PM",  status: "Open")
            let place10 = PlaceModel(title: "Arizona Hiking Trail", radius: 30, percentage: 20, hours: "12:00 AM - 12:00 PM",  status: "Open")
            self.dataArray.append(contentsOf: [
                place1,
                place2,
                place3,
                place4,
                place5,
                place6,
                place7,
                place8,
                place9,
                place10,
            ])
            
    }

}
struct CourtsNearMeView: View {
    @StateObject var vm = ArrayModificationViewModel()
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                ForEach(vm.dataArray) {place in
                    VStack (alignment: .leading){
                        //First line w/ title & Open/Closed
                        HStack{
                        HStack(spacing: 5){
                            Image("b8")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 20, height: 20)
                                .clipShape(Circle())
                        Text(place.title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .lineLimit(1)
                        }
                        Spacer()
                            if place.status == "Open" {
                                Text("Open")
                                    .foregroundColor(.green)
                            }
                            else{
                                Text("Closed")
                                    .foregroundColor(.red)
                            }
                        }
                        
                        Spacer().frame(height: 8)
                        //Second line w/ Capacity
                        HStack{
                            HStack(spacing: 5){
                            Image(systemName:"person.fill")
                                .foregroundColor(Color.purple)
                            Text("Capacity")
                            }
                            //ZStack for bar fill capacity
                            ZStack(alignment: .leading){
                                Capsule().frame(width: 200, height: 20)
                                    .foregroundColor(.blue)
                                //ZStack for percentage/capacity
                                ZStack(alignment: .center){
                                Capsule().frame(width: 100, height: 20)
                                    .foregroundColor(.orange)
                                Text("\(place.percentage)%")
                                }
                                        }
                        }
                        //Third line w/ Hours & Radius
                        HStack{
                            HStack (spacing: 5){
                            Image(systemName:"calendar")
                                .foregroundColor(Color.red)
                            Text("Hours \(place.hours)")
                            }
                            
                        Spacer()
                            Text("\(place.radius) miles")
                        }
                        
                    }
                }
                .padding()
                .foregroundColor(Color("Text"))
                .background(Color("Background_SmallView"))
                .cornerRadius(15)
            }
        }
    }
}



struct CourtsNearMeView_Previews: PreviewProvider {
    static var previews: some View {
        CourtsNearMeView()
    }
}
