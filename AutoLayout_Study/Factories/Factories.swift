//
//  Factories.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 2023/09/24.
//

import UIKit

let buttonHeight: CGFloat = 40

func makeImageView(named: String) -> UIImageView {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFit
    view.image = UIImage(named: named)

    // By making the image hug itself a little bit less and less resistant to being compressed
    // we allow the image to stretch and grow as required
    view.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical)
    view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)

    return view
}

func makeTrackLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 18)

    return label
}

func makeAlbumLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = .lightGray

    return label
}

func makePlayButton() -> UIButton {
    let image = UIImage(named: "play") as UIImage?

    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(image, for: .normal)
    button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)

    return button
}

func makePreviewLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 10)

    return label
}

func makeProgressView() -> UIProgressView {
    let progressView = UIProgressView(progressViewStyle: .default)
    progressView.translatesAutoresizingMaskIntoConstraints = false
    progressView.tintColor = .gray

    return progressView
}

func makeSpotifyButton(withText title: String) -> UIButton {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    /// 방법1
    var config = UIButton.Configuration.filled()
    config.baseBackgroundColor = .spotifyGreen
    config.cornerStyle = .capsule
    config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: buttonHeight, bottom: 10, trailing: buttonHeight)
    button.configuration = config

    /// 방법2 > deprecated ContentEdgeInsets
//    button.titleLabel?.minimumScaleFactor = 0.5
//    button.titleLabel?.adjustsFontSizeToFitWidth = true
//    button.backgroundColor = .spotifyGreen
//    button.setTitleColor(.white, for: .normal)
//    button.layer.cornerRadius = buttonHeight / 2
//    button.contentEdgeInsets = UIEdgeInsets(top: 10, left: buttonHeight, bottom: 10, right: buttonHeight)

    let attributedText = NSMutableAttributedString(string: title, attributes: [
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
        NSAttributedString.Key.foregroundColor: UIColor.white,
        // giving value inbetween text
        NSAttributedString.Key.kern: 1
        ])

    button.setAttributedTitle(attributedText, for: .normal) // Note how not button.setTitle()!!

    return button
}

extension UIColor {
    static let spotifyGreen = UIColor(red: 28/255, green: 184/255, blue: 89/255, alpha: 1)
}


