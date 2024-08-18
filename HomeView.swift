import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var isIntroductionOverlay: Bool = true
    @State var isBackgroundStory1: Bool = true
    @State var isBackgroundStory2: Bool = false
    @State var isBackgroundStory3: Bool = false
    @State var isLevel2Open: Bool = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.white]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
          
            if isIntroductionOverlay{
                introductionOverlay
                if isBackgroundStory1{
                    backgroundStory1
                } else if isBackgroundStory2{
                    backgroundStory2
                } else if isBackgroundStory3{
                    backgroundStory3
                }
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
    
    var introductionOverlay: some View{
        // LAYER DEEP
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.ultraThinMaterial)
            .foregroundColor(Color.black.opacity(0.2))
            .foregroundStyle(.ultraThinMaterial)
            .edgesIgnoringSafeArea(.all)
    }
    
    var backgroundStory1: some View{
        VStack{
            HStack{
                RoundedRectangle(cornerRadius: 10) // Card shape
                    .fill(Color.cyan) // Blue background color
                    .frame(width: 400, height: 200)
                    .overlay(
                        Image("worldBackground")
                            .resizable()
                            .scaledToFit()
                            .padding(20).frame(width: 400) // Padding around the image inside the card
                    )
                
            }
            
            Text(information.infoIntroduction[0])
                .font(.title)
                .fontWeight(.semibold)
                .baselineOffset(4)
                .kerning(1.5)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .padding()
                .padding(.bottom, 30)
            HStack{
                Spacer()
                HStack{
                    Button(action: {
                        isBackgroundStory1.toggle()
                        isBackgroundStory2.toggle()
                    }, label:{
                        Image(systemName: "arrow.right")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .bold()
                            .padding(.horizontal)
                            .padding()
                            .padding(.vertical)
                            .background(
                                Color.black.opacity(0.5)
                            )
                            .cornerRadius(25)
                    })
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            .overlay(
                HStack{
                    Image("boy1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                }
                ,alignment: .bottomLeading
            )
        }
        .padding(.top, 50)
        .padding()
        .background(
            Color.brown
        )
        .cornerRadius(25)
        .padding(16)
        .padding(.horizontal, 60)
        .transition(AnyTransition.scale.animation(.easeInOut))
    }
       var backgroundStory2: some View{
        VStack{
            HStack{
                Image("tiger")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                Image("lion")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                Image("fish")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
            }
            
            Text(information.infoIntroduction[1])
                .font(.title)
                .fontWeight(.semibold)
                .baselineOffset(4)
                .kerning(1.5)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .padding()
                .padding(.bottom, 30)
            HStack{
                Spacer()
                HStack{
                    Button(action: {
                        isBackgroundStory1.toggle()
                        isBackgroundStory2.toggle()
                    }, label:{
                        Image(systemName: "arrow.left")
                            .font(.title)
                            .foregroundColor(Color.white.opacity(0.4))
                            .padding(20)
                            .background(
                                Color.black.opacity(0.3)
                            )
                            .cornerRadius(25)
                    })
                    Button(action: {
                        isBackgroundStory2.toggle()
                        isBackgroundStory3.toggle()
                    }, label:{
                        Image(systemName: "arrow.right")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .bold()
                            .padding(.horizontal)
                            .padding()
                            .padding(.vertical)
                            .background(
                                Color.black.opacity(0.5)
                            )
                            .cornerRadius(25)
                    })
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            .overlay(
                HStack{
                    Image("boy1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    
                }
                ,alignment: .bottomLeading
            )
        }
        .padding(.top, 50)
        .padding()
        .background(
            Color.brown
        )
        .cornerRadius(25)
        .padding(16)
        .padding(.horizontal, 60)
        .transition(AnyTransition.scale.animation(.easeInOut))
    }
    var backgroundStory3: some View{
        VStack{
            HStack{
                Image("fossilfuels")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .overlay(
                        Image(systemName: "x.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                            .background(Color.white)
                            .cornerRadius(10)
                        ,alignment: .bottomLeading
                        
                    )
                Image("greenenergy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .overlay(
                        Image(systemName: "checkmark.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                            .background(Color.white)
                            .cornerRadius(10)
                        ,alignment: .bottomLeading
                        
                    )
            }
            Text(information.infoIntroduction[2])
                .font(.title)
                .fontWeight(.semibold)
                .baselineOffset(4)
                .kerning(1.5)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .padding()
                .padding(.bottom, 30)
            HStack{
                Spacer()
                HStack{
                    Button(action: {
                        isBackgroundStory2.toggle()
                        isBackgroundStory3.toggle()
                    }, label:{
                        Image(systemName: "arrow.left")
                            .font(.title)
                            .foregroundColor(Color.white.opacity(0.4))
                            .padding(20)
                            .background(
                                Color.black.opacity(0.3)
                            )
                            .cornerRadius(25)
                    })
                    NavigationLink(destination: MainPage(), label: {
                        Image(systemName: "arrow.right")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .bold()
                            .padding(.horizontal)
                            .padding()
                            .padding(.vertical)
                            .background(
                                Color.black.opacity(0.5)
                            )
                            .cornerRadius(25)
                    })
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            .overlay(
                HStack{
                    Image("boy1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                    
                }
                ,alignment: .bottomLeading
            )
        }
        .padding(.top, 50)
        .padding()
        .background(
            Color.brown
        )
        .cornerRadius(25)
        .padding(16)
        .padding(.horizontal, 60)
        .transition(AnyTransition.scale.animation(.easeInOut))
    }
    
}
    


struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
