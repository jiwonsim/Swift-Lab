//
//  LocalizedTutorialVC.swift
//  OnboardingProject
//
//  Created by 심지원 on 2020/08/10.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class LocalizedTutorialVC: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    
    
    var localizedTutorialPageVC: LocalizedTutorialPageVC? {
        didSet {
            localizedTutorialPageVC?.pageVCdelegate = self
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let localizedTutorialPageVC = segue.destination as? LocalizedTutorialPageVC {
            self.localizedTutorialPageVC = localizedTutorialPageVC
        }
    }
    
    @IBAction func didTapNextButton(_ sender: Any) {
        localizedTutorialPageVC?.scrollToNextViewController()
    }
    
    @IBAction func didTapSkipButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didChangePageControlValue() {
        localizedTutorialPageVC?.scrollToViewController(index: pageControl.currentPage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.addTarget(self, action: #selector(didChangePageControlValue), for: .valueChanged)
        skipButton.isHidden = true 
    }
    
    
}

extension LocalizedTutorialVC: LocalizedPageViewControllerDelegate {
    func localizedPageViewController(localizedPageViewController: LocalizedTutorialPageVC, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func localizedPageViewController(localizedPageViewController: LocalizedTutorialPageVC, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
        
        if pageControl.currentPage == pageControl.numberOfPages-1 { skipButton.isHidden = false }
        else { skipButton.isHidden = true }
    }
    
    
}
