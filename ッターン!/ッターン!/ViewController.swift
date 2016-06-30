//
//  ViewController.swift
//  ッターン!
//
//  Created by 佐久間俊介 on 2016/06/29.
//  Copyright © 2016年 Shunsuke Sakuma. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
   
    var audioPlayer:AVAudioPlayer!
    
    
    @IBOutlet var button:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 再生するaudioファイルパスを取得
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("type", ofType: "mp3")!)
        
        
        // auido を再生するプレイヤーを作成する
        let audioError:NSError?=nil
        audioPlayer = try! AVAudioPlayer(contentsOfURL: audioPath)
        
        // エラーが起きたとき
        if let error = audioError {
            print("Error \(error.localizedDescription)")
        }
        
        
        

        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        
        
        try!AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try!AVAudioSession.sharedInstance().setActive(true)
        audioPlayer.play()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    
  
    // ボタンがタップされた時の処理
    @IBAction func buttonTapped(sender : AnyObject) {
//        let audioPlayerTaan:AVAudioPlayer!
        
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("taaan", ofType: "mp3")!)
        
         audioPlayer = try! AVAudioPlayer(contentsOfURL: audioPath)

        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        
//        if ( audioPlayer.playing ){
//            audioPlayer.stop()
//            
//            button.setTitle("Stop", forState: UIControlState.Normal)
//        }
//        else{
//            try!AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
//            try!AVAudioSession.sharedInstance().setActive(true)
//            audioPlayerTaan.play()
//            button.setTitle("Play", forState: UIControlState.Normal)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

