//
//  CoinViewCell.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 01/05/25.
//

import UIKit

class CoinViewCell: UITableViewCell {

    static let identifier = "CoinViewCell"
    
    @IBOutlet weak var rankLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var symbolLabel: UILabel!
  
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var percentageLabel: UILabel!

    @IBOutlet weak var marketCaptalizationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
