//
//  CreateEventController.swift
//  Scheduler
//
//  Created by Logeshwaran S on 18/07/21.
//

import UIKit

class CreateEventController: UIViewController {

	@IBOutlet weak var eventNameText: UITextField!
	@IBOutlet weak var datePicker: UIDatePicker!
	
	// data object
	var event: Event? // default value nil
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		eventNameText.delegate = self
		
		event = Event(date: Date(), name: "default value")
    }

	@IBAction func didTapDatePicker(_ sender: UIDatePicker) {
		event?.date = sender.date
	}
	
}

extension CreateEventController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		// to update event name
		event?.name = textField.text ?? "no event name enter"
		return true
	}
}
