//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var secondsPassed = 0
    var timer: Timer? = nil
    var player: AVAudioPlayer!
    @IBOutlet weak var eggStatus: UILabel!
    @IBOutlet weak var eggProgess: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer?.invalidate()
        let totalTime = self.eggTimes[sender.titleLabel!.text!]!
        secondsPassed = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.secondsPassed < totalTime {
                self.secondsPassed += 1
                self.eggProgess.progress = Float(self.secondsPassed) / Float(totalTime)
            } else {
                self.eggProgess.progress = 1
                self.eggStatus.text = "Done"
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()
            }
        }
    }
}
