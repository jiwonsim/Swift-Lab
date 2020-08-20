//
//  AddViewController.swift
//  Animate-TableView
//
//  Created by 심지원 on 2020/08/19.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class AddingViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var motivTextField: UITextField!
    
    @IBAction func didTapAddingButton(_ sender: Any) {
        
        Schedules.uncheckedSchedules.append(Schedule(toDo: titleTextField.text!, motiv: motivTextField.text))
        
        self.navigationController?.popViewController(animated: true, completion: {
            NotificationCenter.default.post(name: Notification.Name("ReloadTableView"), object: nil)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add a schedule"
        
        titleTextField.autocorrectionType = .no
        motivTextField.autocorrectionType = .no
    }
}

extension UINavigationController {
    func popViewController(animated: Bool, completion: @escaping () -> ()) {
        popViewController(animated: animated)

        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
}
