//
//  PastPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct PastPickupView: View {
@EnvironmentObject var viewModel: ProfileViewModel
@Environment(\.colorScheme) var colorscheme
@State var eventPopUp = false
@State var selectedEvent: EventDetails? = nil
@State var offset: CGFloat = 0
@State var lastOffset: CGFloat = 0
@GestureState var gestureOffset: CGFloat = 0

let threeColumns = [GridItem(), GridItem(), GridItem()]

    func getWinLoss(event: EventDetails) -> String {
        var teamIndex = 0
        for i in 0..<event.teams[1].members.count {
            let memberId = event.teams[1].members[i].fragments.attendeeDetails.user.fragments.userDetails.id
            if viewModel.user?.id == memberId {
                teamIndex = 1
                break
            }
        }
        let teamId = event.teams[teamIndex].info!.id
        let winnerId = event.winner!.id
        if teamId == winnerId {
            return "Winner"
        } else {
            return "Loser"
        }
    }
    var body: some View {
        ZStack{
        ScrollView {
            VStack {
            LazyVGrid(columns: threeColumns, spacing: 5){
            ForEach(self.viewModel.pastEvents, id: \.self.id) { event in
//<<<<<<< HEAD
//                Spacer().frame(height: 15)
//                VStack {
//                        EventDetailsBoxView(event: event)
//                        Spacer().frame(height: 10)
//                HStack{
//                HStack(alignment: .top){
//                    Text("🐐")
//                    if event.mvp != nil {
//                        if event.mvp!.id == viewModel.user?.id {
//                            Text("MVP")
//                                .fontWeight(.bold)
//                                .foregroundColor(.black)
//                                .lineLimit(1)
//                                .frame(alignment: .leading)}
//                            Spacer()
//                        }
//=======
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



//HStack(alignment: .top){
//        Text("🐐")
//        if event.mvp != nil {
//            if event.mvp!.id == viewModel.user?.id {
//                Text("MVP")
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//                    .lineLimit(1)
//                    .frame(alignment: .leading)}
//                Spacer()
//            }
//        }
//HStack{
//        Text("🏅")
//            Text(getWinLoss(event: event))
//                .fontWeight(.bold)
//                .foregroundColor(.black)
//                .lineLimit(1)
//    }.padding(.trailing, 60)
