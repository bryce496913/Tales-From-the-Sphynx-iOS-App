//
//  Plot2View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Plot2View.swift
import SwiftUI

struct Plot2View: View {
    @State private var showPage1 = false

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Plot2.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("Slowly the dust settled as the vehicle comes to rest after countless tumbles. You awake and managed to crawl from the wreckage. Though extremely shaken, you seem to have no other physical injuries. You look around to get your bearings. The road was nowhere to be seen and the only thing in sight was an Egyptian Sphynx. Hoping this was a tourist attraction where you might find help, you head over.")
                .padding()
                .foregroundColor(StoryStyle.textColor)

            ChoiceButton("Continue", width: nil, height: nil, action: {
                showPage1 = true

            })
            .fullScreenCover(isPresented: $showPage1) {
                Page1View()
            }
            .padding()

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Plot2View_Previews: PreviewProvider {
    static var previews: some View {
        Plot2View()
    }
}

