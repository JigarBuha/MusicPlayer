//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Apple on 20/09/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
   var AudioPlayer = AVAudioPlayer()
   
    @IBOutlet weak var MusicSlider: UISlider!
    @IBAction func MusicSliderAction(_ sender: Any) {
        AudioPlayer.stop()
        AudioPlayer.currentTime = TimeInterval(MusicSlider.value)
        AudioPlayer.prepareToPlay()
        AudioPlayer.play()
    }
    @IBAction func VolumeSliderAction(_ sender: Any) {
        AudioPlayer.volume = VolumeSlider.value
    }
    @IBOutlet weak var VolumeSlider: UISlider!
    
    @IBAction func BtnPlay(_ sender: Any) {

        if(AudioPlayer.isPlaying == true)
        {
            AudioPlayer.pause()
        }else{
            AudioPlayer.play()
            MusicSlider.maximumValue = Float(AudioPlayer.duration)
        }
        
    }
   
    @IBAction func BtnForword(_ sender: Any) {
    }
    @IBAction func BtnBackForword(_ sender: Any) {
    }
    
    @IBAction func BtnVolumeUp(_ sender: Any) {
        AudioPlayer.volume = VolumeSlider.maximumValue
    }
    @IBAction func BtnVolumeDown(_ sender: Any) {
        AudioPlayer.volume = VolumeSlider.minimumValue
    }
    @IBAction func BtnStop(_ sender: Any) {
        AudioPlayer.stop()
        AudioPlayer.currentTime = 0
    }
    @IBAction func BtnPause(_ sender: Any) {
        AudioPlayer.pause()
    }
    
    @IBOutlet weak var StartTime: UILabel!
    @IBOutlet weak var EndTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Gadar", ofType: "mp3")!)
           AudioPlayer = try AVAudioPlayer(contentsOf: url)
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
           AudioPlayer.prepareToPlay()
            AudioPlayer.volume = 20
            StartTime.text = "\(AudioPlayer.currentTime)"
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(Timer) in self.StartTime.text = "\(round(self.AudioPlayer.currentTime * 10)/10)"})
        }catch let error{
            NSLog(error.localizedDescription)
        }
    }
    @objc func updateSlider(){
        MusicSlider.value = Float(AudioPlayer.currentTime)
    }
   
}


