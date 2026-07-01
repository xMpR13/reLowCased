import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                
                Spacer().frame(height: 10)
                
                // MARK: - Header
                VStack(spacing: 5) {
                    Text("ReLowCased")
                        .font(.system(size: 42, weight: .heavy, design: .rounded))
                        .foregroundStyle(Color.accentColor)
                    
                    Text("Text Manipulation Utility")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                
                // MARK: - Description Card
                Text("This app offers text manipulation features, allowing users to convert text cases, encrypt using a Caesar cipher, and utilize text-to-speech. It provides a clean interface for modifying and securing text.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal, 20)
                
                // MARK: - Navigation Buttons
                VStack(spacing: 16) {
                    NavigationLink(destination: ToCase()) {
                        MenuButtonView(title: "Up / Low Case", iconName: "textformat")
                    }
                    
                    NavigationLink(destination: ToEncrypt()) {
                        MenuButtonView(title: "De / Encrypt", iconName: "lock.shield.fill")
                    }
                    
                    NavigationLink(destination: TextToSpeech()) {
                        MenuButtonView(title: "Text to Speech", iconName: "waveform")
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                // MARK: - Footer
                Text("super, like the guy from one piece")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)
            }
        }
    }
}

// MARK: - Reusable Button Component
struct MenuButtonView: View {
    var title: String
    var iconName: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: iconName)
                .font(.title2)
            
            Text(title)
                .font(.title3.bold())
        }
        .frame(maxWidth: .infinity, minHeight: 60)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
