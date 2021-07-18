//
//  ViewController.swift
//  Scheduler
//
//  Created by Logeshwaran S on 18/07/21.
//

import UIKit

class ScheduleListController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	var events = [Event]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self
	}

	@IBAction func addNewEvent(sender: UIStoryboardSegue) {
		
		guard let createEventController = sender.source as? CreateEventController,
			  let createEvent = createEventController.event else {
			fatalError("Fail to load create eventcontroller")
		}
		
		events.insert(createEvent, at: 0)
		
		let indexPath = IndexPath(item: 0, section: 0)
		
		tableView.insertRows(at: [indexPath], with: .automatic)
		
	}

}

extension ScheduleListController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return events.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
		
		let eventValue = events[indexPath.row]
		cell.textLabel?.text = eventValue.name
		cell.detailTextLabel?.text = eventValue.date.description
		
		return cell
	}
	
}

