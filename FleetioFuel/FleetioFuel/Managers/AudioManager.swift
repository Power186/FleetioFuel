//
//  AudioManager.swift
//  FleetioFuel
//
//  Created by Scott on 7/25/21.
//

import Foundation
import AVKit

public final class AudioManager {
    static let shared = AudioManager()
    
    private var audioPlayer = AVAudioPlayer()
    private init() {}
    
    func playSound(file: String, ext: String) -> Void {
        do {
            let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: file, ofType: ext) ?? "")
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let error {
            debugPrint("\(error.localizedDescription)")
        }
    }
    
}
