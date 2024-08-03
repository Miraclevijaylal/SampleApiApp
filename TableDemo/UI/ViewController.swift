//
//  ViewController.swift
//  TableDemo
//
//  Created by Vijay Lal on 31/07/24.
//

import UIKit

class ViewController: UIViewController {
    lazy var demoTable: UITableView = {
        let tableView = UITableView()
        tableView.register(DemoTableViewCell.self, forCellReuseIdentifier: "My Identifier")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        return tableView
    }()
    lazy var viewModel: PostViewModel = {
        PostViewModel()
    }()
    var modelArray: [PostModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        fetchData()
    }
    func fetchData() {
        viewModel.fetchPosts { [weak self] array in
            guard let unwrappedSelf = self else { return }
            unwrappedSelf.modelArray = array ?? []
            DispatchQueue.main.async { [weak self] in
                guard let unwrappedSelf = self else { return }
                unwrappedSelf.demoTable.reloadData()
            }
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "My Identifier", for: indexPath) as! DemoTableViewCell
        cell.headingLabel.text = modelArray[indexPath.row].title ?? ""
        cell.contentLabel.text = modelArray[indexPath.row].body ?? ""   
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {  // ?? //
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {  // ?? //
        return UITableView.automaticDimension
    }
}
extension ViewController {
    private func initViews() {
        let guide = view.safeAreaLayoutGuide
        view.addSubview(demoTable)
        demoTable.translatesAutoresizingMaskIntoConstraints = false
        [demoTable.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0),
         demoTable.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0),
         demoTable.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0),
         demoTable.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0)
        ].forEach({ $0.isActive = true })
    }
}

