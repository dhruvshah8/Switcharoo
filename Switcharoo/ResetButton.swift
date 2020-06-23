import SwiftUI

struct ResetButton: View {
    var action: (() -> Void)?

    var body: some View {
        Group {
            Button(action: {
                self.action?()
            }) {
                Text("Reset Letters")
                    .font(.title)
                    .padding()
            }
            .buttonStyle(BorderlessButtonStyle())
            .background(Color.green)
            .clipShape(Capsule())
            .foregroundColor(.white)

            Text("(10 Point Penalty)")
                .font(.headline)
                .foregroundColor(.white)
                .shadow(color: .red, radius: 5)
                .shadow(color: .red, radius: 5)
        }
    }
}

struct ResetButton_Previews: PreviewProvider {
    static var previews: some View {
        ResetButton()
    }
}
