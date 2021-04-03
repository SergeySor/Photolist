//
//  ViewController.swift
//  Photolist
//
//  Created by Sergey Sorokin on 03.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var mainView: MainView {
        return view as! MainView
    }
    
    override func loadView() {
        view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

