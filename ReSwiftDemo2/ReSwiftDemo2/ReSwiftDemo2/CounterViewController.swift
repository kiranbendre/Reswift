//
//  ViewController.swift
//  ReSwiftDemo2
//
//  Created by Iphone XR on 13/12/22.
//

import UIKit
import ReSwift

class CounterViewController: UIViewController,StoreSubscriber{
    //step5 - create counter label
    let counterLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        CounterLbl()
        Increasebtn()
        Decreasebtn()
    }
    //MARK:- Step8- subsribe here to get informed of every changes that happens in the current state
    override func viewWillAppear(_ animated: Bool) {
            mainStore.subscribe(self)
        }

        override func viewWillDisappear(_ animated: Bool) {
            mainStore.unsubscribe(self)
        }
       //MARK:- Step9- when u want to upadate changes that happens in the reducer.
        func newState(state: AppState) {
            counterLabel.text = "\(state.counter)"
        }
   
    func CounterLbl(){
       //let counterLabel = UILabel()
        counterLabel.text = "counter lbl"
        counterLabel.numberOfLines = 0
        //titleLabel.frame = CGRect(x: 125, y: 125, width: 150, height: 30)
        counterLabel.textAlignment = .center
        counterLabel.sizeToFit()
        counterLabel.backgroundColor = UIColor.gray
        self.view.addSubview(counterLabel)
        //Add Constraint to Label
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: counterLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 150).isActive = true
        NSLayoutConstraint(item: counterLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: counterLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
    }
    //MARK:- STEP6- Create two button and their action
    func Increasebtn(){
        let myFirstButton = UIButton()
        myFirstButton.setTitle("IncreaseButton", for: .normal)
        myFirstButton.setTitleColor(UIColor.black, for: [])
        myFirstButton.addTarget(self,action: #selector(increaseButtonTapped),
                           for: .touchUpInside)
        myFirstButton.backgroundColor = UIColor.gray
        myFirstButton.center = view.center
        self.view.addSubview(myFirstButton)
        //Add Constraint to Button
        myFirstButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: myFirstButton, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 250).isActive = true
        NSLayoutConstraint(item: myFirstButton, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 15.0).isActive = true
        NSLayoutConstraint(item: myFirstButton, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -15.0).isActive = true
        
    }
    //MARK:- Step7- call these action here
    @objc func increaseButtonTapped(_ sender: UIButton) {
        //print("increaseButtonTapped")
            mainStore.dispatch(
                CounterActionIncrease()
            )
        }
    
    func Decreasebtn(){
        let mySecondButton = UIButton()
        mySecondButton.setTitle("DecreaseButton", for: .normal)
        mySecondButton.setTitleColor(UIColor.black, for: [])
        mySecondButton.addTarget(self,action: #selector(decreaseButtonTapped),
                           for: .touchUpInside)
        mySecondButton.backgroundColor = UIColor.gray
        mySecondButton.center = view.center
        self.view.addSubview(mySecondButton)
        //Add Constraint to Button
        mySecondButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: mySecondButton, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 300).isActive = true
        NSLayoutConstraint(item: mySecondButton, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 15.0).isActive = true
        NSLayoutConstraint(item: mySecondButton, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -15.0).isActive = true
    }
    @objc func decreaseButtonTapped(_ sender: UIButton) {
       // print("decreaseButtonTapped")
            mainStore.dispatch(
                CounterActionDecrease()
            )
        }
}

