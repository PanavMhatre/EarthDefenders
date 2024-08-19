import SwiftUI

struct BrazilView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var isTreeDropInArea: Bool = false
    
    @State var tree1Position = CGPoint.zero
    @State var tree2Position = CGPoint.zero
    @State var tree3Position = CGPoint.zero
    @State var tree4Position = CGPoint.zero
    @State var isTree1Dropped: Bool = false
    @State var isTree2Dropped: Bool = false
    @State var isTree3Dropped: Bool = false
    @State var isTree4Dropped: Bool = false
    @State var scorePlantsTree = 0
    @State var isFinishPlantsTree: Bool = false
    @State var isInfoOpen: Bool = false

    var lionArea: some View{
        GeometryReader{ geo in
            Image("lion")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .position(x: geo.size.width / 1.5, y: geo.size.height / 10)
            Image("lion")
                .resizable()
                .scaledToFit()
                .frame(width: 400)
                .position(x: geo.size.width / 7, y: geo.size.height / 2)
        }
    }
    var landArea: some View {
        GeometryReader{ geo in
            let landAreaRect = CGRect(x: geo.size.width / 6, y: geo.size.height / 8, width: geo.size.width / 1.52, height: geo.size.height / 8)
            Rectangle()
                .stroke(Color.black.opacity(0.2), style: StrokeStyle(lineWidth: 10, lineCap: .round, dash: [25]))
                .frame(width: landAreaRect.width, height: landAreaRect.height)
                .overlay(
                    Text("Drop Tree Here")
                        .foregroundColor(Color.black.opacity(0.5))
                        .font(.largeTitle)
                        .bold()
                        .opacity(isTreeDropInArea ? 0 : 1)
                    
                )
                .position(x: landAreaRect.midX, y: landAreaRect.midY)
        }
    }


    var finishAction: some View{
        ZStack{
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("CONGRATULATION🌟🌟")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(20)
                Image("boy6")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                Text("You have completed the challenge of planting trees")
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
            .shadow(radius: 50)
            .transition(AnyTransition.scale.animation(.easeInOut))
        }
        
    }

  
    var treeGroup: some View{
        GeometryReader{ geo in
            let landAreaRect = CGRect(x: geo.size.width / 6, y: geo.size.height / 8, width: geo.size.width / 1.52, height: geo.size.height / 8)
            
            ZStack{
                Rectangle()
                    .fill(Color.green)
                    .frame(width:  geo.size.width / 1.5, height:  geo.size.width / 5)
                    .cornerRadius(20)
                    .overlay(
                        Rectangle()
                            .fill(Color.white)
                            .frame(width:  geo.size.width / 1.6, height:  geo.size.width / 5.7)
                            .cornerRadius(20)
                    )
                    .position(CGPoint(x: geo.size.width / 2, y: geo.size.height / 1.4))
                    .shadow(radius: 10)
                
                Image(isTree1Dropped ? "tree1" : "plants")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width / 12)
                    .position(tree1Position)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if !isTree1Dropped{
                                    tree1Position = value.location
                                }
                            }
                            .onEnded { value in
                                let treeRect = CGRect(x: tree1Position.x, y: tree1Position.y + 80, width: 10, height: 10)
                                if treeRect.intersects(landAreaRect) {
                                    withAnimation {
                                        tree1Position = CGPoint(x: geo.size.width / 2.2, y: geo.size.height / 7.5)
                                        isTreeDropInArea = true
                                        isTree1Dropped = true
                                        scorePlantsTree += 1
                                        if scorePlantsTree == 4{
                                            isFinishPlantsTree = true
                                        }
                                        
                                    }
                                }else{
                                    withAnimation{
                                        tree1Position = CGPoint(x: geo.size.width / 2.2, y: geo.size.height / 1.4)
                                    }
                                }
                            }
                    )
                Image(isTree2Dropped ? "tree1" : "plants")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width / 12)
                    .position(tree2Position)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if !isTree2Dropped{
                                    tree2Position = value.location
                                }
                            }
                            .onEnded { value in
                                let treeRect = CGRect(x: tree2Position.x, y: tree2Position.y + 80, width: 10, height: 10)
                                if treeRect.intersects(landAreaRect) {
                                    withAnimation {
                                        tree2Position = CGPoint(x: geo.size.width / 2.9, y: geo.size.height / 7.5)
                                        isTreeDropInArea = true
                                        isTree2Dropped = true
                                        scorePlantsTree += 1
                                        if scorePlantsTree == 4{
                                            isFinishPlantsTree = true
                                        }
                                    }
                                }else{
                                    withAnimation{
                                        tree2Position = CGPoint(x: geo.size.width / 2.9, y: geo.size.height / 1.4)
                                    }
                                }
                            }
                    )
                Image(isTree3Dropped ? "tree1" : "plants")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width / 12)
                    .position(tree3Position)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if !isTree3Dropped{
                                    tree3Position = value.location
                                }
                            }
                            .onEnded { value in
                                let treeRect = CGRect(x: tree3Position.x, y: tree3Position.y + 80, width: 10, height: 10)
                                if treeRect.intersects(landAreaRect) {
                                    withAnimation {
                                        tree3Position = CGPoint(x: geo.size.width / 1.8, y: geo.size.height / 7.5)
                                        isTreeDropInArea = true
                                        isTree3Dropped = true
                                        scorePlantsTree += 1
                                        if scorePlantsTree == 4{
                                            isFinishPlantsTree = true
                                        }
                                    }
                                }else{
                                    withAnimation{
                                        tree3Position = CGPoint(x: geo.size.width / 1.8, y: geo.size.height / 1.4)
                                    }
                                }
                            }
                    )
                Image(isTree4Dropped ? "tree1" : "plants")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width / 12)
                    .position(tree4Position)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if !isTree4Dropped{
                                    tree4Position = value.location
                                }
                            }
                            .onEnded { value in
                                let treeRect = CGRect(x: tree4Position.x, y: tree4Position.y + 80, width: 10, height: 10)
                                if treeRect.intersects(landAreaRect) {
                                    withAnimation {
                                        tree4Position = CGPoint(x: geo.size.width / 1.5, y: geo.size.height / 7.5)
                                        isTreeDropInArea = true
                                        isTree4Dropped = true
                                        scorePlantsTree += 1
                                        if scorePlantsTree == 4{
                                            isFinishPlantsTree = true
                                        }
                                    }
                                }else{
                                    withAnimation{
                                        tree4Position = CGPoint(x: geo.size.width / 1.5, y: geo.size.height / 1.4)
                                    }
                                }
                            }
                    )
            }
            .onAppear {
                tree1Position = CGPoint(x: geo.size.width / 2.2, y: geo.size.height / 1.4)
                tree2Position = CGPoint(x: geo.size.width / 2.9, y: geo.size.height / 1.4)
                tree3Position = CGPoint(x: geo.size.width / 1.8, y: geo.size.height / 1.4)
                tree4Position = CGPoint(x: geo.size.width / 1.5, y: geo.size.height / 1.4)
            }
            .onChange(of: geo.size) { _ in
                if !isTree1Dropped{
                    tree1Position = CGPoint(x: geo.size.width / 2.2, y: geo.size.height / 1.4)
                }else{
                    tree1Position = CGPoint(x: geo.size.width / 2.2, y: geo.size.height / 7.5)
                }
                if !isTree2Dropped{
                    tree2Position = CGPoint(x: geo.size.width / 2.9, y: geo.size.height / 1.4)
                }else{
                    tree2Position = CGPoint(x: geo.size.width / 2.9, y: geo.size.height / 7.5)
                }
                if !isTree3Dropped{
                    tree3Position = CGPoint(x: geo.size.width / 1.8, y: geo.size.height / 1.4)
                } else{
                    tree3Position = CGPoint(x: geo.size.width / 1.8, y: geo.size.height / 7.5)
                }
                if !isTree4Dropped{
                    tree4Position = CGPoint(x: geo.size.width / 1.5, y: geo.size.height / 1.4)
                }else{
                    tree4Position = CGPoint(x: geo.size.width / 1.5, y: geo.size.height / 7.5)
                }
            }
        }
    }
}

struct TwoLevelView_Previews: PreviewProvider {
    static var previews: some View {
        BrazilView()
    }
}
