//
//  TextFieldView.swift
//  AmberIT
//
//  Created by Md Abir Hossain on 12/10/23.
//

import SwiftUI
import Combine


struct TextFieldView: View {
    // MARK: - Preview
    let fieldPlaceholder: String
    let titleFontColor: Color?
    @Binding var text: String
    
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .leading) {
            Text(fieldPlaceholder)
                .padding(.horizontal, 12)
                .font(.custom(FontManager.Poppins.light, size: 12))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(text.isEmpty ? 1.0 : 0)
            
            TextFieldRepresentable(text: $text)
                .padding(.horizontal, 12)
                .frame(maxWidth: .infinity)
        }
    }
}

// MARK: - Preview
struct TextFieldView_Previews: PreviewProvider {
    @State static var text: String = ""
    static var previews: some View {
        TextFieldView(fieldPlaceholder: "enter your name", titleFontColor: Color(red: 0.51, green: 0.51, blue: 0.51), text: $text)
            .preferredColorScheme(.dark)
    }
}



struct TextFieldRepresentable: UIViewRepresentable {
    @Binding var text: String
        
    func makeUIView(context: Context) -> UITextField {
        // Setup text view
        let textView = UITextField()
        textView.delegate = context.coordinator
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textView.textColor = UIColor(Color.primary)
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.font = textView.font?.withSize(12)
        
        return textView
    }
    
    func makeCoordinator() -> TextFieldRepresentable.Coordinator {
        return Coordinator(self)
    }
    
    func updateUIView(_ textView: UITextField, context: Context) {
        if textView.text != text {
            textView.text = text
        }
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextFieldRepresentable
        
        init(_ parent: TextFieldRepresentable) {
            self.parent = parent
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let currentValue = textField.text as NSString? {
                let proposedValue = currentValue.replacingCharacters(in: range, with: string) as String
                self.parent.text = proposedValue
            }
            return true
        }
    }
}


struct GeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { geometry in
            Group { () -> AnyView in
                DispatchQueue.main.async {
                    self.rect = geometry.frame(in: .global)
                }

                return AnyView(Color.clear)
            }
        }
    }
}


final class KeyboardGuardian: ObservableObject {
    public var rects: Array<CGRect>
    public var keyboardRect: CGRect = CGRect()

    // keyboardWillShow notification may be posted repeatedly,
    // this flag makes sure we only act once per keyboard appearance
    public var keyboardIsHidden = true

    @Published var slide: CGFloat = 0

    var showField: Int = 0 {
        didSet {
            updateSlide()
        }
    }

    init(textFieldCount: Int) {
        self.rects = Array<CGRect>(repeating: CGRect(), count: textFieldCount)

    }

    func addObserver() {
NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDidHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
}

func removeObserver() {
 NotificationCenter.default.removeObserver(self)
}

    deinit {
        NotificationCenter.default.removeObserver(self)
    }



    @objc func keyBoardWillShow(notification: Notification) {
        if keyboardIsHidden {
            keyboardIsHidden = false
            if let rect = notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect {
                keyboardRect = rect
                updateSlide()
            }
        }
    }

    @objc func keyBoardDidHide(notification: Notification) {
        keyboardIsHidden = true
        updateSlide()
    }

    func updateSlide() {
        if keyboardIsHidden {
            slide = 0
        } else {
            let tfRect = self.rects[self.showField]
            let diff = keyboardRect.minY - tfRect.maxY

            if diff > 0 {
                slide += diff
            } else {
                slide += min(diff, 0)
            }

        }
    }
}
