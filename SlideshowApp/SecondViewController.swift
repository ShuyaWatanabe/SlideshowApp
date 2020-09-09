//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by Shuya Watanabe on 2020/09/09.
//  Copyright © 2020 Shuya Watanabe. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    

    @IBOutlet weak var returnButtonLabel: UIButton!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
   
    var secondImage: UIImage! //遷移元の画像データを格納
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        secondImageView.image = secondImage
        returnButtonLabel.layer.cornerRadius = 5.0
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
