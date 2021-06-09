//
//  InputScoreView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/24/21.
//

import SwiftUI

struct InputScoreView: View {
    @State var showPopUp = false
    @State private var checked = true
    
    var body: some View {
        Spacer().frame(height: 200)
            HStack{
            VStack (alignment: .leading){
                HStack{
                    Image(systemName: "sportscourt.fill")
                        .foregroundColor(Color.green)
                Text("Singles") //self.viewModel.event.name
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                }
                Spacer()
                HStack(alignment: .top) {
                Image(systemName:"pencil.circle.fill")
                Text("Description.................................................................................................................................................................................................................")
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .lineLimit(3)
                    .frame(alignment: .leading)
                    //self.viewModel.event.info
                }
Spacer()
//join event 'button'
            }.frame(alignment: .leading)
            
        Spacer()
            VStack(alignment: .leading){
                HStack{
                    Image(systemName:"location.fill")
                        .foregroundColor(Color.blue)
                    Text("Location")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)}
            Spacer().frame(height: 5)
                HStack{
                    Image(systemName:"calendar")
                        .foregroundColor(Color.red)
                    Text("Date")                        .fontWeight(.bold)
                        .foregroundColor(Color.black)}
            Spacer().frame(height: 5)
                HStack{
                    Image(systemName:"clock.fill")
                        .foregroundColor(Color.black)
                    Text("Time")                        .fontWeight(.bold)
                        .foregroundColor(Color.black)}
            Spacer().frame(height: 5)
                HStack{
                    Image(systemName:"person.3.fill")
                        .foregroundColor(Color.purple)
                    Text("People")                        .fontWeight(.bold)
                        .foregroundColor(Color.black)}
            Spacer().frame(height: 5)

                
              }
                  }
            .frame(width: 300)
            .padding(.all, 30.0)
            .background(Color.white.opacity(0.9))
        .cornerRadius(8)
        .padding(.horizontal, 20)
        
        VStack{
            HStack{
                Text("Team 1")
                Spacer().frame(width: 15)
                Text("Team 2")
            }.frame(width: 300, alignment: .trailing)
            Spacer().frame(height: 10)
            
            HStack{
                Text("Dave Reynolds").frame(width: 180,alignment:.leading).lineLimit(1)
                Spacer().frame(width: 5)
                CheckBoxView(checked: $checked)
                Spacer().frame(width: 45)
                CheckBoxView(checked: $checked)
            }
            Spacer().frame(height: 10)
            
            HStack{
            Text("Manikrishnakumar Bhuma")
                .frame(width: 180, alignment:.leading).lineLimit(1)
                Spacer().frame(width: 5)
                CheckBoxView(checked: $checked)
                Spacer().frame(width: 45)
                CheckBoxView(checked: $checked)
            }
            Spacer().frame(height: 10)
            
            HStack{
            Text("Arian Rahbar")
                    .frame(width: 180, alignment:.leading).lineLimit(1)
                Spacer().frame(width: 5)
                CheckBoxView(checked: $checked)
                Spacer().frame(width: 45)
                CheckBoxView(checked: $checked)
            }
            Spacer().frame(height: 10)
            
            HStack{
            Text("Ashwin Yedavalli")
                    .frame(width: 180, alignment:.leading).lineLimit(1)
                Spacer().frame(width: 5)
                CheckBoxView(checked: $checked)
                Spacer().frame(width: 45)
                CheckBoxView(checked: $checked)
            }
            }
        .frame(width: 300)
        .padding(.all, 30.0)
        .background(Color.white.opacity(0.9))
        .cornerRadius(8)
        
        VStack{
            HStack{
                Text("Input Score:").fontWeight(.bold)
            }
            .padding(.all, 5.0)
            .font(.body)
            .foregroundColor(Color.black)
            .cornerRadius(8)
            .frame(alignment: .topLeading)
            Spacer().frame(height: 10)
            
        HStack{
            Text("Set 1")
                .frame(width: 180, alignment:.leading).lineLimit(1)
            Spacer().frame(width: 5)
            Text(" 6")
            Spacer().frame(width: 45)
            Text(" 1")
        }
        
        Button(action: {},
               label: {
                Text("Add Set")
                    .foregroundColor(Color.blue).opacity(0.8)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                    .cornerRadius(9)
               })
        }
        .frame(width: 300)
        .padding(.all, 30.0)
        .background(Color.white.opacity(0.9))
        .cornerRadius(8)
        
    }
}


struct InputScoreView_Previews: PreviewProvider {
    static var previews: some View {
        InputScoreView()
    }
}

struct CheckBoxView: View {
    @Binding var checked: Bool
    
    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false
        
        var body: some View {
            CheckBoxView(checked: $checked)
        }
    }
    
    static var previews: some View {
        CheckBoxViewHolder()
    }
}
