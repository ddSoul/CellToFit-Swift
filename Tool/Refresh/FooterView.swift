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
        
        let footer  = UIView();
        footer.backgroundColor = UIColor.red
        self.addSubview(footer)
        
        footer.snp.makeConstraints({
            (make) in
            make.left.right.height.bottom.equalTo(0)
        })
    }
}
