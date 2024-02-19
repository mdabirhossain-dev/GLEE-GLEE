//
//  SpeechRecognizer.swift
//  News
//
//  Created by Md Abir Hossain on 26/10/23.
//

import Speech
import AVFoundation

class SpeechRecognizer: ObservableObject {
    
    static let shared = SpeechRecognizer()
    
    enum RecognizerError: Error {
        case nilRecognizer
        case notAuthorizedToRecognize
        case notPermittedToRecord
        case recognizerIsUnavailable
        
        var message: String {
            switch self {
            case .nilRecognizer: return "Can't initialize speech recognizer"
            case .notAuthorizedToRecognize: return "Not authorized to recognize speech"
            case .notPermittedToRecord: return "Not permitted to record audio"
            case .recognizerIsUnavailable: return "Recognizer is unavailable"
            }
        }
    }
    
    @Published var text: String = ""
    @Published var isRecording: Bool = false
    @Published var isAlert: Bool = false
    
    private var audioEngine: AVAudioEngine?
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var task: SFSpeechRecognitionTask?
    private let recognizer: SFSpeechRecognizer?
    private var silenceTimer: Timer?
    var audioMeterTimer: Timer?
    var isSilent: Bool = true
    let x = SFSpeechAudioBufferRecognitionRequest()
    
    init() {
        recognizer = SFSpeechRecognizer()
        
        Task(priority: .background) {
            do {
                guard recognizer != nil else {
                    DispatchQueue.main.async {
                        self.isAlert = true
                    }
                    throw RecognizerError.nilRecognizer
                    
                }
                guard await SFSpeechRecognizer.hasAuthorizationToRecognize() else {
                    DispatchQueue.main.async {
                        self.isAlert = true
                    }
                    throw RecognizerError.notAuthorizedToRecognize
                    
                }
                guard await AVAudioSession.sharedInstance().hasPermissionToRecord() else {
                    DispatchQueue.main.async {
                        self.isAlert = true
                    }
                    throw RecognizerError.notPermittedToRecord
                    
                }
            } catch {
                speakError(error)
            }
        }
    }
    
    deinit {
        reset()
    }
    
    // Reset the speech recognizer.
    func reset() {
        task?.cancel()
        audioEngine?.stop()
        audioEngine = nil
        request = nil
        task = nil
        self.isRecording = false
        
        // Save to search History
        if self.text.count > 2 {
            addRecent(recent: self.text)
        }
    }
    
    // Stop transcribing audio.
    func stopTranscribing() {
        reset()
    }
    
    private func speak(_ message: String) {
        text = message
    }
    
    private func speakError(_ error: Error) {
        var errorMessage = ""
        if let error = error as? RecognizerError {
            errorMessage += error.message
        } else {
            errorMessage += error.localizedDescription
        }
    }
    
    func transcribe() {
        DispatchQueue(label: "Speech Recognizer Queue", qos: .background).async { [weak self] in
            guard let self = self, let recognizer = self.recognizer, recognizer.isAvailable else {
                self?.speakError(RecognizerError.recognizerIsUnavailable)
                return
            }
            
            do {
                let (audioEngine, request) = try Self.prepareEngine()
                self.audioEngine = audioEngine
                self.request = request
                
                self.task = recognizer.recognitionTask(with: request) { result, error in
                    let receivedFinalResult = result?.isFinal ?? false
                    let receivedError = error != nil // != nil means there's error (true)
                    
                    if receivedFinalResult || receivedError {
                        self.stopTranscribing()
                        audioEngine.inputNode.removeTap(onBus: 0)
                        
                        Log.info("Recording cancelled")
                        
                        self.isRecording = false
                    }
                    
                    if let result = result {
                        self.speak(result.bestTranscription.formattedString)
                        self.isRecording = true
                    }
                    
                    var isFinal = false
                    
                    if result != nil {
                        isFinal = (result?.isFinal)!
                    }
                    
                    if let _ = result?.speechRecognitionMetadata?.voiceAnalytics?.voicing { } else { self.stopSilenceTimer()
                    }
                    
                    if let timer = self.silenceTimer, timer.isValid {
                        if isFinal {
                            self.stopSilenceTimer()
                        }
                    } else {
                        self.startedUserSilenceTimer()
                    }
                }
            } catch {
                self.reset()
                self.speakError(error)
            }
        }
    }
    
    private func startedUserSilenceTimer() {
        Log.info("User silent 🔇")
        self.silenceTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (timer) in
            Log.info("Stopped input ❌")
            self.isRecording = false
            self.stopTranscribing()
        })
    }
    
    private func stopSilenceTimer() {
        self.silenceTimer?.invalidate()
        Log.info("User Talking 🎤")
    }
    
    private static func prepareEngine() throws -> (AVAudioEngine, SFSpeechAudioBufferRecognitionRequest) {
        let audioEngine = AVAudioEngine()
        
        let request = SFSpeechAudioBufferRecognitionRequest()
        request.shouldReportPartialResults = true
        
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        let inputNode = audioEngine.inputNode
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) {
            (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            request.append(buffer)
        }
        audioEngine.prepare()
        try audioEngine.start()
        
        return (audioEngine, request)
    }
}
