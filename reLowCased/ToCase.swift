import SwiftUI

struct ToCase: View {
    @State private var inputText: String = ""
    @State private var convertedText: String = ""
    @FocusState private var isInputFocused: Bool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Input Text")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    TextField("Enter text to convert...", text: $inputText, axis: .vertical)
                        .lineLimit(4...8)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .focused($isInputFocused)
                }
                
                HStack(spacing: 16) {
                    Button {
                        withAnimation { convertedText = inputText.lowercased() }
                        isInputFocused = false
                    } label: {
                        Label("Lowercase", systemImage: "textformat.size.smaller")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                    Button {
                        withAnimation { convertedText = inputText.uppercased() }
                        isInputFocused = false
                    } label: {
                        Label("Uppercase", systemImage: "textformat.size.larger")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                
                if !convertedText.isEmpty {
                    VStack(spacing: 16) {
                        Divider().padding(.vertical, 8)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Result")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            
                            Text(convertedText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color(UIColor.tertiarySystemBackground))
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        
                        HStack(spacing: 16) {
                            Button {
                                UIPasteboard.general.string = convertedText
                                isInputFocused = false
                            } label: {
                                Label("Copy", systemImage: "doc.on.doc")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                            
                            Button(role: .destructive) {
                                withAnimation {
                                    convertedText = ""
                                    inputText = ""
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
        .navigationTitle("Up / Low Case")
        .navigationBarTitleDisplayMode(.inline)
        .onTapGesture { isInputFocused = false }
    }
}

struct ToCase_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack { ToCase() }
    }
}
