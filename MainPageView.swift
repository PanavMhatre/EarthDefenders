import SwiftUI

struct MainPage: View {
    @Environment(\.presentationMode) var presentationMode

    var countries:some View{
        GeometryReader{geo in
            ZStack{
                NavigationLink(destination: IndiaView()) {
                    Image("India")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.height/6.5)
                    
                }.offset(x: 840, y: 250)
                NavigationLink(destination: BrazilView()) {
                    Image("Brazil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.height/6.5)
                }.offset(x: 300, y: 350)
                NavigationLink(destination: USAView()) {
                    Image("USA")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.height/6.5)
                }.offset(x: 150, y: 250)
            }
        }
    }
}

