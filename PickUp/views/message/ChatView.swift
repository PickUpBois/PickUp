//
//  ChatView.swift
//  PickUp
//
//  Created by David Reynolds on 5/23/21.
//

import SwiftUI

struct ChatView: View {
    
    @State var expand = false
    var body: some View {
        
        Centerview(expand: self.expand).offset(y: -25)
            
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

struct Centerview : View {
    
    @State var expand = false
    
    var body: some View {
        
        List(data){i in
            if i.id == 0{
                cellView(data : i)
                    .onAppear {
                        
                        self.expand = true
                    }
                    .onDisappear {
                        
                        self.expand = false
                    }
            }
            else{
                
                cellView(data : i)
            }
        }
        //.padding(.top, 20)
        .background(Color.white)
    }
}

struct cellView : View {
    
    var data : Msg
    
    var body : some View{
        
        HStack(spacing: 12){
            
            Image(data.img)
                .resizable()
                .renderingMode(.original)
                .frame(width: 45, height: 45)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 12) {
                
                HStack{
                Text(data.name)
                    .lineLimit(1)
                    
                Spacer()
                    
                Text(data.date)
                    .font((.system(size: 13)))
                    .lineLimit(1)
                }
                
                Text(data.msg).font(.caption)
                    .lineLimit(1)
                
            }
                        
        }.padding(.vertical, 10)
        
    }
}


struct shape : Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 30, height: 30))
        return Path(path.cgPath)
    }
}

struct Msg : Identifiable {
    
    var id : Int
    var name : String
    var msg : String
    var date : String
    var img : String
    
}

var data = [
    
    Msg(id: 0, name: "Lebron James", msg: "Celtics ain't beating us tonight!", date: "12/12/2021", img: "a1"),
    Msg(id: 1, name: "Michael Phelps", msg: "My neck hurts from all these gold medals!!", date: "11/04/2021", img: "a2"),
    Msg(id: 2, name: "Bryce Harper", msg: "I hope I get traded to the Yankees!", date: "10/24/2021", img: "a3"),
    Msg(id: 3, name: "Cristiano Ronaldo", msg: "Messi really thinks he's better than me???", date: "09/18/2021", img: "a4"),
    Msg(id: 4, name: "Roger Federer", msg: "Do you think Serena Williams has a crush on me?", date: "08/09/2021", img: "a5"),
    Msg(id: 5, name: "Usain Bolt", msg: "I am the fastest mf in the world!", date: "07/28/2021", img: "a6"),
    Msg(id: 6, name: "Tiger Woods", msg: "18 holes tomorrow morning?", date: "06/24/2021", img: "a7"),
    
    
    
]



