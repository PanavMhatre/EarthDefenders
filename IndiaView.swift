import SwiftUI

struct IndiaView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var trash1Position = CGPoint.zero
    @State var trash2Position = CGPoint.zero
    @State var trash3Position = CGPoint.zero
    @State var trash4Position = CGPoint.zero
    @State var trash5Position = CGPoint.zero
    @Environment(\.verticalSizeClass) var sizeClass
    @State var trash1Scale: CGFloat = 1.0
    @State var trash2Scale: CGFloat = 1.0
    @State var trash3Scale: CGFloat = 1.0
    @State var trash4Scale: CGFloat = 1.0
    @State var trash5Scale: CGFloat = 1.0
    @State var trash1Opacity: Double = 1.0
    @State var trash2Opacity: Double = 1.0
    @State var trash3Opacity: Double = 1.0
    @State var trash4Opacity: Double = 1.0
    @State var trash5Opacity: Double = 1.0
    @State var scoreCollectTrash = 0
    @State var isFinishCollectTrash: Bool = false
    @State var isInfoOpen: Bool = false

    
     var instruction: some View{
        GeometryReader{geo in
            ZStack{
                HStack{
                    Image("boy8")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/5)
                    Text("Hey👋 \nThe river is full of trash, and the fish need your your help. Help save their habitat and help save Earth! Clean up the trash by 👆DRAG it into the trash can. Good Luck! ")
                        .foregroundColor(.black)
                        .font(.title)
                        .frame(width: geo.size.width/2)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                }.position(x: geo.size.width/2, y: geo.size.height/1.2)
                
            }
        }
    }
    var endemicInfo: some View{
        ZStack{
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("India")
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
                    Text("Yamuna River")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    Text("About")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .multilineTextAlignment(.leading)
                    Text("The Yamuna river is one of India's most famosu rivers however the increased dumping of trash into the river has made it ugly. The Yamuna River has been in danger for many years impacting many exoctive species such as the Rohu and Sermai. In addition the trash has ridden the area of its natural beauty. Not only does it affect the fishes it also destroys lots of the local marine ecosystem as well. ")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    Text("Conservation Status")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .multilineTextAlignment(.leading)
                    Text("Critically Endangered ")
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
                Image("trashCan")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .padding(.horizontal)
                Text("\(scoreCollectTrash) / 5")
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
                Text("CONGRATULATION🌟")
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
                Text("You have completed the trash cleaning challenge")
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
                        .background(.white)
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

    
    var trash: some View{
        GeometryReader{ geo in
            let trashCanRect = CGRect(x: geo.size.width / 2.3, y: geo.size.height / 2, width: geo.size.width / 6.5, height: geo.size.height / 8)
            ZStack{
                Image("trash1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .scaleEffect(trash1Scale)
                    .opacity(trash1Opacity)
                    .position(trash1Position)
                
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                trash1Position = value.location                          }
                            .onEnded { value in
                                let trashRect = CGRect(x: trash1Position.x, y: trash1Position.y, width: 100, height: 100)
                                if trashRect.intersects(trashCanRect) {
                                    withAnimation {
                                        trash1Scale = 0.0
                                        trash1Opacity = 0.1
                                        scoreCollectTrash += 1
                                        if scoreCollectTrash == 5{
                                            isFinishCollectTrash.toggle()
                                        }
                                    }
                                }else{
                                    withAnimation{
                                        trash1Position = CGPoint(x: geo.size.width / 4, y: geo.size.height / 2.6)
                                    }
                                }
                            }
                    )
                Image("trash2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .scaleEffect(trash2Scale)
                    .opacity(trash2Opacity)
                    .position(trash2Position)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                trash2Position = value.location                          }
                            .onEnded { value in
                                let trashRect = CGRect(x: trash2Position.x, y: trash2Position.y, width: 100, height: 100)
                                if trashRect.intersects(trashCanRect) {
                                    withAnimation {
                                        trash2Scale = 0.0
                                        trash2Opacity = 0.1
                                        scoreCollectTrash += 1
                                        if scoreCollectTrash == 5{
                                            isFinishCollectTrash.toggle()
                                        }
                                    }
                                }else{
                                    withAnimation{
                                        trash2Position = CGPoint(x: geo.size.width / 1.4, y: geo.size.height / 2.8)
                                    }
                                }
                            }
                    )
                
                Image("trash3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .scaleEffect(trash3Scale)
                    .opacity(trash3Opacity)
                    .position(trash3Position)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                trash3Position = value.location                          }
                            .onEnded { value in
                                let trashRect = CGRect(x: trash3Position.x, y: trash3Position.y, width: 100, height: 100)
                                if trashRect.intersects(trashCanRect) {
                                    withAnimation {
                                        trash3Scale = 0.0
                                        trash3Opacity = 0.1
                                        scoreCollectTrash += 1
                                        if scoreCollectTrash == 5{
                                            isFinishCollectTrash.toggle()
                                        }
                                    }
                                }else{
                                    withAnimation{
                                        trash3Position = CGPoint(x: (geo.size.width / 1.2 ) + 50 , y: geo.size.height / 2.2)
                                    }
                                }
                            }
                    )
                Image("trash4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .scaleEffect(trash4Scale)
                    .opacity(trash4Opacity)
                    .position(trash4Position)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                trash4Position = value.location                          }
                            .onEnded { value in
                                let trashRect = CGRect(x: trash4Position.x, y: trash4Position.y, width: 100, height: 100)
                                if trashRect.intersects(trashCanRect) {
                                    withAnimation {
                                        trash4Scale = 0.0
                                        trash4Opacity = 0.1
                                        scoreCollectTrash += 1
                                        if scoreCollectTrash == 5{
                                            isFinishCollectTrash.toggle()
                                        }
                                    }
                                }else{
                                    withAnimation{
                                        trash4Position = CGPoint(x: geo.size.width / 2.8, y: geo.size.height / 2.7)
                                    }
                                }
                            }
                    )
                
                Image("trash5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .scaleEffect(trash5Scale)
                    .opacity(trash5Opacity)
                    .position(trash5Position)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                trash5Position = value.location
                            }
                            .onEnded { value in
                                let trashRect = CGRect(x: trash5Position.x, y: trash5Position.y, width: 100, height: 100)
                                if trashRect.intersects(trashCanRect) {
                                    withAnimation {
                                        trash5Scale = 0.0
                                        trash5Opacity = 0.1
                                        scoreCollectTrash += 1
                                        if scoreCollectTrash == 5{
                                            isFinishCollectTrash.toggle()
                                        }
                                        
                                    }
                                }else{
                                    withAnimation{
                                        trash5Position = CGPoint(x: geo.size.width / 7, y: geo.size.height / 3.6)
                                    }
                                }
                            }
                    )
            }
            .onAppear {
                trash1Position = CGPoint(x: geo.size.width / 4, y: geo.size.height / 2.6)
                trash2Position = CGPoint(x: geo.size.width / 1.4, y: geo.size.height / 2.8)
                trash3Position = CGPoint(x: geo.size.width / 1.8, y: geo.size.height / 2.2)
                trash4Position = CGPoint(x: geo.size.width / 2.4, y: geo.size.height / 2.7)
                trash5Position = CGPoint(x: geo.size.width / 7, y: geo.size.height / 3.6)
            }
            .onChange(of: geo.size) { _ in
                trash1Position = CGPoint(x: geo.size.width / 4, y: geo.size.height / 2.6)
                trash2Position = CGPoint(x: geo.size.width / 1.4, y: geo.size.height / 2.8)
                trash3Position = CGPoint(x: geo.size.width / 1.2, y: geo.size.height / 2.2)
                trash4Position = CGPoint(x: geo.size.width / 2.8, y: geo.size.height / 2.7)
                trash5Position = CGPoint(x: geo.size.width / 7, y: geo.size.height / 3.6)
            }
        }
    }
}

struct OneLevelView_Previews: PreviewProvider {
    static var previews: some View {
        IndiaView()
    }
}
