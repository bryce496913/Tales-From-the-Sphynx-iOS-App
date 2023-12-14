//
//  Page22View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page22View.swift
import SwiftUI

struct Page22View: View {
    @State private var showContentView = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Twenty-Two.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("As you slowly open up the right sarcophagus, you hear movement from within. You take a step back, and a body falls from the sarcophagus to the floor. The body wiggles and slowly stands up. You have awoken a mummy. Its glowing eyes stun each of you. As you stand paralyzed, cloth extends from the mummy’s arms and starts wrapping around you until you are engulfed completely. It is at this moment the mummy speaks, “Debbie, I got some new recruits.” A panel in the wall slides open and out comes another mummy with a clipboard. “Hi, I’m Debbie, and I will be your mummy trainer, here to get you all ready to scare any unsuspecting folk for all eternity.\"")
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

struct Page22View_Previews: PreviewProvider {
    static var previews: some View {
        Page22View()
    }
}
