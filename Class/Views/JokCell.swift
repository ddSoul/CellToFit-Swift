//
//  JokCell.swift
//  CellToFit-Swift
//
//  Created by ddSoul on 16/12/1.
//  Copyright © 2016年 dxl. All rights reserved.
//

import UIKit

class JokCell: UITableViewCell {
    
    private lazy var backImage   = UIImageView()
    
    private lazy var contentText   = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        prepareUI()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(model :JokModel)
    {
        contentText.text = model.text
    }
    
    private func prepareUI() {
        
        self.contentView.addSubview(backImage)
        
        self.contentView.addSubview(contentText)
        
        configeView()
        
        setLayout()
        
    }
    
    func configeView()
    {
         backImage.image = UIImage.init(named: "back")
         contentText.font = UIFont.systemFont(ofSize: 12)
        contentText.numberOfLines = 0;
       contentText.isUserInteractionEnabled = true
        
    }
    
    func setLayout()
    {
        self.backImage.snp.makeConstraints({ (make) in
            make.left.top.equalTo(self.contentView).offset(10)
            make.right.bottom.equalTo(self.contentView).offset(-10)
        })
        self.contentText.snp.makeConstraints({ (make) in
            make.left.equalTo(25)
            make.top.equalTo(20)
            make.bottom.right.equalTo(-20)
        })
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
