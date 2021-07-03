//
//  CheckSplit.swift
//  whats the tip
//
//  Created by Nicholas McGinnis on 7/1/21.
//

import UIKit

class CheckSplit: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
		
	let vc = ViewController()
	let tipAmounts = ["15", "18", "20", "22", "0"]
	var tipAmount = 0
	var numberOfPeoplePickerData = [2]
	
	@IBOutlet weak var checkAmountTextLabel: UILabel!
	@IBOutlet weak var checkAmountLabel: UILabel!
	@IBOutlet weak var tipLabel: UILabel!
	@IBOutlet var tipPickerView: UISegmentedControl!
	@IBOutlet weak var numPeopleLabel: UILabel!
	@IBOutlet var numberOfPeoplePicker: UIPickerView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		peoplePicker()
		setup()
		print("check amount \(vc.checkAmount)")
	}
	
	func setup() {
		checkAmountTextLabel.text = "Check Amount:"
		checkAmountTextLabel.textColor = UIColor.white
//		checkAmountLabel.text = String(vc.checkAmount)
		checkAmountLabel.textColor = UIColor.white
		tipLabel.text = "Tip Amount:"
		tipLabel.textColor = UIColor.white
		tipPickerView = UISegmentedControl(items: tipAmounts)
		tipPickerView.addTarget(self, action: #selector(tipDidChange(_:)), for: .valueChanged)
		numPeopleLabel.text = "Split the check with:"
		numPeopleLabel.textColor = UIColor.white
		numberOfPeoplePicker.delegate = self
		numberOfPeoplePicker.dataSource = self
		numberOfPeoplePicker.setValue(UIColor.white, forKey: "textColor")
	}
	
	
	func numberOfComponents(in numberOfPeoplePicker: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ numberOfPeoplePicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return numberOfPeoplePickerData.count
	}
	
	func pickerView(_ numberOfPeoplePicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		let row = String("\(numberOfPeoplePickerData[row]) people")
		return row
	}
	
	func peoplePicker() {
		for i in 3..<101 {
			numberOfPeoplePickerData.append(i)
		}
	}
	
	@objc func tipDidChange(_ tipPickerView: UISegmentedControl) {
		switch tipPickerView.selectedSegmentIndex {
		case 0:
			tipAmount = 15
		case 1:
			tipAmount = 18
		case 2:
			tipAmount = 20
		case 3:
			tipAmount = 22
		default:
			tipAmount = 0
		}
	}
	
}
