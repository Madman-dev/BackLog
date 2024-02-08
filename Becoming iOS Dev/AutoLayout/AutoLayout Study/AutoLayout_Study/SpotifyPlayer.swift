//
//  SpotifyPlayer.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 2023/09/24.
//

import UIKit

class SpotifyPlayer: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        let albumImage = makeImageView(named: "rush")
        view.addSubview(albumImage)
        
        NSLayoutConstraint.activate([
            albumImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            albumImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            /// leading trailing을 하게 되면 이미지 크기가 끝까지 커지지 않는다. > 초기값이 220 * 220.
//            albumImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            albumImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            /// 해결 방법1 - width값을 기기 기준으로 두어 저절로 크기를 키울 수 있도록 처리
            albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor, multiplier: 1),
            albumImage.widthAnchor.constraint(equalToConstant: view.bounds.width)
        ])
        
        let trackLabel = makeTrackLabel(withText: "Tom Sawyer")
        let albumLabel = makeAlbumLabel(withText: "Rush Moving Pictures (2011 Remaster)")
        
        [trackLabel, albumLabel].forEach{ view.addSubview($0) }
        NSLayoutConstraint.activate([
            trackLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 8),
            trackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            trackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            trackLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            albumLabel.topAnchor.constraint(equalTo: trackLabel.bottomAnchor, constant: 8),
//            albumLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            albumLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            albumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let playButton = makePlayButton()
        let previewStartLabel = makePreviewLabel(withText: "0:00")
        let previewEndLabel = makePreviewLabel(withText: "0:30")
        let progressView = makeProgressView()
        
        [playButton, previewStartLabel, previewEndLabel, progressView].forEach{ view.addSubview($0) }
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 8),
            playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            playButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            playButton.widthAnchor.constraint(equalToConstant: buttonHeight),
            
            previewStartLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            previewStartLabel.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 8),
            
            progressView.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: previewStartLabel.trailingAnchor, constant: 8),
            
            previewEndLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            previewEndLabel.leadingAnchor.constraint(equalTo: progressView.trailingAnchor, constant: 8),
            previewEndLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
        let spotifyButton = makeSpotifyButton(withText: "PLAY ON SPOTIFY")
        view.addSubview(spotifyButton)
        
        NSLayoutConstraint.activate([
            spotifyButton.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 32),
            spotifyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            spotifyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            spotifyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

}
