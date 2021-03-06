//
//  FinishPickupNotificationView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/21/21.
//

import SwiftUI

struct FinishPickupNotificationView: View {
    @State var showPopUp = false
    @State private var showingAlert = false
    var viewModel: NotificationViewModel
    @State var team1Members: [String] = []
    @State var team2Members: [String] = []
    @State var team1Scores: [Int] = []
    @State var team2Scores: [Int] = []
    @State var team1Win: Bool = false
    @State var team2Win: Bool = false
    
    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack{
                HStack {
                    
                    Image("logo")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 25, height: 25, alignment: .center)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                        .overlay(Circle().stroke(Color("ColorThicknessPhoto")))
                    
                    Text("PickUp")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Text"))
                        .lineLimit(1)
                    Spacer()
                    Text(getDate(date: viewModel.event!.startDate.dateFromIso!))
                    .lineLimit(1)
                        
                    }
                .padding(.horizontal, 15.0)
                        Spacer().frame(height: 10)
                        HStack{
                            Button(action: {
                                self.showPopUp.toggle()
                            },label: {
                                Text("Press here to enter score for your event '\(viewModel.event!.name)'")
                                    .foregroundColor(Color.purple)
                                    .padding(.leading, 20.0)
                                    .frame(width: 400, alignment: .leading)
                                    .lineLimit(3)
                            })
                            
                        }.padding(.leading, 10.0)
                        .sheet(isPresented: $showPopUp, content: {
                            InputScoreView(showPopUp: $showPopUp, viewModel: viewModel)
                            
                            Button(action: {
                                self.showPopUp.toggle()
                            },label: {
                                Text("Dismiss")
                                    .foregroundColor(Color("Text"))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .background(Color("Text_Background").opacity(0.8))
                                    .cornerRadius(9)
                                    .padding(.horizontal, 20)
                            })
                            //Spacer().frame(height: 300)
                            //.background(BackgroundClearView())
                        })
                }
                    .padding(.all, 10)
                    .frame(width: 400.0)
                    .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                    .cornerRadius(8)
        
    }
}

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct FinishPickupNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        FinishPickupNotificationView(viewModel: MockNotificationViewModel())
    }
}
