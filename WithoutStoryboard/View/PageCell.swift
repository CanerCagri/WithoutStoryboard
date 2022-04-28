//
//  PageCell.swift
//  WithoutStoryboard
//
//  Created by Caner Çağrı on 28.04.2022.
//

import UIKit

class PageCell : UICollectionViewCell {
    
    var page: PageModel? {
        didSet {
            dogImageView.image = UIImage(named: page!.imageName)
         
            let attributedText = NSMutableAttributedString(string: page!.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: page!.bodyText, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    var dogImageView : UIImageView = {
        let image = UIImage(named: "dog")
        let imageView = UIImageView(image: image)
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = 32
        
        // This enables autolayout for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var descriptionTextView : UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today for supporting Dog Shelters!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nWe are waiting you. Dont wait any longer. We hope to see you in our community soon.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        
        let topImageContainerView = UIView()
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topImageContainerView)
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(dogImageView)
        dogImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        dogImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        dogImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.4).isActive = true
        dogImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor ).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
