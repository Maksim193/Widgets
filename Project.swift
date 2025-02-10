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

let widgetInfoPlist: InfoPlist = .extendingDefault(with: [
	"CFBundleLocalizations": ["ru", "en"],
	"CFBundleDevelopmentRegion": "ru",
	"CFBundleDisplayName": "$(PRODUCT_NAME)",
	"NSExtension": [
		"NSExtensionPointIdentifier": "com.apple.widgetkit-extension",
	]
])

let widgetEntitlements = Entitlements.dictionary(
	[
		"com.apple.security.application-groups": ["group.ru.maksim.widgets"]
	]
)

let widgetExtensionEntitlements = Entitlements.dictionary(
	[
		"com.apple.security.application-groups": ["group.ru.maksim.widgets"]
	]
)

let widgetFramework = Target.target(
	name: "WidgetFramework",
	destinations: .iOS,
	product: .staticFramework,
	bundleId: "io.tuist.App.StaticFramework",
	infoPlist: .default,
	sources: "WidgetFramework/Sources/**"
)

let bundle = Target.target(
	name: "Bundle",
	destinations: .iOS,
	product: .bundle,
	bundleId: "io.tuist.App.Bundle",
	resources: "Bundle/**"
)

let widgetExtension = Target.target(
	name: "WidgetExtension",
	destinations: .iOS,
	product: .appExtension,
	bundleId: "ru.maksim.widgets.widgetExtension",
	infoPlist: widgetInfoPlist,
	sources: ["HomescreenWidget/**"],
	resources: ["HomescreenWidget/Resources/**"],
	entitlements: widgetExtensionEntitlements,
	dependencies: [
		.target(name: "Bundle"),
		.target(name: "WidgetFramework"),
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
	entitlements: widgetEntitlements,
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
		widgetExtension,
		bundle,
		widgetFramework
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
