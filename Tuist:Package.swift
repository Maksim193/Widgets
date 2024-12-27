//
//  Tuist:Package.swift
//  Widgets
//
//  Created by Максим Косников on 27.12.2024.
//

import PackageDescription

#if TUIST
	import ProjectDescription

	let packageSettings = PackageSettings(
		// Customize the product types for specific package product
		// Default is .staticFramework
		// productTypes: ["Alamofire": .framework,]
		productTypes: [:]
	)
#endif

let package = Package(
	name: "Widgets",
	dependencies: [
		// Add your own dependencies here:
		// .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
		// You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
	]
)
