import SwiftUI

struct Plot2View: View {
    @State private var showPage1 = false

    var body: some View {
        StoryPageLayout(
            imageName: "Plot2.png",
            title: "The Sphinx Appears",
            text: "Slowly the dust settled as the vehicle comes to rest after countless tumbles. You awake and managed to crawl from the wreckage. Though extremely shaken, you seem to have no other physical injuries. You look around to get your bearings. The road was nowhere to be seen and the only thing in sight was an Egyptian Sphynx. Hoping this was a tourist attraction where you might find help, you head over."
        ) {
            ChoiceButton("Continue") { showPage1 = true }
                .storyFullScreenCover(isPresented: $showPage1) { Page1View() }
        }
    }
}

struct Plot2View_Previews: PreviewProvider {
    static var previews: some View { Plot2View() }
}
