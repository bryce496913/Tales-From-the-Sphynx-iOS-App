//
//  Plot1View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Plot1View.swift
import SwiftUI

struct Plot1View: View {
    @State private var showPlot2 = false

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Plot1.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("“What a stunning day in Egypt”, You say to yourself, as you drove along the desert highway. Sadly, Spotify didn’t work as there was no reception out here. The air was dry, rolling sand dunes on all sides of the vehicle and not another soul insight. As you drive along, sudden darkness fell and your vehicle is dramatically launched off the road.")
                .padding()
                .foregroundColor(StoryStyle.textColor)

            ChoiceButton("Continue", width: nil, height: nil, action: {
                showPlot2 = true

            })
            .fullScreenCover(isPresented: $showPlot2) {
                Plot2View()
            }
            .padding()

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Plot1View_Previews: PreviewProvider {
    static var previews: some View {
        Plot1View()
    }
}
