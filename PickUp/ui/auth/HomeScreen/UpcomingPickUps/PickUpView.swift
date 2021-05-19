//
//  PickUpView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct PickUpView: View {
    @State var showPopUp = false
    var body: some View {
       
        HStack(alignment: .center) {
            Button(action: {
                self.showPopUp.toggle()
            }, label: {

                VStack {
                    HStack{
                        Text("Singles")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                        Image(systemName:"calendar")
                            .foregroundColor(Color.red)
                        Text("Date")
                            .foregroundColor(Color.black)
                                Spacer()
                                .frame(minWidth: 10, maxWidth: 10)
                                .lineLimit(1)
                    }
                        Spacer().frame(height: 2)
                        HStack(alignment: .center){
                            Image(systemName:"location.fill")
                                .foregroundColor(Color.blue)
                                .lineLimit(1)
                            Text("Location")
                                .foregroundColor(Color.blue)
                            Text("Going")
                                .foregroundColor(Color.green)
                                .lineLimit(1)
                    }

                }
                
                
            })
        }.sheet(isPresented: $showPopUp, content: {
           
            PopupView()
            
            Button(action: {
                self.showPopUp.toggle()
            },label: {
                Text("Dismiss")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(9)
                    .padding(.horizontal, 20)
            })
            
            Spacer().frame(height: 300)
            .background(BackgroundClearView())
            
        })
        
        
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

struct PickUpView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpView()
    }
}
