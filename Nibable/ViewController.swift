//
//  ViewController.swift
//  Nibable
//
//  Created by James Rochabrun on 10/20/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var loadingGridView: ProgressLoadingGridView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(ProgressLoadingGridView.initFromNib()!)
    }
}

