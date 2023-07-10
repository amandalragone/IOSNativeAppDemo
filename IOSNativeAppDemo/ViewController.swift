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
        
        //Example in ERN Guide shows code like the one below, but that's not working here.
//        let listenerProcessor = EventListenerProcessor(
//            eventName: "endeavorminiapp.onButtonPress",
//            eventPayloadClass: ElectrodeBridgeEvent.self,
//            eventListener: { payload in
//                print("payload is ", payload ?? "no payload")
//            })
//        listenerProcessor.execute()
        
        // This works!
        ElectrodeBridgeHolder.addEventListener(withName: "endeavorminiapp.onButtonPress", eventListner: { [weak self] payload in
            let alert = UIAlertController(title: "Button Clicked", message: ((payload as? NSDictionary)?.value(forKey: "input") as? String) ?? "NO PAYLOAD!!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(alertAction)
            self?.present(alert, animated: false)
        })
    }
}

