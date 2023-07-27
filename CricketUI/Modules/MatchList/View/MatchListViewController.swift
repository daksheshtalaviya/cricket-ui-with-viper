//
//  MatchListViewController.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import UIKit

class MatchListViewController: UIViewController, MatchListViewProtocol {
       
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePickerFrom: UIDatePicker!
    @IBOutlet weak var datePickerTo: UIDatePicker!
    
    
    var presenter: MatchListPresenter?
    var allMatches: [MatchResponse] = []
    var matches: [MatchResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad(view: self)
        configureTableView()
        
        datePickerFrom.date = Date(timeIntervalSince1970: 1514745000) //01-01-2018
        datePickerTo.date = Date(timeIntervalSince1970: 1704047400) //01-01-2024
    }
    
    @IBAction func onClickFromToDatePicker(_ sender: UIDatePicker) {
        applyDateFilter()
    }
    
    func show(matches: [MatchResponse]) {
        dump(matches)
        allMatches = matches
        
        applyDateFilter()
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func applyDateFilter() {
                
        DispatchQueue.main.async {
            let startDate = self.datePickerFrom.date
            let endDate = self.datePickerTo.date
            debugPrint("startDate: \(startDate), endDate: \(endDate)")

            let filterMatches = self.allMatches.filter { allMatch -> Bool in
                if let matchDate = allMatch.matchDetail?.match?.matchDate {
                    return matchDate >= startDate && matchDate <= endDate
                }
                return false
            }
            self.matches = filterMatches
            self.reloadData()
        }
    }
}

extension MatchListViewController {
    
    private func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MatchListCell", bundle: nil), forCellReuseIdentifier: "MatchListCell")
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}

// MARK: - UITableViewDataSource
extension MatchListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard matches.count > indexPath.row else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchListCell", for: indexPath) as! MatchListCell
        cell.match = matches[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MatchListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard matches.count > indexPath.row else { return }
        let matchDetail = matches[indexPath.row]
        dump(matchDetail)
        
        presenter?.router.navigateToMatchDetailScreen(navigationController: navigationController, match: matchDetail)
    }
}
