//
//  ViewControllerInUSV.swift
//  OnboardingProject
//
//  Created by 심지원 on 2020/08/04.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class ViewControllerInUSV: UIViewController, UIScrollViewDelegate {
    
    // MARK: Properties
    
    let colors = [UIColor.yellow, UIColor.green, UIColor.purple]
    var scrollWidth: CGFloat = 0, scrollHeight: CGFloat = 0
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: Actions
    
    @IBAction func movingToNext(_ sender: Any) {
        pageControl.currentPage += 1
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    
    @IBAction func skipping(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changingPage(_ sender: Any) {
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    
    
    // MARK: ScrollView Delegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }

    func setIndiactorForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }
    
    // MARK: Setting Subview
    
    private func setScrolView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.frame = scrollView.bounds
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height - 300)
        
        scrollView.backgroundColor = .orange
    }
    
    private func setSlides() {
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)

        for index in 0..<colors.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)

            let slide = UIView(frame: frame)
            slide.backgroundColor = colors[index]
            
            scrollView.addSubview(slide)
        }
        
        //set width of scrollview to accomodate all the slides
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(colors.count), height: scrollHeight)

        //disable vertical scroll/bounce
        self.scrollView.contentSize.height = 1.0

        //initial state
        pageControl.numberOfPages = colors.count
        pageControl.currentPage = 0
    }
    
    // MARK: View Controller LifeCycle
    
    override func viewDidLayoutSubviews() {
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        
        setScrolView()
        
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        setSlides()
    }
}
