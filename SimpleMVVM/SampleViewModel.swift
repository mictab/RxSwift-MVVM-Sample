//
//  SampleViewModel.swift
//  SimpleMVVM
//
//  Created by Michel Tabari on 2/12/17.
//  Copyright © 2017 Michel Tabari. All rights reserved.
//
import RxSwift

struct SampleViewModel {
    var textFieldContent = Variable<String>("")
    var isValidObservable: Observable<(Bool, Bool)>!
    
    init() {
        setup()
    }
    
    mutating func setup() {
        isValidObservable = textFieldContent.asObservable().map {
            content in
            let messageShouldShow = content.characters.count >= 3
            return (content.characters.count >= 3, messageShouldShow)
        }
    }
}
