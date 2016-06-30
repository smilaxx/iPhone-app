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
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("kei_voice_008_1", ofType: "mp3")!)
        
        // auido を再生するプレイヤーを作成する
        var audioError:NSError?
        audioPlayer = try! AVAudioPlayer(contentsOfURL: audioPath)
        
        // エラーが起きたとき
        if let error = audioError {
            print("Error \(error.localizedDescription)")
        }
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    // ボタンがタップされた時の処理
    @IBAction func buttonTapped(sender : AnyObject) {
        if ( audioPlayer.playing ){
            audioPlayer.stop()
            button.setTitle("Stop", forState: UIControlState.Normal)
        }
        else{
            audioPlayer.play()
            button.setTitle("Play", forState: UIControlState.Normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

