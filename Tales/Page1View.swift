//
//  Plot1View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page1View.swift
import SwiftUI

struct Page1View: View {
    @State private var showPage2 = false
    @State private var showPage3 = false

    var body: some View {
        ScrollView {
            VStack {
            Image(uiImage: #imageLiteral(resourceName: "One.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("As you stand at the feet of this enormous Sphynx, you notice that the main doorway is open. You think to yourself, head inside to find help or head back in the direction where the road could be.")
                .padding()
                .foregroundColor(StoryStyle.textColor)

            HStack {
                ChoiceButton("Try to enter the sphynx", action: {
                    showPage3 = true

                })
                .fullScreenCover(isPresented: $showPage3) {
                    Page3View()
                }
                .padding()

                Spacer()

                ChoiceButton("Try to find the road", action: {
                    showPage2 = true

                })
                .fullScreenCover(isPresented: $showPage2) {
                    Page2View()
                }
                .padding()
            }

            Spacer()
            }
        }
        .background(StoryStyle.pageBackground.edgesIgnoringSafeArea(.all))
    }
}

struct Page1View_Previews: PreviewProvider {
    static var previews: some View {
        Page1View()
    }
}
