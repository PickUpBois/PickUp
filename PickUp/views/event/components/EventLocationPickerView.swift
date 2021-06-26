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
            Spacer().frame(height: 25.0)
            VStack(alignment: .leading){
                
                HStack(){
                
                    Text(title).fontWeight(.heavy).frame(width: 60)
                    
                    HStack{
                        Spacer()
                            .frame(width: 8.0)
                        TextField(description, text: self.$value)
                            .foregroundColor(Color("Text"))
                            .lineLimit(0)
                            .padding(.trailing)
                            .frame(width: 200.0, alignment: .leading)
                        
                    Spacer(minLength: 60)
                        
                    Image(systemName: "x.circle.fill")
                        .frame(width: 25.0)
                        
                }.frame(width: 320).padding(.horizontal, 6.0)
                .padding(.vertical, 15.0)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(20)
                    
                        }
            //Email Text Field Settings
            }
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
