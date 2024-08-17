import SwiftUI

struct ContentView: View {
    @State private var isAnimatingButtonPlay = false
    @State private var planeOffset: CGFloat = -350
    @State private var cloud1Offset: CGFloat = -350
    @State private var cloud3Offset: CGFloat = -250
    @State private var cloud2Offset: CGFloat = UIScreen.main.bounds.width + 150
    @State private var cloud4Offset: CGFloat = UIScreen.main.bounds.width + 150
    
    
    
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
