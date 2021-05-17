//
//  PickUpView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct PickUpView: View {
    var body: some View {
        VStack {
            HStack{
                Text("Singles")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                Image(systemName:"calendar")
                    .foregroundColor(Color.red)
                Text("Date")
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
                    Text("Going")
                        .foregroundColor(Color.green)
                        .lineLimit(1)
            }

        }
    }
}

struct PickUpView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpView()
    }
}
