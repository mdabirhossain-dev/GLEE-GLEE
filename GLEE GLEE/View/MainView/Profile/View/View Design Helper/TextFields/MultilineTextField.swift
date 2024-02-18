//
//  MultilineTextField.swift
//  AmberIT
//
//  Created by Md Abir Hossain on 12/10/23.
//

import SwiftUI


struct MultilineTextField: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.textColor = UIColor.label
        textView.backgroundColor = UIColor.clear
        textView.font = .poppins(.regular_400, size: 13)
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.delegate = context.coordinator
        
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultilineTextField

        init(_ parent: MultilineTextField) {
            self.parent = parent
        }

        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
}

