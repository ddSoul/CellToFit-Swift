//
//  RefreshEX.swift
//  CellToFit-Swift
//
//  Created by ddSoul on 16/12/5.
//  Copyright © 2016年 dxl. All rights reserved.
//

import Foundation
import UIKit

private var lcHeaderBlock: (()->Void)?
private var lcFooterBlock: (()->Void)?
var headerBool = false
var footerBool = false

private var headerView = HeaderView()
private var footView = FooterView()

extension UIScrollView{
    
    
    /// 下拉刷新
    ///
    /// - parameter refreshBlock: task
    func addRefreshHeaderWithBlock(_ refreshBlock:@escaping () -> Void) -> Void {
        
        self.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
        lcHeaderBlock = refreshBlock
        
    }
    
    func endRefreshHeaderWithBlock(_ refreshBlock:() -> Void) -> Void {
        
        if headerBool {
            headerBool = false
            weak var weakSelf = self
            UIView.animate(withDuration: 0.5,
                           animations: {
                            weakSelf?.contentInset = UIEdgeInsets(top:64,left:0,bottom:0,right:0)
                },
                           completion: {
                            (finished) in
                            headerView.removeFromSuperview()
            })
        }
    }
    
    /// 上拉加载更多
    ///
    /// - parameter refreshBlock: task
    func addLoadMoreFooterWithBlock(_ loadMoreBlock:@escaping () -> Void) -> Void {
        
        lcFooterBlock = loadMoreBlock
    }
    
    func endLoadMoreFooterWithBlock(_ loadMoreBlock:() -> Void) -> Void {
        
        if footerBool {
            footerBool = false
            weak var weakSelf = self
            UIView.animate(withDuration: 0.5,
                           animations: {
                            weakSelf?.contentInset = UIEdgeInsets(top:0,left:0,bottom:0,right:0)
                },
                           completion: {
                            (finished) in
                            footView.removeFromSuperview()
            })

        }
    
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentOffset" {

            if self.contentOffset.y < -100 && !headerBool{
                
                headerBool = true
                if lcHeaderBlock != nil {
                    lcHeaderBlock!()
                }
                weak var weakSelf = self
                headerView.frame = CGRect(x: 0, y: -36, width:screenW , height: 100)
                weakSelf?.insertSubview(headerView, at: 0)
                UIView.animate(withDuration: 0.5, animations: {
                    weakSelf?.contentInset = UIEdgeInsets(top:100,left:0,bottom:0,right:0)
                })

            }
            
            if self.contentOffset.y + screenH > self.contentSize.height && self.contentSize.height>0 && !footerBool{
            
                footerBool = true
                if lcFooterBlock != nil {
                    lcFooterBlock!()
                }
                weak var weakSelf = self
                footView.frame = CGRect(x: 0, y: self.contentSize.height, width:screenW , height: 100)
                weakSelf?.insertSubview(footView, at: 0)

                UIView.animate(withDuration: 0.5, animations: {
                    weakSelf?.contentInset = UIEdgeInsets(top:0,left:0,bottom:100,right:0)
                    })
            }
            
        }
    }
    
}

