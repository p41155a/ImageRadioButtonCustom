//
//  TDNARadioButton.swift
//  ImageRadioButtonCustom
//
//  Created by Yoojin Park on 2020/08/07.
//  Copyright © 2020 Yoojin Park. All rights reserved.
//

import UIKit
import SnapKit

class RadioButton: UIButton {
    
    var radioButton: UIImageView!
    var buttonImageView: UIImageView!
    var buttonTitle: VerticalAlignLabel!
    
    override var isSelected: Bool  {
        didSet {
            buttonImageView.layer.borderWidth
                = isSelected ? 2 : 1
            buttonImageView.layer.borderColor = isSelected ? #colorLiteral(red: 0.1180000007, green: 0.7570000291, blue: 0.9409999847, alpha: 1) : UIColor.gray.cgColor
            radioButton.image = self.isSelected ? #imageLiteral(resourceName: "btnRadioSelected.pdf") : #imageLiteral(resourceName: "btnRadioUnselected.pdf")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadioButtonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setRadioButtonInit()
    }
    
    private func setRadioButtonInit() {
        
        setTitle(nil, for: .normal)
        
        buttonImageView = UIImageView()
        
        buttonImageView.layer.borderWidth = self.isSelected ? 2 : 1
        buttonImageView.layer.borderColor = isSelected ? #colorLiteral(red: 0.1180000007, green: 0.7570000291, blue: 0.9409999847, alpha: 1) : UIColor.gray.cgColor
        buttonImageView.image = #imageLiteral(resourceName: "imgVote1.png")
        buttonImageView.contentMode = .scaleAspectFit
        buttonImageView.layer.cornerRadius = 6
        
        addSubview(buttonImageView)
        buttonImageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.height.equalTo(self.snp.width)
        }
        
        radioButton = UIImageView()
        radioButton.image = self.isSelected ? #imageLiteral(resourceName: "btnRadioSelected.pdf") : #imageLiteral(resourceName: "btnRadioUnselected.pdf")

        addSubview(radioButton)
        radioButton.snp.makeConstraints { maker in
            maker.top.equalTo(buttonImageView.snp.bottom).offset(4)
            maker.leading.equalToSuperview()
            maker.width.equalTo(32)
            maker.height.equalTo(32)
        }

        buttonTitle = VerticalAlignLabel()
        buttonTitle.text = "짜왕"
        buttonTitle.numberOfLines = 0

        addSubview(buttonTitle)
        buttonTitle.snp.makeConstraints { maker in
            maker.leading.equalTo(radioButton.snp.trailing).offset(4)
            maker.trailing.equalToSuperview()
            maker.top.equalTo(buttonImageView.snp.bottom).offset(11)
            maker.bottom.equalToSuperview().offset(-6)
        }
    }
    
    func setButtonImage(_ image: UIImage) {
        buttonImageView.image = image
    }

    func setButtonTitle(_ title: String) {
        buttonTitle.text = title
    }
}

class RadioButtonController: NSObject {
    var buttons = [UIButton]()
    var shouldLetDeSelect = false
    var currentSelectedButton: UIButton? = nil
    
    init(buttons: UIButton...) {
        super.init()
        for button in buttons {
            button.addTarget(self, action: #selector(RadioButtonController.pressed(_:)), for: .touchUpInside)
            currentSelectedButton = button.isSelected ? button : currentSelectedButton
        }
        self.buttons = buttons
    }
    
    override init() {
        super.init()
    }
    
    @objc func pressed(_ sender: UIButton) {
        for aButton in buttons {
            aButton.isSelected = false
        }
        sender.isSelected = true
        currentSelectedButton = sender
    }
    
    func setButton(_ sender: UIButton) {
        for aButton in buttons {
            aButton.isSelected = false
        }
        sender.isSelected = true
        currentSelectedButton = sender
    }
    
    func appendButton(_ button: UIButton) {
        button.addTarget(self, action: #selector(RadioButtonController.pressed(_:)), for: .touchUpInside)
        currentSelectedButton = button.isSelected ? button : currentSelectedButton
        self.buttons.append(button)
    }
}
