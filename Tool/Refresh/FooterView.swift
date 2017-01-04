//
//  FooterView.swift
//  CellToFit-Swift
//
//  Created by ddSoul on 16/12/5.
//  Copyright © 2016年 dxl. All rights reserved.
//

import UIKit

class FooterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupSubviews() {
        
        let footer  = UILabel();
        footer.textColor = UIColor.green
        footer.text = "上拉加载更多哦.."
        footer.textAlignment = NSTextAlignment.center
        self.addSubview(footer)
        self.backgroundColor = UIColor.red
        
        footer.snp.makeConstraints({
            (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(30)
        })
    }
}
