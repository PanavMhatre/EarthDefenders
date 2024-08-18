import SwiftUI

struct MainPage: View {
    @Environment(\.presentationMode) var presentationMode

    var buttonAction: some View{
        GeometryReader{geo in
            HStack{
                NavigationLink(destination: HomeView()){
                    Circle()
                        .fill(Color.white)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 10)
                        .overlay(
                            Image(systemName: "info.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(Color.blue)
                        ).padding(.bottom, 50)
                }
                
                NavigationLink(destination: ContentView()) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.brown)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 10)
                        .overlay(
                            Image(systemName: "house.fill")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        )
                }
                .padding(.bottom, 50)

                
            }.position(x: geo.size.width/2,y: geo.size.height/1.03)
        }
    }


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

