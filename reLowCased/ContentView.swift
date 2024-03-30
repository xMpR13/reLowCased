import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var convertedText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextEditor(text: $inputText)
                .padding()
                .frame(height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue.opacity(0.2), lineWidth: 1) // Minimal border
                )
                .padding(.horizontal, 20)
            
            HStack(spacing: 20) {
                ActionButton(title: "to Lowercase", action: { convertedText = inputText.lowercased() })
                ActionButton(title: "to Uppercase", action: { convertedText = inputText.uppercased() })
            }
            .padding(.horizontal, 20)
            
            if !convertedText.isEmpty {
                Button("Copy to Clipboard") {
                    UIPasteboard.general.string = convertedText
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                
                Text(convertedText)
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            
            Spacer()
            
            Text("prospermpuru was here")
                .foregroundColor(.gray)
                .padding(.bottom, 20)
        }
        .padding()
    }
}

struct ActionButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
