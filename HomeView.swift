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
    


struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
