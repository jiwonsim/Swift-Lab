//
//  LocalizedTutorialPageVC.swift
//  OnboardingProject
//
//  Created by 심지원 on 2020/08/10.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class LocalizedTutorialPageVC: UIPageViewController {
    
    weak var pageVCdelegate: LocalizedPageViewControllerDelegate?
    
    private(set) lazy var onboardingVCs: [UIViewController] = {
        return [self.loadOnboardingVC(name: "first"),
                self.loadOnboardingVC(name: "second"),
                self.loadOnboardingVC(name: "third")]
    }()
    
    private func loadOnboardingVC(name: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "UsingPageVC+PageControl+Localization", bundle: nil)
        
        guard let onboardingVC = storyboard.instantiateViewController(withIdentifier: ReusableTutorialVC.identifier) as? ReusableTutorialVC else {
            return UIViewController() }
        
        onboardingVC.populate(name)
        
        return onboardingVC
    }
    
    // pageVCDelegate에게 현재 페이지가 바뀌었다고 알려준다.
    func notifypageVCDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = onboardingVCs.firstIndex(of: firstViewController) {
            pageVCdelegate?.localizedPageViewController(localizedPageViewController: self, didUpdatePageIndex: index)
        }
    }
    
    func scrollToNextViewController() {
        if let visibleVC = viewControllers?.first,
            let nextVC = pageViewController(self, viewControllerAfter: visibleVC) {
            scrollToViewController(viewController: nextVC)
        }
    }
    
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewController.NavigationDirection = .forward) {
        setViewControllers([viewController],
                           direction: direction,
                           animated: true) { (finished) -> Void in
            self.notifypageVCDelegateOfNewIndex()
        }
    }
    
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = onboardingVCs.firstIndex(of: firstViewController) {
            let direction: UIPageViewController.NavigationDirection = newIndex > currentIndex ? .forward : .reverse
            let nextViewController = onboardingVCs[newIndex]
            scrollToViewController(viewController: nextViewController, direction: direction)
        }
    }
    
    // MARK: View Controller LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let firstViewController = onboardingVCs.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        pageVCdelegate?.localizedPageViewController(localizedPageViewController: self, didUpdatePageCount: onboardingVCs.count)
    }
}

// MARK: - PageViewController Delegate

extension LocalizedTutorialPageVC: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        notifypageVCDelegateOfNewIndex()
    }
}

// MARK: - PageViewController DataSource

extension LocalizedTutorialPageVC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let indexOfVC = onboardingVCs.lastIndex(of: viewController) else { return nil }
        
        let previousIndex = indexOfVC - 1
        
        guard previousIndex >= 0 else { return nil }
        guard onboardingVCs.count > previousIndex else { return nil }
        
        return onboardingVCs[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let indexOfVC = onboardingVCs.lastIndex(of: viewController) else { return nil }
        
        let nextIndex = indexOfVC + 1
        
        guard onboardingVCs.count != nextIndex else { return nil }
        guard onboardingVCs.count > nextIndex else { return nil }
        
        return onboardingVCs[nextIndex]
    }
}


protocol LocalizedPageViewControllerDelegate: class {
    func localizedPageViewController(localizedPageViewController: LocalizedTutorialPageVC,
                                     didUpdatePageCount count: Int)
    
    func localizedPageViewController(localizedPageViewController: LocalizedTutorialPageVC,
                                     didUpdatePageIndex index: Int)
}
