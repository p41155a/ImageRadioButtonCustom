//
//  ViewController.swift
//  ImageRadioButtonCustom
//
//  Created by Yoojin Park on 2020/08/07.
//  Copyright © 2020 Yoojin Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btn1: RadioButton!
    @IBOutlet weak var btn2: RadioButton!
    @IBOutlet weak var btn3: RadioButton!
    @IBOutlet weak var btn4: RadioButton!
    
    var radioButtonController: RadioButtonController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRadioButton()
    }

    func setRadioButton() {
        let buttons: [RadioButton] = [btn1, btn2, btn3, btn4]
        radioButtonController = RadioButtonController()
        radioButtonController?.shouldLetDeSelect = true
        buttons.forEach {
            radioButtonController?.appendButton($0)
        }
        
    }
}

