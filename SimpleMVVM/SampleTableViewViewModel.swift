//
//  SampleTableViewViewModel.swift
//  SimpleMVVM
//
//  Created by Michel Tabari on 2/12/17.
//  Copyright © 2017 Michel Tabari. All rights reserved.
//

import RxSwift

struct SampleTableViewViewModel {
    let sampleData = ["A", "B", "C", "D"]
    
    func getSampleData() -> Observable<[String]> {
        return Observable.just(sampleData)
    }
}
