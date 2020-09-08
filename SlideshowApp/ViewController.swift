//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Shuya Watanabe on 2020/09/08.
//  Copyright © 2020 Shuya Watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
       }
    
    
    var timer: Timer!
    
    var imageIndex = 0 // imagesのインデックス番号の変更
    
    let images = [UIImage(named: "Image1"), UIImage(named: "Image2"), UIImage(named: "Image3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = images[0]
        
    }
    
    @objc func startSlideShow(_ timer:Timer) { // selectorで指定された関数　「次へ」ボタンと同じ仕様
        if imageIndex == 2 { //　インデックス番号が0,1の場合は+1 2の場合は0に戻す
                   imageIndex = 0
               } else {
                   imageIndex += 1
               }
               
               imageView.image = images[imageIndex]
    }

    @IBOutlet weak var backButtonLabel: UIButton! // 「戻る」ボタンのラベル
    @IBAction func backButton(_ sender: Any) {
        if imageIndex == 0 { // インデックス番号が2,1の場合は-1　0の場合は2に戻す
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        
        imageView.image = images[imageIndex]
        
    }
    
    @IBOutlet weak var nextButtonLabel: UIButton! //　「次へ」ボタンのラベル
    @IBAction func nextButton(_ sender: Any) {
        if imageIndex == 2 { //　インデックス番号が0,1の場合は+1 2の場合は0に戻す
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        
        imageView.image = images[imageIndex]
    }
    
    @IBOutlet weak var slideshowButtonLabel: UIButton! //　「再生/停止」ボタンのラベル
    
    @IBAction func slideshowButton(_ sender: Any) {
        
        if self.timer == nil { //　timerがnilの場合、scheduledTimerを開始し、2秒毎にstartSlideShowを更新　ラベルを停止に変更
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(startSlideShow(_:)), userInfo: nil, repeats: true )
            
            self.slideshowButtonLabel.setTitle("停止", for: .normal)
            self.backButtonLabel.isHidden = true
            self.nextButtonLabel.isHidden = true
            
        } else { //　timerが作動している場合、それを停止しラベルを再生に変更
            self.timer.invalidate()
            self.timer = nil
            self.slideshowButtonLabel.setTitle("再生", for: .normal)
            self.backButtonLabel.isHidden = false
            self.nextButtonLabel.isHidden = false
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        
    }
}

