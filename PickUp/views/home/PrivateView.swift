//
//  Private.swift
//  PickUp
//
//  Created by David Reynolds on 7/1/21.
//

import SwiftUI

struct PrivateView: View {
        @State var showPopUp = false
        @StateObject var viewModel: HomeViewModel = HomeViewModel()
        @Environment(\.colorScheme) var colorscheme
        //Gesture Properties
        @State var offset: CGFloat = 0
        @State var lastOffset: CGFloat = 0
        @GestureState var gestureOffset: CGFloat = 0
        var body: some View {
           ZStack{
                VStack{
                    ScrollView {
                        PostedPickUpsView()
                    }

                }
            
            VStack{
            Spacer()
            Button(action: {
                self.showPopUp.toggle()
            },label: {
                Image(systemName: "circlebadge.fill")
                    .resizable(capInsets: EdgeInsets(top: 0.5, leading: 0.5, bottom: 0.5, trailing: 0.5))
                    .foregroundColor(Color("Tabbar"))
                    .frame(width: 50, height: 50)
                    .overlay(Image(systemName: "plus").foregroundColor(Color("Text")))
                
            }).sheet(isPresented: $showPopUp, content: {
                
                CreatePostView()
                
                
            })
            }.padding(.leading, 330)
            .padding(.bottom, 20)

            
            }
//           .opacity(self.postPopUp ? 0.2: 1)
//
//            if self.postPopUp {
//
//                GeometryReader{proxy -> AnyView in
//
//                    let height = proxy.frame(in: .global).height
//
//                        return AnyView(
//
//                            ZStack{
//                                BlurView(style: colorscheme == .light ? .light: .dark)
//                                    .clipShape(CustomCorners(corners: [.topLeft,. topRight], radius: 30))
//
//                                VStack{
//                                    Capsule()
//                                        .fill(Color.white)
//                                        .frame(width: 60, height: 2)
//                                        .padding(.top)
//
//
//
//                                }
//                                .frame(maxHeight: .infinity, alignment: .top)
//                            }
//                            // Initial State
//                            .offset(y: height - 200)
//                            // Up State
//                            .offset(y: -offset > 0 ? -offset <= (height - 250) ? offset : -(height - 250) : 0)
//                            // Down State
//                            .offset(y: -offset < 0 ? -offset >= (height - 800) ? offset : -(height - 800) : 0)
//                            .gesture(DragGesture().updating($gestureOffset, body: { value, out, _ in
//
//                                out = value.translation.height
//                                onChange()
//                            }).onEnded({ value in
//
//                                let maxHeight = height - 250
//                                let minHeight = height - 800
//                                withAnimation{
//
//                                    //Logic Conditions for moving states...
//                                    //Up down or mid...
//                                    if -offset > 200 && -offset < maxHeight / 2 {
//                                        //mid..
//                                        offset = -(maxHeight / 3)
//                                    }
//                                    else if -offset > maxHeight / 2{
//                                        offset = -maxHeight
//                                    }
//
//                                    else if -offset < minHeight / 2{
//                                        self.postPopUp = false
//                                        //Here change offset = -minHeight to popup to be false
//                                    }
//                                    else{
//                                        offset = 0
//                                    }
//                                }
//
//                                //Storing Last Offset..
//                                //So that the gesture can continue from the last poistion...
//
//                                if self.postPopUp{
//                                lastOffset = offset
//                                }
//
//                                else if self.postPopUp == false{
//                                offset = 0
//                                }
//                            }))
//
//                        )
//
//                }.ignoresSafeArea(.all, edges: .bottom)
//                //}
//                //Ending
//
//            }
//        }
//        func onChange(){
//        DispatchQueue.main.async {
//        self.offset = gestureOffset + lastOffset
//        }
//        }
//
//        //Blur Radius for BG>..
//        func getBlurRadius()->CGFloat{
//        let progress = -offset / (UIScreen.main.bounds.height - 200)
//        return progress * 30
//        }
        }
           
}

    


struct PrivateView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateView()
    }
}

