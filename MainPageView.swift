import SwiftUI

struct MainPage: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack{
            Image("secondBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                ZStack {
                    
                    
                    Image("continent")
                        .resizable()
                        .frame(width: 1200, height: 500)
                    
                    countries
                    
                    buttonAction
                }
                HStack{
                    Text("Hey👋 \nThere are three different countries that need your help to help save their habitats! Good luck!")
                        .foregroundColor(.black)
                        .font(.title)
                        .frame(width: 500)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                    Image("boy8")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }.padding(.bottom, 50)
            }.onAppear{
                SoundPlayer.shared.stopSound()
                SoundPlayer.shared.playSound(soundName: "science-documentary-169621", fileType: "mp3")
            }
        }
        
    }

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

