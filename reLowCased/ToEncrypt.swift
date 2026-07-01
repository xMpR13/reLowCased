import SwiftUI

struct ToEncrypt: View {
    @State private var inputText = ""
    @State private var resultText = ""
    
    @State private var shiftKey: Int = 3
    
    @FocusState private var isInputFocused: Bool

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                // MARK: - Cipher Key Selector
                Stepper(value: $shiftKey, in: 1...25) {
                    Text("Cipher Key (Shift): **\(shiftKey)**")
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                // MARK: - Input Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Input Text")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    TextField("Enter text here...", text: $inputText, axis: .vertical)
                        .lineLimit(5...10)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .focused($isInputFocused)
                }

                // MARK: - Swap Button (UX Fix)
                // Allows the user to quickly move the result up to the input box to test decryption
                if !resultText.isEmpty {
                    Button {
                        withAnimation {
                            inputText = resultText
                            resultText = ""
                        }
                    } label: {
                        Image(systemName: "arrow.up.arrow.down.circle.fill")
                            .font(.system(size: 28))
                            .foregroundStyle(Color.accentColor)
                    }
                }

                // MARK: - Primary Actions
                HStack(spacing: 16) {
                    Button {
                        withAnimation { resultText = encryptOrDecrypt(inputText, shift: shiftKey) }
                        isInputFocused = false
                    } label: {
                        Label("Encrypt", systemImage: "lock.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                    Button {
                        withAnimation { resultText = encryptOrDecrypt(inputText, shift: -shiftKey) }
                        isInputFocused = false
                    } label: {
                        Label("Decrypt", systemImage: "lock.open.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                    .controlSize(.large)
                }

                // MARK: - Output Section
                if !resultText.isEmpty {
                    VStack(spacing: 16) {
                        Divider().padding(.vertical, 8)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Result")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            
                            Text(resultText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color(UIColor.tertiarySystemBackground))
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        
                        HStack(spacing: 16) {
                            Button {
                                UIPasteboard.general.string = resultText
                                isInputFocused = false
                            } label: {
                                Label("Copy", systemImage: "doc.on.doc")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                            
                            Button(role: .destructive) {
                                withAnimation {
                                    inputText = ""
                                    resultText = ""
                                }
                                isInputFocused = false
                            } label: {
                                Label("Clear", systemImage: "trash")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                        }
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }
                Spacer(minLength: 20)
            }
            .padding()
        }
        .navigationTitle("De / Encrypt")
        .navigationBarTitleDisplayMode(.inline)
        .onTapGesture { isInputFocused = false }
    }

    // MARK: - Cipher Logic
    private func encryptOrDecrypt(_ input: String, shift: Int) -> String {
        // Converting standard alphabets to arrays for fast indexing
        let lowerAlphabet = Array("abcdefghijklmnopqrstuvwxyz")
        let upperAlphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        var result = ""
        
        for char in input {
            if let index = lowerAlphabet.firstIndex(of: char) {
                // The % 26 + 26 ensures negative numbers wrap cleanly around the alphabet
                let newIndex = (index + shift % 26 + 26) % 26
                result.append(lowerAlphabet[newIndex])
            } else if let index = upperAlphabet.firstIndex(of: char) {
                let newIndex = (index + shift % 26 + 26) % 26
                result.append(upperAlphabet[newIndex])
            } else {
                // Ignore spaces, numbers, and special characters
                result.append(char)
            }
        }
        return result
    }
}

// MARK: - Preview
struct ToEncrypt_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack { ToEncrypt() }
    }
}
