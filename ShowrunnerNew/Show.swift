//
//  Show.swift
//  ShowrunnerNew
//
//  Created by Николай Гринько on 18.06.2024.
//

import Foundation


struct Show: Codable {
	var name: String
	var language: String?
	var summary: String?
	var genres: [String]?
	var rating: Rating?
	let network: Network?
	var image: Image?
}

struct Rating: Codable {
	var average: Double?
}

struct Network: Codable {
	var name: String?
}

struct Image: Codable {
	var original: String?
}
