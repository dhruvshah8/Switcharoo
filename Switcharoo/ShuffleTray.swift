import SwiftUI

struct ShuffleTray: View {
    var action: (() -> Void)?

    var body: some View {
        HStack {
            Spacer()

            Button(action: {
                self.action?()
            }) {
                Text("Shuffle Tray")
                    .font(.headline)
                    .padding()
            }
            .buttonStyle(BorderlessButtonStyle())
            .background(Color.red)
            .clipShape(Capsule())
            .foregroundColor(.white)
        }
        .padding([.trailing, .bottom])
    }
}

struct ShuffleTray_Previews: PreviewProvider {
    static var previews: some View {
        ShuffleTray()
    }
}
