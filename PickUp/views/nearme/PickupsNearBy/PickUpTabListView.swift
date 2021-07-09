//
//  PickUpTabListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct PickUpTabListView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var selection: EventType = .tennis
    @State var expand = false
    @Environment(\.colorScheme) var colorscheme
    //@State var eventsPopUp: Bool = false
    //Gesture Properties
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    var body: some View {
        ZStack{
        VStack{
            HStack{
                Text("PickUps")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color("Text"))
                
            Image(systemName: "sportscourt")
                .resizable()
                .frame(width: 25, height: 20)
                .foregroundColor(Color.blue)
                
            Spacer()
                
                HStack{
                Text("Filters").font(.headline)
                    Image(systemName: expand ? "chevron.up.circle.fill": "chevron.down.circle.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.green)
                }.onTapGesture {
                    self.expand.toggle()
                }
                
            }.padding(.trailing, 15)
            
            Spacer().frame(height: 15)
            
            PickUpListView(type: .basketball)

        }
            
            //Beginging
            
            //Bottom Sheet....
            //Height for Drag Gesture....
            
           //if self.eventsPopUp {

            GeometryReader{proxy -> AnyView in
            
                let height = proxy.frame(in: .global).height
            
                    return AnyView(
                        
                        ZStack{
                            BlurView(style: colorscheme == .light ? .light: .dark)
                                .clipShape(CustomCorners(corners: [.topLeft,. topRight], radius: 30))
                            
                            VStack{
                                Capsule()
                                    .fill(Color.white)
                                    .frame(width: 60, height: 4)
                                    .padding(.top)
                                
                                
//                                EventDetailsBoxView(event: event, viewModel: EventDetailsBoxViewModel(event: event, refresh: self.viewModel.getUpcomingEvents))
//                                                .padding(.all, 30.0)
//                                                .background(Color("Friends_Popup_Background"))
                                
                            }
                            .frame(maxHeight: .infinity, alignment: .top)
                        }
                        // Initial State
                        .offset(y: height - 300)
                        // Up State
                        .offset(y: -offset > 0 ? -offset <= (height - 580) ? offset : -(height - 580) : 0)
                        // Down State
                        .offset(y: -offset < 0 ? -offset >= (height - 1000) ? offset : -(height - 1000) : 0)
                        .gesture(DragGesture().updating($gestureOffset, body: { value, out, _ in
                            
                            out = value.translation.height
                            onChange()
                        }).onEnded({ value in
                            
                            let maxHeight = height - 580
                            let minHeight = height - 1000
                            withAnimation{
                               
                                //Logic Conditions for moving states...
                                //Up down or mid...
                                if -offset > 300 && -offset < maxHeight / 2 {
                                    //mid..
                                    offset = -(maxHeight / 3)
                                }
                                else if -offset > maxHeight / 2{
                                    offset = -maxHeight
                                }
                                
                                else if -offset < minHeight / 2{
                                    offset = -minHeight
                                    //Here change offset = -minHeight to popup to be false
                                }
                                else{
                                    offset = 0
                                }
                            }
                            
                            //Storing Last Offset..
                            //So that the gesture can continue from the last poistion...
                            
                            lastOffset = offset
                        }))
                    
                    )
                
            }.ignoresSafeArea(.all, edges: .bottom)
            //}
            //Ending
            
            if expand {
            DropDown()
                .cornerRadius(20)
                .padding(4)
                .animation(.spring())
                .padding(.leading, 295)
                .padding(.bottom, 460)
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
        let progress = -offset / (UIScreen.main.bounds.height - 300)
        
        return progress * 30
    }
}


struct PickUpTabListView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpTabListView().environmentObject(MockHomeViewModel())
    }
}

struct DropDown : View {
    @State var expand = false
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            
            Button(action: {
                
            }) {
                Text("Radius").padding()
            }
            
            //Divider()
            
            Button(action: {
                
            }) {
                Text("Date").padding()
            }
            
            //Divider()
            
            Button(action: {
                
            }) {
                Text("Going").padding()
            }
            
            //Divider()
            
            Button(action: {
                
            }) {
                Text("Capacity").padding()
            }

            
        }
        .foregroundColor(Color("Text"))
        .font(.caption)
        .background(Color("Tabbar"))
        .cornerRadius(15)
}
}
