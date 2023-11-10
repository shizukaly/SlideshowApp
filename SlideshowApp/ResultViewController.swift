//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Shizuka  on 2023/11/10.
//

import UIKit

class ResultViewController: UIViewController {
    var image: UIImage?
    
    //詳細画像
    @IBOutlet weak var detailImageView: UIImageView!
    // 戻るボタン
    @IBOutlet weak var backButton: UIButton!
     
       
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.image = image //画像をimageviewに設定
                        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)//画面を閉じる
    }
    
}
