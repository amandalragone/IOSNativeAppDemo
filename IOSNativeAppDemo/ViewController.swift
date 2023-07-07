//
//  ViewController.swift
//  IOSNativeAppDemo
//
//  Created by Amanda Lamberti Ragone on 6/27/23.
//

import UIKit
import ElectrodeContainer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        renderView()
        renderMiniApp()
    }

    func renderView() {
        let label = UILabel()
        label.text = "Hello World!"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func renderMiniApp() {
        
        let miniAppProps = ["buttonText": "See output", "buttonColor": "#ff0092"];
        let newVC = ElectrodeReactNative.sharedInstance().miniApp(withName: "endeavorminiapp", properties: miniAppProps, overlay: true, sizeFlexibility: 1, delegate: nil)
                
        newVC.view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)

        self.view.addSubview(newVC.view)

        newVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newVC.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            newVC.view.heightAnchor.constraint(equalToConstant: view.bounds.height / 3),

            newVC.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        view.bringSubviewToFront(newVC.view)
    }
}

