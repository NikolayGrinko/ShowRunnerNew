//
//  SearchViewController.swift
//  ShowrunnerNew
//
//  Created by Николай Гринько on 19.06.2024.
//

import UIKit
import AVFoundation

class SearchViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var searchShowLabel: UILabel!
	@IBOutlet weak var searchTextField: UITextField!
	@IBOutlet weak var searchButton: UIButton!
	
	var audioPlayer: AVAudioPlayer!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
		tap.cancelsTouchesInView = false
		self.view.addGestureRecognizer(tap)
		
		imageView.alpha = 0.0
		searchShowLabel.alpha = 0.0
		searchTextField.alpha = 0.0
		searchButton.alpha = 0.0
		
		playSound(name: "tv-startup-sound")
		
    }
    
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		UIView.animate(withDuration: 5.0, animations: {
			self.imageView.alpha = 1.0
		})
		
		UIView.animate(withDuration: 1.0, delay: 4.0, animations: {
			self.searchShowLabel.alpha = 1.0
			self.searchTextField.alpha = 1.0
			self.searchButton.alpha = 1.0
		})
		
	}
	
	func playSound(name: String) {
		if let sound = NSDataAsset(name: name) {
			do {
				audioPlayer = try AVAudioPlayer(data: sound.data)
				audioPlayer.play()
			} catch {
				print("😡 \(error.localizedDescription). Could not initialize AVAudioPlayer object")
			}
		} else {
			print("😡 ERROR: Could not read data from file \(name)")
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		var searchText = searchTextField.text!
		searchText = searchText.replacingOccurrences(of: " ", with: "%20")
		let destination = segue.destination as! ListViewController
		destination.searchText = searchText
	}
	
}
