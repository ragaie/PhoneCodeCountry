//
//  CodeTableCell.swift
//  CountryPhoneCodePicker
//
//  Created by Ragaie alfy on 9/25/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class CodeTableCell: UITableViewCell {

    @IBOutlet weak var flageImage: UIImageView!
    @IBOutlet weak var codeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
