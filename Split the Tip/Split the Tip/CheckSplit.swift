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
	var tipAmount:Double = 0.0
	var checkAmountCS:Double = 0.0
	var checkTotal:Double = 0.0
	var numberOfPeoplePickerData = [2]
	var costPerPerson: Double = 0.0
	var numberOfPeople: Double = 0.0
	
	@IBOutlet weak var checkAmountTextLabel: UILabel!
	@IBOutlet weak var checkAmountInputField: UITextField! { didSet {checkAmountInputField?.addDoneToolBar()} }
	@IBOutlet weak var tipLabel: UILabel!
	@IBOutlet weak var numPeopleLabel: UILabel!
	@IBOutlet var numberOfPeoplePicker: UIPickerView!
	@IBOutlet weak var calculateButton: UIButton!
	@IBOutlet weak var totalSplitCostLabel: UILabel!
	@IBOutlet weak var segmentedControl: UISegmentedControl!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		peoplePicker()
		setup()
	}
	
	func setup() {
		checkAmountTextLabel.text = "$"
		checkAmountTextLabel.textColor = UIColor.white
		checkAmountInputField.placeholder = "Enter Check Amount"
		checkAmountInputField.textColor = UIColor.white
		checkAmountInputField.layer.borderWidth = 1
		checkAmountInputField.layer.borderColor = UIColor.white.cgColor
		checkAmountInputField.layer.cornerRadius = 15
		tipLabel.text = "Tip Amount:"
		tipLabel.textColor = UIColor.white
		numPeopleLabel.text = "Split the check with:"
		numPeopleLabel.textColor = UIColor.white
		numberOfPeoplePicker.delegate = self
		numberOfPeoplePicker.dataSource = self
		numberOfPeoplePicker.setValue(UIColor.white, forKey: "textColor")
		calculateButton.setTitle("Calculate Total", for: .normal)
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
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		numberOfPeople = Double(numberOfPeoplePickerData[row])
	}
	
	func peoplePicker() {
		for i in 3..<51 {
			numberOfPeoplePickerData.append(i)
		}
	}
	
	@IBAction func didTapCalculateButton(_ sender: Any) {
		calculateTotal()
	}
	
	func calculateTotal() {
		guard let check = Double((checkAmountInputField?.text)!) else { return	 }
		if tipAmount == 0.00 {
			checkTotal = check
		} else {
			checkTotal = Double(check * tipAmount)
		}
		costPerPerson = Double(checkTotal / numberOfPeople)
		print("\(numberOfPeople) of people")
		totalSplitCostLabel.text = String(format: "$%.2f", costPerPerson)
	}
	
	@IBAction func tipAmountChanged(_ sender: Any) {
		switch segmentedControl.selectedSegmentIndex {
		case 0:
			tipAmount = 1.15
			calculateTotal()
		case 1:
			tipAmount = 1.18
			calculateTotal()
		case 2:
			tipAmount = 1.20
			calculateTotal()
		case 3:
			tipAmount = 1.22
			calculateTotal()
		case 4:
			tipAmount = 0.00
			calculateTotal()
		default:
			break
		}
	}
	
		
}
