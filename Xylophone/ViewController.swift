//
//  ViewController.swift
//  Xylophone
//
//  Created by Nhân Lê Nguyễn on 30/05/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBAction func keyPressed(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle
        playSound(soundName: buttonTitle!)
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
   
    
    var player: AVAudioPlayer?
    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else {return}
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        } catch let error {
            print(error.localizedDescription)
        }
    }


}

