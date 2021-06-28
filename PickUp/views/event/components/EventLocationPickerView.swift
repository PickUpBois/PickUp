//
//  EventLocationPicker.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/13/21.
//

import SwiftUI

struct EventLocationPickerView: View {
    @State var title: String = "Where"
    @State var description: String = "Arian's Driveway"
    @Binding var value: String
    var body: some View {
        Group {
            Spacer().frame(height: 15.0)
            
            ZStack(alignment: .leading){
            
            HStack{
                Text(title)
                    .fontWeight(.heavy)
                    .frame(width: 60)
                    
                Spacer().frame(width: 8.0)
            }
            .padding(.leading, 6.0)
            .padding(.vertical, 15.0)
            .background(Color.gray)
            .cornerRadius(20)
            
            HStack{
                TextField(description, text: self.$value)
                        .foregroundColor(Color("Text"))
                        .lineLimit(0)
                        .padding(.trailing)
                    .frame(width: 260.0, alignment: .leading)
                    
                Spacer(minLength: 10)
                
                Image(systemName: "x.circle.fill")
                    .frame(width: 25.0)
                }
                .padding(.leading, 80)
            .padding(.vertical, 14.0)
            .background(Color("TextFieldEvent"))
    
            }.frame(width: 380)
            .cornerRadius(20)
        }
    }
}

extension EventLocationPickerView {
    class ViewModel: ObservableObject {
        @Published var locationId: String = ""
        @Published var locationName: String = ""
    }
}

struct EventLocationPickerView_Previews: PreviewProvider {
    static var previews: some View {
        EventLocationPickerView(value: .constant(""))
    }
}
