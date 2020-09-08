//
//  ViewController.swift
//  Radar-AVPlayer-early-skip-backwards
//
//  Created by Vitalij Dadaschjanz on 15.07.20.
//  Copyright © 2020 Vitalij Dadaschjanz. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    var playerViewController = AVPlayerViewController()
    var playerItems: [AVPlayerItem] = []
    let urls = [
        "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
        "http://devstreaming.apple.com/videos/wwdc/2016/504m956dgg4hlw2uez9/504/hls_vod_mvp.m3u8"
    ]
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: urls[0]), let url2 = URL(string: urls[1]) else { return }
        let playerItem = AVPlayerItem(asset: AVAsset(url: url), automaticallyLoadedAssetKeys: ["playable"])
        let playerItem2 = AVPlayerItem(asset: AVAsset(url: url2), automaticallyLoadedAssetKeys: ["playable"])
        playerItems.append(playerItem)
        playerItems.append(playerItem2)

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(play))
        tapRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.upArrow.rawValue)]
        playerViewController.view.addGestureRecognizer(tapRecognizer)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(playerViewController, animated: false)
        play()
    }

    @objc func play() {
        if playerViewController.player == nil {
            playerViewController.player = AVPlayer(playerItem: playerItems[index])
        } else {
            playerViewController.player?.replaceCurrentItem(with: playerItems[index])
        }
        playerViewController.player!.play()
        index = index == 0 ? 1 : 0
    }
}
