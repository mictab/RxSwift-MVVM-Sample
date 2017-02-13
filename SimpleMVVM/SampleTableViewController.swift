//
//  SampleTableViewController.swift
//  SimpleMVVM
//
//  Created by Michel Tabari on 2/12/17.
//  Copyright © 2017 Michel Tabari. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class SampleTableViewController: UIViewController {
    
    // MARK : - Properties
    @IBOutlet weak var tableView: UITableView!
    
    let disposebag = DisposeBag()
    let viewModel = SampleTableViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel
            .getSampleData()
            .bindTo(tableView.rx.items) {
            tableView, row, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell", for: IndexPath(item: row, section: 0))
            cell.textLabel?.text = item
            return cell
        }
        .addDisposableTo(disposebag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
