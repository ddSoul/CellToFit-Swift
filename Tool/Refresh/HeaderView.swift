//
//  HeaderView.swift
//  CellToFit-Swift
//
//  Created by ddSoul on 16/12/5.
//  Copyright © 2016年 dxl. All rights reserved.
//

import UIKit

class HeaderView: UIView {

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
        
        let header  = UILabel();
        header.textColor = UIColor.green
        header.textAlignment = NSTextAlignment.center
        header.text = "下拉刷新了。。。"
        self .addSubview(header)
        self.backgroundColor = UIColor.red
        
        header.snp.makeConstraints({
            (make) in
            make.left.right.top.equalTo(0)
            make.height.equalTo(30)
        })
    }

}
