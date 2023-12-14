//
//  Page14View.swift
//  Tales
//
//  Created by Bryce Cameron on 12/12/23.
//

// Page14View.swift
import SwiftUI

struct Page14View: View {
    @State private var showContentView = false

    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Fourteen.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("As you approach the large metal door it slowly starts to open. This room is brightly light and the walls are covered in computer monitors. Your images are all over the monitors showing all the steps you did to get here. They have been studying and tracking you. Was this all some sort of test? As you ponder what just happened, two humanoid figures materialize in the room with you. They are holding some sort of weapons. You hear a voice over a speaker “test 12 complete, clear to neutralize the test subject” The last thing you see is a sudden bright light.")
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

struct Page14View_Previews: PreviewProvider {
    static var previews: some View {
        Page14View()
    }
}
