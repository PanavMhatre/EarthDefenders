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
    var body: some View {
        GeometryReader { geo in
            let waterPos = CGRect(x: geo.size.width / 2.6, y: geo.size.height / 2, width: geo.size.width / 6.5, height: geo.size.height / 8)
            let waterRect = CGRect(x: waterPosition.x, y: waterPosition.y, width: 50, height: 50)
            ZStack{
                Image("backgroundLevel1")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    // Water image with gesture
                    Image("waterBucket")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .position(x: waterPos.midX + 40, y: waterPos.midY - 50)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    waterPosition = value.location
                                }
                                .onEnded { value in
                                    // Check if water intersects with any fire
                                    if waterRect.intersects(CGRect(origin: firePosition1, size: CGSize(width: 50, height: 50))) {
                                        extinguishFire(position: 1)
                                    } else if waterRect.intersects(CGRect(origin: firePosition2, size: CGSize(width: 50, height: 50))) {
                                        extinguishFire(position: 2)
                                    } else if waterRect.intersects(CGRect(origin: firePosition3, size: CGSize(width: 50, height: 50))) {
                                        extinguishFire(position: 3)
                                    } else if waterRect.intersects(CGRect(origin: firePosition4, size: CGSize(width: 50, height: 50))) {
                                        extinguishFire(position: 4)
                                    } else if waterRect.intersects(CGRect(origin: firePosition5, size: CGSize(width: 50, height: 50))) {
                                        extinguishFire(position: 5)
                                    }
                                    waterPosition = CGPoint.zero // Reset water position
                                }
                            
                        )
                }
                
                // Fire images using individual positions
                Image("fire")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .position(firePosition1)
                
                Image("fire")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .position(firePosition2)
                
                Image("fire")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .position(firePosition3)
                
                Image("fire")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .position(firePosition4)
                
                Image("fire")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .position(firePosition5)
                
                
                
                // Other views
                scoreArea
                instruction
                buttonInfo
                if isInfoOpen {
                    endemicInfo
                }
                if isFinishExtinguishFire {
                    finishAction
                }
            }
            .onAppear {
                // Set initial fire positions
                firePosition1 = CGPoint(x: geo.size.width / 4, y: geo.size.height / 3.2)
                firePosition2 = CGPoint(x: geo.size.width / 1.4, y: geo.size.height / 2.8)
                firePosition3 = CGPoint(x: geo.size.width / 1.2, y: geo.size.height / 2.2)
                firePosition4 = CGPoint(x: geo.size.width / 2.8, y: geo.size.height / 2.7)
                firePosition5 = CGPoint(x: geo.size.width / 7, y: geo.size.height / 3.6)
            }
            .onChange(of: geo.size) { _ in
                // Update fire positions on size change
                firePosition1 = CGPoint(x: geo.size.width / 4, y: geo.size.height / 2.6)
                firePosition2 = CGPoint(x: geo.size.width / 1.4, y: geo.size.height / 2.8)
                firePosition3 = CGPoint(x: geo.size.width / 1.2, y: geo.size.height / 2.2)
                firePosition4 = CGPoint(x: geo.size.width / 2.8, y: geo.size.height / 2.7)
                firePosition5 = CGPoint(x: geo.size.width / 7, y: geo.size.height / 3.6)
            }
        }
    }
    
    // Function to extinguish fire at given position
    func extinguishFire(position: Int) {
        withAnimation {
            switch position {
            case 1:
                firePosition1 = CGPoint(x: -100, y: -100)
            case 2:
                firePosition2 = CGPoint(x: -100, y: -100)
            case 3:
                firePosition3 = CGPoint(x: -100, y: -100)
            case 4:
                firePosition4 = CGPoint(x: -100, y: -100)
            case 5:
                firePosition5 = CGPoint(x: -100, y: -100)
            default:
                break
            }
            scoreExtinguishFire += 1
            if scoreExtinguishFire == 5 {
                isFinishExtinguishFire.toggle()
            }
        }
    }

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


