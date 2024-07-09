//
//  DetailViewController.swift
//  ShowrunnerNew
//
//  Created by Николай Гринько on 17.06.2024.
//

import UIKit

class DetailViewController: UIViewController {

   
    
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var ratingLabel: UILabel!
	@IBOutlet weak var networkLabel: UILabel!
	@IBOutlet weak var languageLabel: UILabel!
	@IBOutlet weak var genresLabel: UILabel!
	@IBOutlet weak var descriptionTextView: UITextView!
	@IBOutlet weak var imageView: UIImageView!
	
	var show: Show!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		guard show != nil else {
			print("!!! show is nil in DetailsViewController should NEVER happen!")
			return
		}
		upfateUserInterface()
	}
	func upfateUserInterface() {
		nameLabel.text = show.name
		languageLabel.text = show.language ?? ""
		show.summary = show.summary?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
		descriptionTextView.text = show.summary ?? ""
		networkLabel.text = show.network?.name ?? ""
		if let rating = show.rating?.average {
			ratingLabel?.text = "\(rating)"
		}
		else {
			ratingLabel.text = "-"
		}
		var genreList = ""
		if show.genres != nil {
			for genre in show.genres! {
				genreList += "\(genre) \n"
			}
			if genreList != "" {
				genreList.removeLast()
			}
		}
		genresLabel.text = genreList
		guard let url = URL(string: show.image?.original ?? "") else { return }
		do {
			let data = try Data(contentsOf: url)
			imageView.image = UIImage(data: data)
		} catch {
			print("😡 ERROR: Cloud not get image from url \(url)")
		}
	}
}
