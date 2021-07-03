//
//  ViewController.swift
//  whats the tip
//
//  Created by Nicholas McGinnis on 6/4/21.
//

import UIKit

class ViewController: UIViewController {
	
	let cs = CheckSplit()
	
	var fifteenTip:Double = 0.0
	var fifteenTotal:Double = 0.0
	var eighteenTip:Double = 0.0
	var eighteenTotal:Double = 0.0
	var twentyTip:Double = 0.0
	var twentyTotal:Double = 0.0
	var twentyTwoTip:Double = 0.0
	var twentyTwoTotal:Double = 0.0
	var checkAmount: Double = 0.0
	
	@IBOutlet weak var dollarSign: UILabel!
	@IBOutlet weak var checkAmountInputField: UITextField! { didSet {checkAmountInputField?.addDoneToolBar()} }
	@IBOutlet weak var calcTipButton: UIButton!
	@IBOutlet weak var splitCheckButton: UIButton!
	@IBOutlet weak var tipPercentLabel: UILabel!
	@IBOutlet weak var fifteenPercentLabel: UILabel!
	@IBOutlet weak var eightteenPercentLabel: UILabel!
	@IBOutlet weak var twentyPercentLabel: UILabel!
	@IBOutlet weak var twentyTwoPercentLabel: UILabel!
	@IBOutlet weak var tipAmountLabel: UILabel!
	@IBOutlet weak var fifteenPercentTipLabel: UILabel!
	@IBOutlet weak var eighteenPercentTipLabel: UILabel!
	@IBOutlet weak var twentyPercentTipLabel: UILabel!
	@IBOutlet weak var twentyTwoPercentTipLabel: UILabel!
	@IBOutlet weak var totalBillLabel: UILabel!
	@IBOutlet weak var totalBillFifteenLabel: UILabel!
	@IBOutlet weak var totalBillEighteenLabel: UILabel!
	@IBOutlet weak var totalBillTwentyLabel: UILabel!
	@IBOutlet weak var totalBillTwentyTwoLabel: UILabel!
	@IBOutlet weak var viewOurAppsBtn: UIButton!
	

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		setUpView()
	}
	
	func setUpView() {
		dollarSign.textColor = UIColor.white
		calcTipButton.setTitle("What's The Tip", for: .normal)
		calcTipButton.layer.borderWidth = 1.0
		calcTipButton.layer.borderColor = UIColor.white.cgColor
		calcTipButton.layer.cornerRadius = 15
		splitCheckButton.setTitle("Split The Check", for: .normal)
		splitCheckButton.layer.borderWidth = 1.0
		splitCheckButton.layer.borderColor = UIColor.white.cgColor
		splitCheckButton.layer.cornerRadius = 15
		checkAmountInputField.textColor = UIColor.white
		checkAmountInputField.layer.borderWidth = 1.0
		checkAmountInputField.layer.borderColor = UIColor.white.cgColor
		checkAmountInputField.layer.cornerRadius = 15
		tipPercentLabel.text = "%"
		fifteenPercentLabel.text = "15%"
		eightteenPercentLabel.text = "18%"
		twentyPercentLabel.text = "20%"
		twentyTwoPercentLabel.text = "22%"
		tipAmountLabel.text = "Tip Amount"
		fifteenPercentTipLabel.text = String(format: "$%.2f", fifteenTip)
		totalBillFifteenLabel.text = String(format: "$%.2f", fifteenTotal)
		eighteenPercentTipLabel.text = String(format: "$%.2f", eighteenTip)
		totalBillEighteenLabel.text = String(format: "$%.2f", eighteenTotal)
		twentyPercentTipLabel.text = String(format: "$%.2f", twentyTip)
		totalBillTwentyLabel.text = String(format: "$%.2f", twentyTotal)
		twentyTwoPercentTipLabel.text = String(format: "$%.2f", twentyTwoTip)
		totalBillTwentyTwoLabel.text = String(format: "$%.2f", twentyTwoTotal)
		totalBillLabel.text = "Total"
		viewOurAppsBtn.setTitle("See Our Other Apps", for: .normal)
	}
	
	func calculate() {
		guard let check = Double((checkAmountInputField?.text)!) else { return }
		checkAmount = check
		fifteenTip = Double(check * 0.15)
		fifteenTotal = Double(check * 1.15)
		eighteenTip = Double(check * 0.18)
		eighteenTotal = Double(check * 1.18)
		twentyTip = Double(check * 0.20)
		twentyTotal = Double(check * 1.20)
		twentyTwoTip = Double(check * 0.22)
		twentyTwoTotal = Double(check * 1.22)
	}
	
	func tipTotalLabels() {
		fifteenPercentTipLabel.text = String(format: "$%.2f", fifteenTip)
		eighteenPercentTipLabel.text = String(format: "$%.2f", eighteenTip)
		twentyPercentTipLabel.text = String(format: "$%.2f", twentyTip)
		twentyTwoPercentTipLabel.text = String(format: "$%.2f", twentyTwoTip)
		totalBillFifteenLabel.text = String(format: "$%.2f", fifteenTotal)
		totalBillEighteenLabel.text = String(format: "$%.2f", eighteenTotal)
		totalBillTwentyLabel.text = String(format: "$%.2f", twentyTotal)
		totalBillTwentyTwoLabel.text = String(format: "$%.2f", twentyTwoTotal)
	}

	@IBAction func didTapCalculateBtn(_ sender: Any) {
		checkAmountInputField.resignFirstResponder()
		calculate()
		tipTotalLabels()
	}
	
	@IBAction func didTapSplitBtn(_ sender: Any) {
		calculate()
		tipTotalLabels()
		cs.checkAmountLabel.text = checkAmountInputField.text
	}
		
	@IBAction func didTapOtherAppsBtn(_ sender: Any) {
		UIApplication.shared.open(URL(string: "https://apps.apple.com/us/developer/sinnig-media-llc/id1541775279")!)
	}
	
}

extension UITextField {
	func addDoneToolBar(onDone: (target: Any, action: Selector)? = nil) {
		let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
		
		let toolbar: UIToolbar = UIToolbar()
		toolbar.barStyle = .default
		toolbar.items = [
			UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
			UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
		]
		toolbar.sizeToFit()
		
		self.inputAccessoryView = toolbar
	}
	@objc func doneButtonTapped() {	self.resignFirstResponder() }
}
