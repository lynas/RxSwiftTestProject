//
//  ViewController.swift
//  SwiftTestProject
//
//  Created by Md Sazzad Islam on 1/7/17.
//  Copyright © 2017 lynas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
	
	
	@IBOutlet weak var textField: UITextField!
	
	@IBOutlet weak var textLabel: UILabel!
	
	let disposeBag = DisposeBag()
	

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		let secuence = Observable.of(1,2,3)
		_ = secuence
			.map {
				number in
				number * 2
			}
			.subscribe{
			print($0)
		}
		
		_ = textField.rx.text.orEmpty.observeOn(MainScheduler.asyncInstance).bindTo(textLabel.rx.text).addDisposableTo(disposeBag)
	}



}

