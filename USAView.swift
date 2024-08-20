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
    
    var endemicInfo: some View{
        ZStack{
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("USA")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                
                Text("Habitat INFO")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.orange.opacity(0.8))
                    .cornerRadius(20)
                VStack(alignment:.leading){
                    Text("Name")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .multilineTextAlignment(.leading)
                    Text("Amazon Rainforest")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    Text("About")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .multilineTextAlignment(.leading)
                    Text("In recent years there has been a increased amount of wildfires in the Shasta-Trinity National Forest. This is due the green houses glass causing climate change and global warming increasing the temperature of the Earth. These wildfires have led to lots of habitat being lost and animals having to move.")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    Text("Conservation Status")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .multilineTextAlignment(.leading)
                    Text("Critically Endangered")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .background(.red)
                }
                Button(action: {
                    isInfoOpen = false
                },label: {
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 10)
                        .overlay(
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(Color.red)
                        )
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
        var scoreArea: some View{
            GeometryReader{ geo in
                HStack{
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .padding(.horizontal)
                    Text("\(scoreExtinguishFire) / 5")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }.padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding(.horizontal,20)
            }
        }

    
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


