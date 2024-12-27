//
//  Project.swift
//  Widgets
//
//  Created by Максим Косников on 27.12.2024.
//

import Foundation
import ProjectDescription

// MARK: - Versions

let path = URL(
	fileURLWithPath: "./")
	.appendingPathComponent("AppVersion.json")
let data = try! Data(contentsOf: path)
let versions = try! JSONDecoder().decode(Versions.self, from: data)
let appName = "Widgets"

struct Versions: Decodable {
	let version: String
	let buildNumber: String
}

// MARK: - infoPlist

let infoPlist: InfoPlist = .extendingDefault(with: [
	"CFBundleLocalizations": ["ru", "en"],
	"CFBundleDevelopmentRegion": "ru",
	"CFBundleShortVersionString": "\(versions.version)",
	"CFBundleVersion": "\(versions.buildNumber)",
	"CFBundleExecutable": "$(EXECUTABLE_NAME)",
	"ITSAppUsesNonExemptEncryption": false,
	"UIApplicationSceneManifest": [
		"UIApplicationSupportsMultipleScenes": false,
		"UISceneConfigurations": [
			"UIWindowSceneSessionRoleApplication": [
				[
					"UISceneConfigurationName": "Default Configuration",
					"UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
				]
			]
		]
	],
	"UIViewControllerBasedStatusBarAppearance": true,
	"UILaunchStoryboardName": "LaunchScreen",
	"UISupportedInterfaceOrientations": [
		"UIInterfaceOrientationPortrait",
		"UIInterfaceOrientationPortraitUpsideDown"
	],
	"LSApplicationQueriesSchemes": ["tg"],
	"CFBundleDisplayName": "\(appName)"
])

let widgets = Target.target(
	name: "Widgets",
	destinations: [.iPhone],
	product: .app,
	bundleId: "ru.maksim.widgets",
	deploymentTargets: .iOS("17.0"),
	infoPlist: infoPlist,
	sources: [
		"Widgets"
	]
)

let project = Project(
	name: "Widgets",
	targets: [
		widgets
	],
	schemes: [
		.scheme(
			name: "Widgets",
			shared: true,
			hidden: false,
			buildAction: BuildAction.buildAction(
				targets: ["Widgets"]
			),
			runAction: RunAction.runAction(executable: "Widgets")
		)
	]
)
