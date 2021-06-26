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
            Text("When")
                .fontWeight(.heavy)
                .frame(width: 60)
            Spacer().frame(width: 8.0)
            
        }.padding(.leading, 6.0)
        .padding(.vertical, 15.0)
        .background(Color("DescriptionEvent"))
        .cornerRadius(20)
         
            HStack{
                DatePicker("",
                selection: self.$date,
                 in: dateRange,
                 displayedComponents: [.date, .hourAndMinute]
                ).datePickerStyle(DefaultDatePickerStyle())
                .accentColor(Color("Text"))
                
            }
            .padding(.trailing, 60)
            .padding(.vertical, 8.0)
            .background(Color("TextFieldEvent"))
            
        }
        .frame(width:380)
        .cornerRadius(20)
        
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
