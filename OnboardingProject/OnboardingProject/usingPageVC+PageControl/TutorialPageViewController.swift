//
//  TutorialPageViewController.swift
//  OnboardingProject
//
//  Created by 심지원 on 2020/08/05.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController {
    
    // MARK: Properties
    
    weak var tutorialDelegate: TutorialPageViewControllerDelegate?
    private(set) lazy var onboardingVCs: [UIViewController] = {
        return [self.loadVCInStoryboard("First"),
                self.loadVCInStoryboard("Second"),
                self.loadVCInStoryboard("Third")]
    }()
    
    
    // MARK: Actions
    
    private func loadVCInStoryboard(_ name: String) -> UIViewController {
        return UIStoryboard(name: "UsingPageVC", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    // Scrolls to the next view controller.
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self, viewControllerAfter: visibleViewController) {
                    scrollToViewController(viewController: nextViewController)
        }
    }
    
    // Scrolls to the view controller at the given index. Automatically calculates the direction.
    // - parameter newIndex: the new index to scroll to
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = onboardingVCs.firstIndex(of: firstViewController) {
            let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
                let nextViewController = onboardingVCs[newIndex]
                scrollToViewController(viewController: nextViewController, direction: direction)
        }
    }
    
    func newColoredViewController(_ color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(color)ViewController")
    }
    
    // Scrolls to the given 'viewController' page.
    // parameter viewController: the view controller to show.
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewController.NavigationDirection = .forward) {
        setViewControllers([viewController],
            direction: direction,
            animated: true,
            completion: { (finished) -> Void in
                // Setting the view controller programmatically does not fire
                // any delegate methods, so we have to manually notify the
                // 'tutorialDelegate' of the new index.
                self.notifyTutorialDelegateOfNewIndex()
        })
    }
    
    // Notifies '_tutorialDelegate' that the current page index was updated.
    private func notifyTutorialDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = onboardingVCs.firstIndex(of: firstViewController) {
                tutorialDelegate?.tutorialPageViewController(tutorialPageViewController: self, didUpdatePageIndex: index)
        }
    }
    
    
    // MARK: View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let firstViewController = onboardingVCs.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        tutorialDelegate?.tutorialPageViewController(tutorialPageViewController: self, didUpdatePageCount: onboardingVCs.count)
    }
}


// MARK: - PageView Delegate

extension TutorialPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        notifyTutorialDelegateOfNewIndex()
    }
}


// MARK: - PageView DataSource

extension TutorialPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = onboardingVCs.lastIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard onboardingVCs.count > previousIndex else {
            return nil
        }
        
        return onboardingVCs[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = onboardingVCs.lastIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1

        guard onboardingVCs.count != nextIndex else {
            return nil
        }
        
        guard onboardingVCs.count > nextIndex else {
            return nil
        }
        
        return onboardingVCs[nextIndex]
    }
}

// MARK: - Protocol to send data from here to TutorialViewController

protocol TutorialPageViewControllerDelegate: class {
    
    /**
     Called when the number of pages is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter count: the total number of pages.
     */
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
        didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
        didUpdatePageIndex index: Int)
    
}
