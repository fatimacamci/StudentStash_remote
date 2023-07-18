//
//  View_Home.swift
//  Student__Stash (iOS)
//
//  Created by Samreen on 7/12/23.
//

import SwiftUI

struct View_Home: View {
    @State var showMenu = false
    
    var body: some View {
        
        let drag = DragGesture()
        .onEnded{
            if $0.translation.width < -100 {
                withAnimation {
                    self.showMenu = false
                }
            }
        }
        return NavigationView{
        GeometryReader { geometry in
            ZStack(alignment: .leading){
                MainView(showMenu:self.$showMenu)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .offset(x:self.showMenu ? geometry.size.width/2 : 0)
                .disabled(self.showMenu ? true : false)
                if self.showMenu{
                    MenuView()
                        .frame(width: geometry.size.width/2)
                        .transition(.move(edge: .leading))
                }
}
            .gesture(drag)
}
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(leading:(Button(action: {
            withAnimation{
                self.showMenu.toggle()
            }
        }) {
            Image(systemName: "list.bullet")
                .imageScale(.large)
                .foregroundColor(.blue)
        }
                                    ))
}
}
}


struct MainView: View{
    @Binding var showMenu: Bool
    
    var body: some View{
        Button(action: {
            withAnimation{
            self.showMenu = true
            }
        }) {
            Text("")
        }
    }
}

 

struct View_Home_Previews: PreviewProvider {
    static var previews: some View {
        View_Home()
    }
}
