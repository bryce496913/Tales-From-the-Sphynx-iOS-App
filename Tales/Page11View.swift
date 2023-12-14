//
//  Page11View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page11View.swift
import SwiftUI

struct Page11View: View {
    @State private var showContentView = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Eleven.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("You try to move slowly, step by step, but as soon as you take your next step, the complete floor starts to crumble. As you fall through the darkness, you notice time is irrelevant with no reference. Slowly, the nothingness is ending and you’re opening your eyes. You survey your surroundings; you are not falling… A sudden pain brings you back to reality, and you notice you are still in the vehicle wreckage. You call for help, but to no answer. You think, was the Sphynx just all in your mind while you were unconscious from the crash? You look around, your movements increase your pain. You close your eyes and drift back to the nothingness. It is peaceful.")
                .padding()
                .foregroundColor(.black)

            Button(action: {
                showContentView = true
            }) {
                Text("Game Over")
                    .foregroundColor(.black)
                    .padding()
                    .background(Color(hex: "d6be9d"))
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $showContentView) {
                ContentView()
            }
            .padding()

            Spacer()
        }
        .background(Color(hex: "00aeef").edgesIgnoringSafeArea(.all))
    }
}

struct Page11View_Previews: PreviewProvider {
    static var previews: some View {
        Page11View()
    }
}
