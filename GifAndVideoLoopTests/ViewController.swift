//
//  ViewController.swift
//  GifAndVideoLoopTests
//
//  Created by Zak Barlow on 15/09/2020.
//  Copyright © 2020 Zak Barlow. All rights reserved.
//

import UIKit
import SnapKit

import FLAnimatedImage
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    var gifView = FLAnimatedImageView()
    
    var videoView =  UIView()
    var player: AVQueuePlayer!
    var playerLayer: AVPlayerLayer!
    var playerItem: AVPlayerItem!
    var playerLooper: AVPlayerLooper!
    
    //var avpController = AVPlayerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = UIColor(red: 0.4, green: 0.1, blue: 0.4, alpha: 1)
        
        // Gif view

        let urlString = "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif"
        let url = URL(string: urlString)!
        let imageData = try? Data(contentsOf: url)
        let animatedImage = FLAnimatedImage(animatedGIFData: imageData)
        gifView.animatedImage = animatedImage
        
        view.addSubview(gifView)
        
        gifView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(250)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-200)
        }
        
        view.addSubview(videoView)
        
        videoView.backgroundColor = .systemPink
        
        videoView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(250)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(100)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupVideoLoop()
    }
    
    func setupVideoLoop() {
        // Video view
        let videoUrlString = "https://static.videezy.com/system/resources/previews/000/035/209/original/light_garden_field.mp4" //"https://www.html5videoplayer.net/videos/toystory.mp4"
        guard let videoUrl = URL(string: videoUrlString) else { return }
        
        //        videoView.backgroundColor = .red
        
        //        player = AVQueuePlayer()
        //        playerLayer = AVPlayerLayer(player: player)
        //        playerItem = AVPlayerItem(url: videoUrl)
        //        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        //        player.play()
        
        playerItem = AVPlayerItem(url: videoUrl)
        player = AVQueuePlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: player)
        
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        
        //        playerLayer.frame = videoView.bounds
        //        playerLayer.videoGravity = .resizeAspectFill
        //
        //        // Add the playerLayer to a UIView.layer
        //        videoView.layer.addSublayer(playerLayer)
        
        //        view.layer.addSublayer(playerLayer)
        //        playerLayer.frame = videoView.frame
        
        //        playerLayer.frame = videoView.bounds
        //        videoView.layer.addSublayer(playerLayer)
        
        
        let avPlayerController = AVPlayerViewController()
        avPlayerController.player = player
        avPlayerController.view.frame = videoView.frame//CGRect(x: 0, y: 0.5*UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: 250) //videoView.bounds
        
        //  hide show control
        avPlayerController.showsPlaybackControls = false
        // play video
        
        //        avPlayerController.player?.play()
        self.addChild(avPlayerController)
        self.view.addSubview(avPlayerController.view)
        
        
        player.play()
    }
}

