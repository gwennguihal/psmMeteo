//
//  MasterViewController.swift
//  Meteo
//
//  Created by Guihal Gwenn on 14/03/2019.
//  Copyright © 2019 Guihal Gwenn. All rights reserved.
//

import UIKit

class MeteoViewController: UITableViewController {
    
    let viewModel = MeteoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        self.title = viewModel.title
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetch()
    }

    var objects = [NSDate]()

    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.days.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Day", for: indexPath) as! DayCell

        let dayViewModel = viewModel.days[indexPath.row]
        cell.configure(viewModel: dayViewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nib = Bundle.main.loadNibNamed("HeaderView", owner: nil, options: [:])
        guard let headerView = nib?.first as? HeaderView else {
            return nil
        }
        headerView.titleLabel.text = viewModel.headerTitle
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

extension MeteoViewController : MeteoViewModelDelegate {
    func fetchSucess() {
        tableView.reloadData()
    }
    
    func fetchFailure(error: MeteoViewModel.MeteoError) {
        let alert = UIAlertController(title: "Désolé mais..",
                          message: error.message,
                          preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    
}

