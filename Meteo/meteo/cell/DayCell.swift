//
//  DayCell.swift
//  Meteo
//
//  Created by Guihal Gwenn on 14/03/2019.
//  Copyright © 2019 Guihal Gwenn. All rights reserved.
//

import Foundation
import UIKit

class DayCell: UITableViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    func configure(viewModel: DayViewModel) {
        dayLabel.text = viewModel.dayText
        tempLabel.text = viewModel.tempText
        iconView.image = viewModel.icon
    }
}
