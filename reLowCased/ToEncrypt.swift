import SwiftUI

struct ToEncrypt: View {
    @State private var inputText = ""
    @State private var encryptedText = ""
    @State private var isTextVisible = false

    var body: some View {
        VStack {
            Spacer()
           
            Text("DE - ENCRYPT")
                .font(.system(size: 30))
                .bold()
                .padding()
                .cornerRadius(10)
            
            TextField("Enter text here", text: $inputText)
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .onTapGesture {
                    if let clipboardContent = UIPasteboard.general.string {
                        inputText = clipboardContent
                    }
                }

            if isTextVisible {
                Text(encryptedText)
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            
            Spacer()
            
            // Encrypt Button
            Button(action: {
                encryptedText = encryptOrDecrypt(inputText, shift: 3)
                isTextVisible = true
                hideKeyboard()
            }) {
                Text("Encrypt")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            // Decrypt Button
            Button(action: {
                encryptedText = encryptOrDecrypt(inputText, shift: 0)
                isTextVisible = true
                hideKeyboard()
            }) {
                Text("Decrypt")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
           
            // Clear Button
            Button(action: {
                inputText = ""
                encryptedText = ""
                isTextVisible = false
                hideKeyboard()
            }) {
                Text("Clear")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            Text("super")
                .foregroundColor(.gray)
                .padding(10)
                .cornerRadius(20)
        }
        .padding()
        .onTapGesture {
            hideKeyboard()
        }
        
    }

    private func encryptOrDecrypt(_ input: String, shift: Int) -> String {
        let lowerAlphabet = Array("abcdefghijklmnopqrstuvwxyz")
        let upperAlphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        var result = ""
        
        for char in input {
            if let index = lowerAlphabet.firstIndex(of: char) {
                let newIndex = (index + shift + 26) % 26
                result.append(lowerAlphabet[newIndex])
            } else if let index = upperAlphabet.firstIndex(of: char) {
                let newIndex = (index + shift + 26) % 26
                result.append(upperAlphabet[newIndex])
            } else {
                result.append(char)
            }
        }
        
        return result
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ToEncrypt_Previews: PreviewProvider {
    static var previews: some View {
        ToEncrypt()
    }
}
