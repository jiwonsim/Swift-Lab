//
//  PageViewController.swift
//  OnboardingProject
//
//  Created by 심지원 on 2020/07/27.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    // MARK: Properties
    
    private(set) lazy var onboardingVCs: [UIViewController] = {
        return [self.loadVCInStoryboard("First"),
                self.loadVCInStoryboard("Second"),
                self.loadVCInStoryboard("Third")]
    }()
    
    // MARK: Actions
    
    private func loadVCInStoryboard(_ name: String) -> UIViewController {
        return UIStoryboard(name: "UsingPageVC", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    // MARK: View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let firstViewController = onboardingVCs.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}


// MARK: - PageView DatasSource

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = onboardingVCs.lastIndex(of: viewController) else {
            return nil
        }
        
        print(viewControllerIndex)
        
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
        
        print(viewControllerIndex)
        
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
