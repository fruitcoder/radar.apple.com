//
//  ViewController.swift
//  FullscreenSafeAreaBug
//
//  Created by fruitcoder on 14.09.20.
//

import UIKit

class SafeAreaConstrainedSubviewViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		let subview = UIView()
		subview.translatesAutoresizingMaskIntoConstraints = false
		subview.backgroundColor = .green
		view.backgroundColor = .lightGray

		view.addSubview(subview)

		NSLayoutConstraint.activate([
			subview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			subview.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
			subview.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
			subview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}

	override func viewSafeAreaInsetsDidChange() {
		super.viewSafeAreaInsetsDidChange()

		print("New safe area insets \(view.safeAreaInsets)")
	}
}

class ViewController: UIViewController {

	let child = SafeAreaConstrainedSubviewViewController()
	var topConstraint: NSLayoutConstraint!
	var animator: UIViewPropertyAnimator?

	override func viewDidLoad() {
		super.viewDidLoad()

		addChild(child)
		view.addSubview(child.view)
		child.didMove(toParent: self)
		child.view.translatesAutoresizingMaskIntoConstraints = false

		topConstraint = child.view.topAnchor.constraint(equalTo: view.topAnchor)

		NSLayoutConstraint.activate([
			topConstraint,
			child.view.leftAnchor.constraint(equalTo: view.leftAnchor),
			child.view.rightAnchor.constraint(equalTo: view.rightAnchor),
			child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		animator = UIViewPropertyAnimator(duration: 5.0, curve: .easeIn) {
			self.topConstraint.constant = 100
			self.view.layoutIfNeeded()
		}

		self.animator?.addCompletion({ _ in
			print("Reverse animation completed. Child safe area insets \(self.child.view.safeAreaInsets)")

			// set constraint to beginning state
			self.topConstraint.constant = 0

			// doesn't help
			self.view.setNeedsLayout()
			self.view.layoutIfNeeded()
			self.child.view.setNeedsLayout()
			self.child.view.layoutIfNeeded()
		})

		// wait 1s so we can see the expected state after the reverse animation has finished
		animator?.startAnimation(afterDelay: 1.0)

		DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
			self.animator?.isReversed = true
		}
	}
}

