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
        HStack{
            Text("When")
                .fontWeight(.heavy)
            Spacer().frame(width: 15)
        DatePicker("",
            selection: self.$date,
                 in: dateRange,
                 displayedComponents: [.date, .hourAndMinute]
        ).datePickerStyle(DefaultDatePickerStyle())
        }.padding(.trailing, 60.0).frame(width:390, alignment: .leading)
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
