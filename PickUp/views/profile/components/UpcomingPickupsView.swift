//
//  UpcomingPickupsView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct UpcomingPickupsView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    @State var eventPopUp = false
    @State var selectedEvent: EventDetails? = nil
    @Environment(\.colorScheme) var colorscheme
    //Gesture Properties
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    
    let threeColumns = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        ZStack{
        ScrollView {
            VStack{
                LazyVGrid(columns: threeColumns, spacing: 5){
                    ForEach(self.viewModel.upcomingEvents, id: \.self.id) { event in
                        Button(action: {
                            withAnimation(.easeIn){
                            self.eventPopUp = true
                                
                            selectedEvent = event
                            }
                            
                        }, label: {
                        EventDetailsBoxSmallView(id: 0, event: event)
                        .padding(.vertical, 10.0)
                        .padding(.horizontal, 2)
                        .background(Color("Background_Events"))
                        .cornerRadius(4)
                            
                        })
                    }
                }.padding(.horizontal)
        }
        }
        .opacity(self.eventPopUp ? 0.2: 1)
            
            if self.eventPopUp {
                
                GeometryReader{proxy -> AnyView in
                
                    let height = proxy.frame(in: .global).height
                
                        return AnyView(
                            
                            ZStack{
                                BlurView(style: colorscheme == .light ? .light: .dark)
                                    .clipShape(CustomCorners(corners: [.topLeft,. topRight], radius: 30))
                                
                                VStack{
                                    Capsule()
                                        .fill(Color.white)
                                        .frame(width: 60, height: 2)
                                        .padding(.top)
                                    
                                    ScrollView{
                                            EventDetailsBoxView(event: selectedEvent!, viewModel: EventDetailsBoxViewModel(event: selectedEvent!))
                                                .padding(.all, 20.0)
                                    }
                                    
                                }
                                .frame(maxHeight: .infinity, alignment: .top)
                            }
                            // Initial State
                            .offset(y: height - 200)
                            // Up State
                            .offset(y: -offset > 0 ? -offset <= (height - 250) ? offset : -(height - 250) : 0)
                            // Down State
                            .offset(y: -offset < 0 ? -offset >= (height - 800) ? offset : -(height - 800) : 0)
                            .gesture(DragGesture().updating($gestureOffset, body: { value, out, _ in
                                
                                out = value.translation.height
                                onChange()
                            }).onEnded({ value in
                                
                                let maxHeight = height - 250
                                let minHeight = height - 800
                                withAnimation{
                                   
                                    //Logic Conditions for moving states...
                                    //Up down or mid...
                                    if -offset > 200 && -offset < maxHeight / 2 {
                                        //mid..
                                        offset = -(maxHeight / 3)
                                    }
                                    else if -offset > maxHeight / 2{
                                        offset = -maxHeight
                                    }
                                    
                                    else if -offset < minHeight / 2{
                                        self.eventPopUp = false
                                        //Here change offset = -minHeight to popup to be false
                                    }
                                    else{
                                        offset = 0
                                    }
                                }
                                
                                //Storing Last Offset..
                                //So that the gesture can continue from the last poistion...
                                
                                if self.eventPopUp{
                                lastOffset = offset
                                }
                                
                                else if self.eventPopUp == false{
                                offset = 0
                                }
                            }))
                        
                        )
                    
                }.ignoresSafeArea(.all, edges: .bottom)
                //}
                //Ending
                
            }
        }
        
    }
    func onChange(){
        DispatchQueue.main.async {
            self.offset = gestureOffset + lastOffset
        }
    }
    
    //Blur Radius for BG>..
    func getBlurRadius()->CGFloat{
        let progress = -offset / (UIScreen.main.bounds.height - 200)
        
        return progress * 30
    }
}

extension UpcomingPickupsView {
    class ViewModel {
        var events: [GetUserEventsQuery.Data.UserEvent]
        init(events: [GetUserEventsQuery.Data.UserEvent]) {
            self.events = events
        }
    }
}



struct UpcomingPickupsView_Previews: PreviewProvider {
    static let attendees = [EventDetails.Attendee(id: "1", firstName: "1", lastName: "last", username: "username")]
    static let event1 = EventDetails(id: "1", name: "event", info: "info", capacity: 4, attendees: attendees, startDate: Date().isoString, type: .tennis, status: .open)
    static let event2 = event1
    static var previews: some View {
        UpcomingPickupsView().environmentObject(MockProfileViewModel(userId: "1"))
    }
}

extension Date {
    var isoString: String {
        get {
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            let isoDateString = formatter.string(from: self)
            return isoDateString
        }
    }
}





//VStack(alignment:.center){
//    ZStack{
//        EventDetailsBoxView(event: selectedEvent!, viewModel: EventDetailsBoxViewModel(event: selectedEvent!))
//        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.2, alignment: .top)
//            .padding(.vertical, 10.0)
//            .padding(.horizontal, 10)
//
//        }.background(Color("Friends_Popup_Background").edgesIgnoringSafeArea(.all))
//            .cornerRadius(20)
//
//    Button(action: {
//    withAnimation{
//        self.eventPopUp.toggle()
//    }
//}) {
//    Image(systemName: "x.circle.fill").resizable()
//        .frame(width: 20, height: 20)
//        .foregroundColor(Color("Text"))
//        .padding(15)
//
//}
//.clipShape(Circle())
//.padding(.top, 5)
//}                                        .onTapGesture(perform: {
//    withAnimation(.easeIn){
//        self.eventPopUp = false}
//        })
