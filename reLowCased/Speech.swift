//
//  Speech.swift
//  reLowCased
//
//  Created by Prosper Mpuru on 2024/04/04.
//

import SwiftUI

import SwiftUI
import AVFoundation

struct TextToSpeech: View {
    @State private var inputText = ""
    @State private var isTextVisible = false
    let speechSynthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack {
            Spacer()

            Text("Text to Speech")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            TextField("Enter text here", text: $inputText)
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal, 20)

            if isTextVisible {
                Text(inputText)
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            
            
            Button(action: {
                
                isTextVisible = true
                
                speakText(inputText)
            }) {
                Text("Speak")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            
            Button(action: {
                inputText = ""
                isTextVisible = false
            }) {
                Text("Clear")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)

            Spacer()
            
            Text("super")
                .foregroundColor(.gray)
                .padding(10)
                .cornerRadius(20)
        }
        
        
        .padding()
    }

    private func speakText(_ text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
    }
}

struct TextToSpeech_Previews: PreviewProvider {
    static var previews: some View {
        TextToSpeech()
    }
}
