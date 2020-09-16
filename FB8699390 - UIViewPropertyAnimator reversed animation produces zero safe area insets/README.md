# FB8699390 - Cancelled UIViewPropertyAnimator animation leaves child view controller with zero safe area insets

Summary:
- A child view controller’s view has a subview that is constrained to the safe area layout guide anchors
- The child view controller’s view is added to its parent with constraints (top, left, right, bottom)
- A UIViewProperty animator animates the child view’s top constraint to a constant that would make the top safe area inset in the child view 0 if the animation would complete successfully
- We reverse the animation half way through
- After the animation finishes the child view’s subview jumps up to the now 0 safeAreaLayoutGuide.topAnchor

Steps to Reproduce:
See sample project

Expected Results:
- The child view’s view stays in the final animation step and doesn’t jump up
- The child view’s safe area insets are reevaluated after the animation completes

Actual Results:
- The child view’s safe area insets top is 0
- The child view’s subviews jumps up (since the safeAreaLayoutGuide is wrong)

Version:
iPhone 11 Simulator iOS 14.0 (18A372) Xcode 12.0 (12A7209)
But this seems to have been an issue since iOS 10

http://openradar.appspot.com/radar?id=4943238171459584
