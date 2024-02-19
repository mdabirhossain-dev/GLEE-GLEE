//
//  Search.swift
//  OTT App
//
//  Created by Md Abir Hossain on 03-09-2023.
//

import SwiftUI

struct Search: View {
    // MARK: - Properties
//    @Binding var text: String
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isAlert: Bool = false
    @Binding var text: String
    @State private var micIconScale = 1.0
    @State private var isRecording: Bool = false
    
    let execute: () -> Void
    
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 32, weight: .light))
                .foregroundColor(Color(UIColor.placeholderTextfield ?? .systemBackground))
            if #available(iOS 15.0, *) {
                TextField("", text: $text, onCommit: { execute() })
                    .submitLabel(.search)
                    .autocorrectionDisabled(true)
                    .modifier(TextFieldStyle(isPlaceHolder: text.isEmpty, placeholder: "Search for a show, movie, e.t.c."))
            } else {
                TextField("", text: $text, onCommit: { execute() })
                    .keyboardType(.webSearch)
                    .autocorrectionDisabled(true)
                    .modifier(TextFieldStyle(isPlaceHolder: text.isEmpty, placeholder: "Search for a show, movie, e.t.c."))
            }
            
            Spacer()
            
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 12, weight: .semibold))
                        .padding(3)
                        .foregroundColor(Color.gray)
                        .background(Color.white.opacity(0.5))
                        .clipShape(Circle())
                }
            }
            
            Button {
                // Alert
                isAlert = speechRecognizer.isAlert
                
                withAnimation {
                    speechRecognizer.isRecording.toggle()
                    if speechRecognizer.isRecording {
                        speechRecognizer.transcribe()
                        micIconScale = 1.2
                    } else {
                        speechRecognizer.stopTranscribing()
                        micIconScale = 1.0
                    }
                }
            } label: {
                Image("mic")
                    .font(Font.system(size: 25, weight: .light))
                    .foregroundColor(!speechRecognizer.isRecording ? Color(UIColor.placeholderTextfield ?? .systemBackground) : Color.red.opacity(0.8))
                    .frame(width: 25.125, height: 25.125)
                    .shadow(color: .red, radius: !speechRecognizer.isRecording ? 0 : 5)
                    .scaleEffect(micIconScale, anchor: .center)
            }
            .onChange(of: speechRecognizer.isRecording) { _ in
                withAnimation {
                    if speechRecognizer.isRecording {
                        micIconScale = 1.2
                    } else {
                        micIconScale = 1.0
                    }
                }
            }
            .onChange(of: speechRecognizer.text) { _ in
                text = speechRecognizer.text
            }
            .onChange(of: text) { _ in
                if text.count > 0 {
//                    text = text[text.startIndex] == " " ? "" : text
//                    text = text.replacingOccurrences(of: "  ", with: " ")
//                    text = text.replacingOccurrences(of: ".", with: "")
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 54)
        .foregroundColor(Color.textForeground)
        .background(Color(UIColor.largeTextFieldBackground ?? .systemBackground))
        .lineLimit(1)
        .minimumScaleFactor(0.5)
        .cornerRadius(30)
        .alert(isPresented: $isAlert) {
            Alert(
                title: Text("Alert!!"),
                message: Text("Speech recognition permission denied. You can approve from Settings."),
                primaryButton: .default(Text("Settings")) {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                },
                secondaryButton: .cancel()
            )
        }
    }
}

 // MARK: - Preview
 struct Search_Previews: PreviewProvider {
     @State static var text = ""
     static var previews: some View {
         Search(text: $text, execute: {  })
     }
 }


