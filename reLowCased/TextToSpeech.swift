import SwiftUI
import AVFoundation

struct TextToSpeech: View {
    @State private var inputText = ""
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @FocusState private var isInputFocused: Bool

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Text to Read")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    TextField("Enter text here...", text: $inputText, axis: .vertical)
                        .lineLimit(5...10)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .focused($isInputFocused)
                }
                
                HStack(spacing: 16) {
                    Button {
                        speakText(inputText)
                        isInputFocused = false
                    } label: {
                        Label("Speak", systemImage: "play.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    
                    Button {
                        stopSpeaking()
                    } label: {
                        Label("Stop", systemImage: "stop.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .tint(.orange)
                    .controlSize(.large)
                }
                
                if !inputText.isEmpty {
                    VStack(spacing: 16) {
                        Divider().padding(.vertical, 8)
                        
                        Button(role: .destructive) {
                            stopSpeaking()
                            withAnimation { inputText = "" }
                            isInputFocused = false
                        } label: {
                            Label("Clear All", systemImage: "trash")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }
                Spacer(minLength: 20)
            }
            .padding()
        }
        .navigationTitle("Text to Speech")
        .navigationBarTitleDisplayMode(.inline)
        .onTapGesture { isInputFocused = false }
        .onDisappear { stopSpeaking() }
    }

    private func speakText(_ text: String) {
        stopSpeaking()
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
    }
    
    private func stopSpeaking() {
        if speechSynthesizer.isSpeaking {
            speechSynthesizer.stopSpeaking(at: .immediate)
        }
    }
}

struct TextToSpeech_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack { TextToSpeech() }
    }
}
