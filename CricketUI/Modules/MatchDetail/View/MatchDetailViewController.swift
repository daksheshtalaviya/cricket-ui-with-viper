//
//  MatchDetailViewController.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import UIKit

typealias CategoryWithItems = Dictionary<Category, [Any]>.Element
typealias CategoryWithItem = Dictionary<Category, Any>.Element

class MatchDetailViewController: UIViewController, MatchDetailViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentTeams: TeamSegmentControl!
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblToss: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblVenue: UILabel!
    
    var presenter: MatchDetailPresenter?
    var match: MatchResponse?
    var inning: Inning?
    
    var categories: [CategoryWithItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad(view: self)
        configureTableView()
        configureSegmentControl()
    }
    
    func show(inning: Inning) {
        dump(inning)
        
        self.inning = inning
        
        categories = [
            (key: .batting, value: inning.batsmen ?? []),
            (key: .extras, value: []),
            (key: .totalRuns, value: []),
            (key: .fallOfWickets, value: [inning.fallOfWickets ?? []]),
            (key: .bowling, value: inning.bowlers ?? []),
        ]
        
        updateDetail()
        reloadData()
    }
    
    private func updateDetail() {
        
        lblDate.text = match?.matchDetail?.match?.displayDate
        lblToss.text = match?.nuggets?.first
        lblResult.text = match?.matchDetail?.result
        lblVenue.text = match?.matchDetail?.venue?.name
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func configureSegmentControl() {
        
        let sortedTeams = match?.teams?.sorted(by: { teamA, _ in
            let firstTeam = match?.innings?.first(where: {$0.number == .first})?.team
            if firstTeam == teamA.value {
                return true
            }
            return false
        })
        
        sortedTeams?.enumerated().forEach({ (index, team) in
            segmentTeams.setTeamId(team.key, forSegmentAt: index)
            segmentTeams.setTitle(team.value.nameFull, forSegmentAt: index)
        })
        
        segmentTeams.selectedSegmentIndex = 0
        onClickSegmentTeams(segmentTeams)
    }
    
    @IBAction func onClickSegmentTeams(_ sender: TeamSegmentControl) {
        
        guard let teamId = sender.teamIds[sender.selectedSegmentIndex] else { return }
        presenter?.saveSelectedTeamId(teamId: teamId, match: match)
    }
    
}

extension MatchDetailViewController {
    // MARK: - Configure Table View
    private func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        [
            "InningBatsmanCell",
            "InningBowlerCell",
            "InningFallOfWicketCell",
        ].forEach { cellName in
            tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        }
        
        [
            "InningBatsmenHeaderView",
            "InningBowlersHeaderView",
            "InningTitleHeaderView",
        ].forEach { cellName in
            tableView.register(UINib(nibName: cellName, bundle: nil), forHeaderFooterViewReuseIdentifier: cellName)
        }
        
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 20
        tableView.sectionHeaderHeight = UITableView.automaticDimension
    }
    
}

// MARK: - UITableViewDataSource
extension MatchDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories[section].value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch categories[indexPath.section] {
            
        case (.batting, let players) where players is [Batsman]:
            let batsmen = players as! [Batsman]
            return tableView.makeBatsmanCell(batsmen, indexPath: indexPath)
            
        case (.bowling, let players) where players is [Bowler]:
            let bowlers = players as! [Bowler]
            return tableView.makeBowlerCell(bowlers, indexPath: indexPath)

        case (.extras, _):
            return UITableViewCell()

        case (.totalRuns, _):
            return UITableViewCell()

        case (.fallOfWickets, let players) where players is [[FallOfWicket]]:
            let players = players as! [[FallOfWicket]]
            return tableView.makeFallOfWicketCell(players, indexPath: indexPath)

        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch categories[section] {
        case (.batting, _):
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InningBatsmenHeaderView") as! InningBatsmenHeaderView
            headerView.title = categories[section].key.rawValue
            return headerView
            
        case (.bowling, _):
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InningBowlersHeaderView") as! InningBowlersHeaderView
            headerView.title = categories[section].key.rawValue
            return headerView
            
        case (.fallOfWickets, _), (.extras, _), (.totalRuns, _):
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InningTitleHeaderView") as! InningTitleHeaderView
            if let inning {
                headerView.item = (key: categories[section].key, value: inning)
            }
            return headerView
        }
        
    }
}

// MARK: - UITableViewDelegate

extension MatchDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch categories[indexPath.section] {
        case (.batting, let players) where players is [Batsman]:
            let batsmen = players as! [Batsman]
            let batsman = batsmen[indexPath.row]
            dump(batsman)
            openBatsmanDetail(batsman: batsman)
            
        default: break
        }
    }
    
    private func openBatsmanDetail(batsman: Batsman) {
        let player = batsman.player?.value
        AlertManager.showAlert(withTitle: player?.nameFull, Message: player?.styles, ViewController: self)
    }
}

extension UITableView {
    
    func makeBatsmanCell(_ players: [Batsman], indexPath: IndexPath) -> UITableViewCell {
        guard players.count > indexPath.row else { return UITableViewCell() }
        
        let cell = dequeueReusableCell(withIdentifier: "InningBatsmanCell", for: indexPath) as! InningBatsmanCell
        cell.batsman = players[indexPath.row]
        return cell
    }
    
    func makeBowlerCell(_ players: [Bowler], indexPath: IndexPath) -> UITableViewCell {
        guard players.count > indexPath.row else { return UITableViewCell() }
        
        let cell = dequeueReusableCell(withIdentifier: "InningBowlerCell", for: indexPath) as! InningBowlerCell
        cell.bowler = players[indexPath.row]
        return cell
    }
    
    func makeFallOfWicketCell(_ players: [[FallOfWicket]], indexPath: IndexPath) -> UITableViewCell {
        guard players.count > indexPath.row else { return UITableViewCell() }
        
        let cell = dequeueReusableCell(withIdentifier: "InningFallOfWicketCell", for: indexPath) as! InningFallOfWicketCell
        cell.players = players[indexPath.row]
        return cell
    }
    
    
}
