//
//  TapeViewController.swift
//  Coursework1
//
//  Created by Burak Gunerhanal on 21/02/2017.
//  Copyright © 2017 Burak Gunerhanal. All rights reserved.
//

import Foundation
import UIKit

class TapeViewController : UIViewController{

    @IBOutlet weak var tapeView: UITextView!
    
    var receivedTape = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for line in receivedTape{
            tapeView.text = tapeView.text + line + "\r\n"
        }
    }  
}
