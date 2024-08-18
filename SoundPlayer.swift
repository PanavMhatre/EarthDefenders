import AVFoundation

class SoundPlayer {
    static let shared = SoundPlayer()
    private var audioPlayer: AVAudioPlayer?
    
    func playSound(soundName: String, fileType: String) {
        if let soundURL = Bundle.main.url(forResource: soundName, withExtension: fileType) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found.")
        }
    }
    func stopSound() {
        audioPlayer?.stop()
        audioPlayer = nil
        print("Sound stopped")
    }
}
