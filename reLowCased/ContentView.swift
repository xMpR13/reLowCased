import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var convertedText: String = ""
    @State private var isKeyboardVisible = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter text here", text: $inputText) { isEditing in
                self.isKeyboardVisible = isEditing
            }
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal, 20)
            
            HStack(spacing: 20) {
                Button("to Lowercase") {
                    convertedText = inputText.lowercased()
                   hideKeyboard()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(10)
                
                Button("to Uppercase") {
                    convertedText = inputText.uppercased()
                   hideKeyboard()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            if !convertedText.isEmpty {
                Button("Copy to Clipboard") {
                   UIPasteboard.general.string = convertedText
                    hideKeyboard()
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
                
                Button("Clear") {
                    convertedText = ""
                    inputText = ""
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(10)
                .padding(.horizontal, 20)
            }
            
            Spacer()
            
            Text("One cannot acquire something without sacrificing something equally valuable in exchange.")
                .foregroundColor(.white)
                .padding(10)
                .background(Color.orange)
                .cornerRadius(20)
            
        }
        .padding()
    }
    
   private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
