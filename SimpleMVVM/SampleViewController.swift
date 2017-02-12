//
//  SampleViewController.swift
//  SimpleMVVM
//
//  Created by Michel Tabari on 2/12/17.
//  Copyright © 2017 Michel Tabari. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class SampleViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var isValidButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var smileyImageView: UIImageView!
    
    // MARK: - View Model and dispose bag
    var sampleViewModel = SampleViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func setupRx() {
        inputTextField
            .rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .filter { !$0.isEmpty }
            .debounce(0.2, scheduler: MainScheduler.instance)
            .bindTo(sampleViewModel.textFieldContent)
            .addDisposableTo(disposeBag)
        
        sampleViewModel
            .isValidObservable
            .subscribe(onNext: {
                [weak self] (valid, messageShow) in
                self?.isValidButton.isEnabled = valid
                self?.messageLabel.isHidden = !messageShow
                
                if valid {
                    self?.smileyImageView.image = #imageLiteral(resourceName: "Happy")
                } else {
                    self?.smileyImageView.image = #imageLiteral(resourceName: "Sad")
                }
            })
            .addDisposableTo(disposeBag)
    }
}
