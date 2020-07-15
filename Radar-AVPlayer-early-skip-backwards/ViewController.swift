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
        "https://fr5-2-hls5-live.zahs.tv/HD_bbc1/master.m3u8?z32=ORUW2ZLTNBUWM5B5GM3DAMBGNVQXQ4TBORST2NJQGAZCM5LTMVZF62LEHUZDINJQHAYTQMBGMNZWSZB5GE3DEMKFIEYEGOCDIY2TAMJYGUWTMRJWGJAUGNKGIUYTCNBTGFBTSJTBOVSGS327MNXWIZLDOM6WCYLDFRSWCYZTEZUW42LUNFQWY4TBORST2MBGONUWOPLDGVRTCNBSMRSDCNRUMIYWCMDDGQ3TSMJVGU3WEZBYHEYTAY3DGETG22LOOJQXIZJ5GE2TAMA",
        "https://fr5-0-hls5-live.zahs.tv/HD_bbc2/master.m3u8?z32=ORUW2ZLTNBUWM5B5GM3DAMBGNVQXQ4TBORST2NJQGAZCM5LTMVZF62LEHUZDINJQHAYTQMBGMNZWSZB5GE3DEMKFHEZUMRRTIFBDCMCDGAWTGRRTGU2TSNZVIJBTOQRWHBCDEJTBOVSGS327MNXWIZLDOM6WCYLDFRSWCYZTEZUW42LUNFQWY4TBORST2MBGONUWOPLCMM4DCNZQGUZTCZRZMJSGIODFGYZTENZZG5SDMOBZHE4DAMTDHATG22LOOJQXIZJ5GE2TAMA"
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
