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
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "One.png"))
                .resizable()
                .scaledToFit()
                .padding()

            Text("As you stand at the feet of this enormous Sphynx, you notice that the main doorway is open. You think to yourself, head inside to find help or head back in the direction where the road could be.")
                .padding()
                .foregroundColor(.black)

            HStack {
                Button(action: {
                    showPage3 = true
                }) {
                    Text("Try to enter the sphynx")
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 150, height: 100) // Set a fixed height
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center) // Center the text
                }
                .fullScreenCover(isPresented: $showPage3) {
                    Page3View()
                }
                .padding()

                Spacer()

                Button(action: {
                    showPage2 = true
                }) {
                    Text("Try to find the road")
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 150, height: 100) // Set a fixed height
                        .background(Color(hex: "d6be9d"))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center) // Center the text
                }
                .fullScreenCover(isPresented: $showPage2) {
                    Page2View()
                }
                .padding()
            }

            Spacer()
        }
        .background(Color(hex: "00aeef").edgesIgnoringSafeArea(.all))
    }
}

struct Page1View_Previews: PreviewProvider {
    static var previews: some View {
        Page1View()
    }
}
