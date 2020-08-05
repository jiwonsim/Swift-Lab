//
//  TutorialViewController.swift
//  OnboardingProject
//
//  Created by 심지원 on 2020/08/05.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    // MARK: Properties

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    var tutorialPageViewController: TutorialPageViewController? {
        didSet { // tutorialPageViewController가 변경되면 위임한다
            tutorialPageViewController?.tutorialDelegate = self
        }
    }
    
    // MARK: Actions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tutorialPageViewController = segue.destination as? TutorialPageViewController {
            self.tutorialPageViewController = tutorialPageViewController
        }
    }
    
    @IBAction func didTapNextButton(_ sender: Any) {
        tutorialPageViewController?.scrollToNextViewController()
    }
    
    @objc func didChangePageControlValue() {
        tutorialPageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
    
    // MARK: View Controller Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.addTarget(self, action: #selector(didChangePageControlValue), for: .valueChanged)
    }
}


// MARK: TutorialPageViewController Delegate 

extension TutorialViewController: TutorialPageViewControllerDelegate {
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
        didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
        didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}
