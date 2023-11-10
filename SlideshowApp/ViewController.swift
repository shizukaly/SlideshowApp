//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Shizuka  on 2023/11/03.
//

import UIKit

class ViewController: UIViewController {
    var images = [UIImage(named: "image1"), UIImage(named: "image2"), UIImage(named: "image3")]
    var currentIndex = 0
    var slideShowTimer: Timer?
    
    //画像
    @IBOutlet weak var imageView: UIImageView!
    //戻るボタン
    @IBOutlet weak var returnButton: UIButton!
    //再生・停止ボタン
    @IBOutlet weak var StartStopButton: UIButton!
    //進むボタン
    @IBOutlet weak var forwardButton: UIButton!
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = images[currentIndex]
        updateButtons(isSlideshowActive: false)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.isUserInteractionEnabled = true
        }
    
    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "showImageDetail", sender: nil)
    }
    
        //戻るを実行
    @IBAction func returnButton(_ sender: UIButton) {
        currentIndex = (currentIndex - 1 + images.count) % images.count
        imageView.image = images[currentIndex]
    }
        //進むを実行
    @IBAction func forwardButton(_ sender: UIButton) {
        currentIndex = (currentIndex + 1) % images.count
        imageView.image = images[currentIndex]
    }
       //再生停止を実行
    @IBAction func StartStopButton(_ sender: UIButton) {
        if slideShowTimer == nil {
            startSlideShow()
            sender.setTitle("停止", for: .normal)
            updateButtons(isSlideshowActive: true)
        } else {
            stopSlideShow()
            sender.setTitle("再生", for: .normal)
            updateButtons(isSlideshowActive: false)
        }
    }
    
    //定義
    func startSlideShow() {
          slideShowTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(showNextImage), userInfo: nil, repeats: true)
      }

      func stopSlideShow() {
          slideShowTimer?.invalidate()
          slideShowTimer = nil
      }

      @objc func showNextImage() {
          currentIndex = (currentIndex + 1) % images.count
          imageView.image = images[currentIndex]
      }

      func updateButtons(isSlideshowActive: Bool) {
          forwardButton.isEnabled = !isSlideshowActive
          returnButton.isEnabled = !isSlideshowActive
      }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImageDetail" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.image = images[currentIndex]  // 選択された画像を渡す
        }
    }
    


    
  }
   
