import Foundation
import SwiftUI
struct DialectDetailView: View {
    let dialect: String
    
    var body: some View {
        Text("Detail view for \(dialect)")
            .navigationTitle(dialect)
    }
}
struct DialectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DialectDetailView(dialect: "Example Dialect")
    }
}
/*
import SwiftUI
import Speech
import AVFoundation
class AudioRecorderDelegate: NSObject, AVAudioRecorderDelegate {
    var parent: DialectDetailView
    init(parent: DialectDetailView) {
        self.parent = parent
    }
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            parent.performSpeechRecognition()
        } else {
            print("Recording failed.")
        }
    }
}
class SpeechRecognizerDelegate: NSObject, SFSpeechRecognizerDelegate {
    var parent: DialectDetailView
    init(parent: DialectDetailView) {
        self.parent = parent
    }
    // Implement delegate methods if needed
}
struct DialectDetailView: View {
    @State private var isRecording = false
    @State private var audioRecorder: AVAudioRecorder?
    @State private var recognizedText = ""
    var body: some View {
        VStack {
            TextEditor(text: $recognizedText)
                .padding()
                .frame(maxHeight: .infinity)
                .background(Color.gray.opacity(0.1))
            
            Button(action: {
                isRecording.toggle()
                if isRecording {
                    startRecording()
                } else {
                    stopRecording()
                }
            }) {
                Text(isRecording ? "Stop Recording" : "Start Recording")
                    .padding()
                    .foregroundColor(.white)
                    .background(isRecording ? Color.red : Color.blue)
                    .cornerRadius(8)
            }
        }
        .navigationBarTitle("Speech Recognition")
        .onAppear(perform: setupRecorder)
    }
    func setupRecorder() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            let settings: [String: Any] = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 44100,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            guard let url = getDocumentsDirectory().appendingPathComponent("recording.m4a") as URL? else {
                return
            }
            audioRecorder = try AVAudioRecorder(url: url, settings: settings)
            let recorderDelegate = AudioRecorderDelegate(parent: self)
            audioRecorder?.delegate = recorderDelegate
            audioRecorder?.prepareToRecord()
        } catch {
            print("Error setting up audio recorder: \(error.localizedDescription)")
        }
    }
    func startRecording() {
        recognizedText = "" // Clear previous recognized text
        audioRecorder?.record()
    }
    func stopRecording() {
        audioRecorder?.stop()
    }
    func performSpeechRecognition() {
        guard let audioURL = audioRecorder?.url else {
            return
        }
        let recognizer = SFSpeechRecognizer()
        let request = SFSpeechURLRecognitionRequest(url: audioURL)
        recognizer?.recognitionTask(with: request) { result, error in
            if let result = result {
                let recognizedString = result.bestTranscription.formattedString
                self.recognizedText = recognizedString
                self.saveTextToFile(text: recognizedString)
            } else if let error = error {
                print("Speech recognition error: \(error.localizedDescription)")
            }
        }
    }
    func saveTextToFile(text: String) {
        do {
            let url = getDocumentsDirectory().appendingPathComponent("recognizedText.txt")
            try text.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            print("Error saving text to file: \(error.localizedDescription)")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
struct DialectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DialectDetailView()
    }
}
*/
