//
//  HomeViewController.swift
//  CellToFit-Swift
//
//  Created by ddSoul on 16/12/21.
//  Copyright © 2016年 dxl. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBAction func button_1(_ sender: UIButton) {
        
        let pushVc :JoklistViewController = JoklistViewController()
        self.navigationController?.pushViewController(pushVc, animated: true)
    }

    @IBAction func button_2(_ sender: UIButton) {
        
        let pushVc :AnimationController = AnimationController()
        self.navigationController?.pushViewController(pushVc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
