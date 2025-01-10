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

let staticWidgetInfoPlist: InfoPlist = .extendingDefault(with: [
	"CFBundleDisplayName": "$(PRODUCT_NAME)",
	"NSExtension": [
		"NSExtensionPointIdentifier": "com.apple.widgetkit-extension",
	]
])

let staticFramework = Target.target(
	name: "StaticFramework",
	destinations: .iOS,
	product: .staticFramework,
	bundleId: "io.tuist.App.StaticFramework",
	infoPlist: .default,
	sources: "StaticFramework/Sources/**"
)

let bundle = Target.target(
	name: "Bundle",
	destinations: .iOS,
	product: .bundle,
	bundleId: "io.tuist.App.Bundle",
	resources: "Bundle/**"
)

let staticWidget = Target.target(
	name: "WidgetExtension",
	destinations: .iOS,
	product: .appExtension,
	bundleId: "ru.maksim.widgets.staticWidget",
	infoPlist: staticWidgetInfoPlist,
	sources: ["StaticWidget/**"],
	resources: ["StaticWidget/Resources/**"],
	dependencies: [
		.target(name: "Bundle"),
		.target(name: "StaticFramework"),
	]
)

let widgets = Target.target(
	name: "Widgets",
	destinations: .iOS,
	product: .app,
	bundleId: "ru.maksim.widgets",
	deploymentTargets: .iOS("17.0"),
	infoPlist: infoPlist,
	sources: ["Widgets/Sources/**"],
	resources: ["Widgets/Resources/**"],
	dependencies: [
		.target(name: "WidgetExtension")
	]
)

let project = Project(
	name: "Widgets",
	options: .options(
		defaultKnownRegions: ["ru", "en"],
		developmentRegion: "ru"
	),
	targets: [
		widgets,
		staticWidget,
		bundle,
		staticFramework
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
