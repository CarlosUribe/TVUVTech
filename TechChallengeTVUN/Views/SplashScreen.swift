//
//  SplashScreen.swift
//  TechChallengeTVUN
//
//  Created by Carlos Uribe on 10/08/23.
//

import UIKit
import AVKit

class SplashScreen: UIViewController {
    let playerController = AVPlayerViewController()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        playVideo()
    }

    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "9x16_ViX_Intro", ofType:"mp4") else { return }

        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController.showsPlaybackControls = false
        playerController.player = player
        playerController.videoGravity = .resizeAspectFill
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        self.view.layer.addSublayer(playerLayer)
        player.play()
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player?.currentItem)
    }

    @objc func playerDidFinishPlaying(note: NSNotification) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let main = (storyboard.instantiateViewController(withIdentifier: "MainViewIdentifier") as? MainView)!
        self.navigationController?.pushViewController(main, animated: true)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
