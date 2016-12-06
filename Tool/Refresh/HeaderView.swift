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
        
        let header  = UIView();
        header.backgroundColor = UIColor.red
        self .addSubview(header)
        
        header.snp.makeConstraints({
            (make) in
            make.left.right.height.bottom.equalTo(0)
        })
    }

}
