import SwiftUI

struct ContentView: View {
    @State private var isAnimatingButtonPlay = false
    @State private var planeOffset: CGFloat = -350
    @State private var cloud1Offset: CGFloat = -350
    @State private var cloud3Offset: CGFloat = -250
    @State private var cloud2Offset: CGFloat = UIScreen.main.bounds.width + 150
    @State private var cloud4Offset: CGFloat = UIScreen.main.bounds.width + 150

    var body: some View {
        ZStack {
            NavigationView(){
                ZStack{
                    
                    Image("Map-1")
                    //Title View
                    
                    
                    
                        Image("pinMapsBlue").resizable().frame(width: 100, height: 150).offset(x: 400, y: -200)
                    Image("pinMapsGreen").resizable().frame(width: 100, height: 150).offset(x: -450, y: -150)
                    Image("pinMapsRed").resizable().frame(width: 100, height: 150).offset(y: -320)
                    Image("Plane-1")
                        .resizable()
                        .frame(width: 450, height: 400) // Adjust size as needed
                        .rotationEffect(.degrees(-5))
                        .offset(x: planeOffset, y: 300)
                        .onAppear {
                            withAnimation(Animation.linear(duration: 15).repeatForever(autoreverses: false)) {
                                self.planeOffset = UIScreen.main.bounds.width + 150
                            }
                        }
                        
                    VStack{
                        Image("title").resizable().frame(width: 600,height: 300)
                        // Button View
                        buttonView
                    }
                    
                    cloudsView
                }
            }.navigationViewStyle(StackNavigationViewStyle())

            
        }.onAppear {
            SoundPlayer.shared.playSound(soundName: "cinematic-documentary-115669", fileType: "mp3")
        }
    }


    var cloudsView: some View{
        ZStack{
            Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .position(x: 0,y: 150)
                .offset(x: cloud1Offset)
                .onAppear {
                    withAnimation(Animation.linear(duration: 15).repeatForever(autoreverses: false)) {
                        self.cloud1Offset = UIScreen.main.bounds.width + 150
                    }
                }
            Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .position(x: 0,y: 400)
                .offset(x: cloud2Offset)
                .onAppear {
                    withAnimation(Animation.linear(duration: 20).repeatForever(autoreverses: false)) {
                        self.cloud2Offset = -100
                    }
                }
            Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .position(x: 0,y: 900)
                .offset(x: cloud4Offset)
                .onAppear {
                    withAnimation(Animation.linear(duration: 17).repeatForever(autoreverses: false)) {
                        self.cloud4Offset = -100
                    }
                }
            Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .position(x: 0,y: 700)
                .offset(x: cloud3Offset)
                .onAppear {
                    withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)) {
                        self.cloud3Offset = UIScreen.main.bounds.width + 150
                    }
                }
        }
    }
    
    
    
    var buttonView: some View {
        ZStack {
            NavigationLink(destination: HomeView()) {
                ZStack{
                    Image("backgroundButton")
                        .resizable()
                        .frame(width: 300, height: 100)
                    Text("Start".uppercased())
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                }
            }
            
        }
        .scaleEffect(isAnimatingButtonPlay ? 1.2 : 1.0)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
                self.isAnimatingButtonPlay.toggle()
            }
        }
    }
}
