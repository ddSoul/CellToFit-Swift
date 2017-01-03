//
//  AnimationController.swift
//  CellToFit-Swift
//
//  Created by ddSoul on 16/12/21.
//  Copyright © 2016年 dxl. All rights reserved.
//

import UIKit

class AnimationController: UIViewController {

    var logo : UIView?
    var button: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        initUI()
        
        // Do any additional setup after loading the view.
    }

    func initUI() {
        logo = UIView()
        logo?.frame =  CGRect(x:100,y:100,
                              width:40,
                              height:40)
        logo?.backgroundColor = UIColor.red
        
        button = UIButton()
        button?.frame = CGRect(x:100,y:300,
                               width:40,
                               height:40)
        button?.backgroundColor = UIColor.gray
        button?.addTarget(self,action:#selector(buttonClick),for:.touchUpInside)
        
        self.view.addSubview(button!)
        self.view.addSubview(logo!)
        
    }
    
    func buttonClick(){
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseIn,
                       animations: {
                        self.logo?.center.x  += 100
                                        },
                       completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
