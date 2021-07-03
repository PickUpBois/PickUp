//
//  EventDatePickerView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/13/21.
//

import SwiftUI

struct EventDatePickerView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    @Binding var date: Date
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    var body: some View {
        
        ZStack(alignment: .leading){
         
            HStack{
                DatePicker("",
                selection: self.$date,
                 in: dateRange,
                 displayedComponents: [.date, .hourAndMinute]
                ).datePickerStyle(DefaultDatePickerStyle())
                .accentColor(Color("Text"))
                
            }
            .padding(.trailing, 80)
            .padding(.vertical, 8.0)
            .background(Color("TextFieldEvent"))
            .cornerRadius(20)
            
            
            HStack{
                Text("When")
                    .foregroundColor(Color("Text"))
                    .fontWeight(.heavy)
                    .frame(width: 60)
                
            }.padding(.horizontal, 6.0)
            .padding(.vertical, 15.0)
            .background(Color("DescriptionEvent"))
            .cornerRadius(20)
            
        }
        .frame(width:380)
        
        
    }
}

extension EventDatePickerView {
    class ViewModel: ObservableObject {
        let dateRange: ClosedRange<Date> = {
            let calendar = Calendar.current
            let startComponents = DateComponents(year: 2021, month: 1, day: 1)
            let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
            return calendar.date(from:startComponents)!
                ...
                calendar.date(from:endComponents)!
        }()
    }
}

struct EventDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        EventDatePickerView(date: .constant(Date()))
    }
}
