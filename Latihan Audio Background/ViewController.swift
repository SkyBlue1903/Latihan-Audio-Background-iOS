//
//  ViewController.swift
//  Latihan Audio Background
//
//  Created by Erlangga Anugrah Arifin on 19/09/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    private var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isPlaying(state: false)
        
        guard let url = Bundle.main.url(forResource: "PianoLoop", withExtension: "mp3") else {
              return
            }

        do {
              try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)

              // MARK: Kode ini untuk iOS 11 ke atas.
              player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                    
              // MARK: Kode ini untuk iOS 10 ke bawah.
              // player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)
                    
            } catch let error {
              print(error.localizedDescription)
            }
    }

    @IBAction func playMusic(_ sender: UIButton) {
        guard let audioPlayer = player else { return }
        audioPlayer.play()
        isPlaying(state: true)
    }
    
    
    @IBAction func stopMusic(_ sender: UIButton) {
        guard let audioPlayer = player else { return }
        audioPlayer.stop()
        isPlaying(state: false)
    }
    
    // Memperbaiki Status Tombol Play dan Stop
    private func isPlaying(state: Bool) {
      stopButton.isEnabled = state
      playButton.isEnabled = !state
    }
    
}

