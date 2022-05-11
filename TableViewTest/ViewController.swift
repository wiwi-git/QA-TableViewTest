//
//  ViewController.swift
//  TableViewTest
//
//  Created by wiwi-git on 2022/05/11.
//

import UIKit

class ViewController: UIViewController {
    lazy var rightTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(UITableViewCell.self, forCellReuseIdentifier: "item_cell")
        view.tag = 134
        return view
    }()
    lazy var leftTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(UITableViewCell.self, forCellReuseIdentifier: "item_cell")
        view.tag = 135
        return view
    }()
    
    var rightData: [String] = []
    var leftData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setTestData()
    }
    
    func setLayout() {
        let safe = view.safeAreaLayoutGuide
        view.addSubview(rightTableView)
        view.addSubview(leftTableView)
        
        rightTableView.translatesAutoresizingMaskIntoConstraints = false
        leftTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftTableView.topAnchor.constraint(equalTo: safe.topAnchor),
            leftTableView.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
            leftTableView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
            leftTableView.widthAnchor.constraint(equalTo: safe.widthAnchor, multiplier: 0.5),
            
            rightTableView.topAnchor.constraint(equalTo: safe.topAnchor),
            rightTableView.leadingAnchor.constraint(equalTo: leftTableView.trailingAnchor),
            rightTableView.trailingAnchor.constraint(equalTo: safe.trailingAnchor),
            rightTableView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
        ])
    }
    
    func setTestData() {
        for i in 0 ..< 10 {
            rightData.append("\(i) cell right")
            leftData.append("\(i) cell left")
        }
        rightTableView.reloadData()
        leftTableView.reloadData()
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 134 {
            return rightData.count
        }
        if tableView.tag == 135 {
            return leftData.count
        }
        
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item_cell", for: indexPath)
        if tableView.tag == 134 {
            let item = rightData[indexPath.row]
            print("right","cell item ", item)
            cell.textLabel?.text = item
            return cell
        }
        
        if tableView.tag == 135 {
            let item = leftData[indexPath.row]
            print("left","cell item ", item)
            cell.textLabel?.text = item
            return cell
        }
        
        return cell
    }
}
