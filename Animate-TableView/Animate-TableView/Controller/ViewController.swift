//
//  ViewController.swift
//  Animate-TableView
//
//  Created by 심지원 on 2020/08/19.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private func registerXib() {
        let nibName = UINib(nibName: TableViewCell.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    @objc func reloadTableView() {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Main view"
        
        registerXib()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: Notification.Name("ReloadTableView"), object: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return Schedules.uncheckedSchedules.count
        case 1:
            return Schedules.checkedSchedules.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else { return UITableViewCell() }
        
        switch indexPath.section {
        case 0:
            let schedule = Schedules.uncheckedSchedules[indexPath.row]
            cell.populate(schedule.toDo, schedule.motiv, false)
        case 1:
            let schedule = Schedules.checkedSchedules[indexPath.row]
            cell.populate(schedule.toDo, schedule.motiv, true)
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            Schedules.checkedSchedules.append(Schedules.uncheckedSchedules.remove(at: indexPath.row))
        case 1:
            Schedules.uncheckedSchedules.append(Schedules.checkedSchedules.remove(at: indexPath.row))
        default: return
        }
        
        reloadTableView()
    }
}
