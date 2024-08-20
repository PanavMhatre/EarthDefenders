import SwiftUI
struct USAView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.verticalSizeClass) var sizeClass
    @State var waterPosition = CGPoint.zero
    @State var scoreExtinguishFire = 0
    @State var isFinishExtinguishFire: Bool = false
    @State var isInfoOpen: Bool = false
    
    // Individual variables for each fire position
    @State var firePosition1 = CGPoint.zero
    @State var firePosition2 = CGPoint.zero
    @State var firePosition3 = CGPoint.zero
    @State var firePosition4 = CGPoint.zero
    @State var firePosition5 = CGPoint.zero
    
        
        var finishAction: some View{
            ZStack{
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("CONGRATULATIONS🌟")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(20)
                    Image("boy5")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    Text("You have successfully extinguished all the fires!")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    },label: {
                        
                        Text("NEXT")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .foregroundColor(.brown)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                    })
                }
                .padding(50)
                .background(
                    Color.brown
                )
                .cornerRadius(25)
                .padding(16)
                .transition(AnyTransition.scale.animation(.easeInOut))
            }
        
        
    }
    
    struct ThreeLevelView_Previews: PreviewProvider {
        static var previews: some View {
            USAView()
        }
    }
}


