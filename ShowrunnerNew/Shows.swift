//
//  Shows.swift
//  ShowrunnerNew
//
//  Created by Николай Гринько on 17.06.2024.
//

import Foundation

class Shows {
	
	struct Returned: Codable {
		var show: Show
	}
	
	
	var  urlString = "https://api.tvmaze.com/search/shows?q="
	var showArray: [Returned] = []
	
	func getData(completed: @escaping () -> ()) {
		print("❄️We are accesing the url \(urlString)")
		
		
		guard let url = URL(string: urlString) else {
			print("😡ERROR: Could nor create a URL from \(urlString)")
			completed()
			return
		}
		let session = URLSession.shared
		
		let task = session.dataTask(with: url) { (data, response, error) in
			if let error = error {
				print("😡 ERROR: \(error.localizedDescription)")
			}
			
			do {
				self.showArray = try JSONDecoder().decode([Returned].self, from: data!)
				
				print("😍 Here is what we returned: \(self.showArray)")
			} catch {
				print("😡JSON ERROR: \(error.localizedDescription)")
			}
			completed()
		}
		task.resume()
	}
}
