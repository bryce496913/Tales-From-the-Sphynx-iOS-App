//
//  Page3View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page3View.swift
import SwiftUI

struct Page3View: View {
    @State private var showPage4 = false
    @State private var showPage6 = false

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "Three.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("After climbing the stairs of the Sphynx, you enter the main hall. Though empty, the room is dimly lit, hinting at the chance of more people inside. As your eyes adjust to the change of light, you notice, at the back, the hall splits in two different directions.")
                .padding()
                .foregroundColor(StoryStyle.textColor)

            HStack {
                ChoiceButton("Head down the left", action: {
                    showPage4 = true

                })
                .fullScreenCover(isPresented: $showPage4) {
                    Page4View()
                }
                .padding()

                Spacer()

                ChoiceButton("Head down the right", action: {
                    showPage6 = true

                })
                .fullScreenCover(isPresented: $showPage6) {
                    Page6View()
                }
                .padding()
            }

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Page3View_Previews: PreviewProvider {
    static var previews: some View {
        Page3View()
    }
}
