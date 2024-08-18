import SwiftUI

struct ContentView: View {
    @State private var isAnimatingButtonPlay = false
    @State private var planeOffset: CGFloat = -350
    @State private var cloud1Offset: CGFloat = -350
    @State private var cloud3Offset: CGFloat = -250
    @State private var cloud2Offset: CGFloat = UIScreen.main.bounds.width + 150
    @State private var cloud4Offset: CGFloat = UIScreen.main.bounds.width + 150

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
