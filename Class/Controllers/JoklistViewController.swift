//
//  JoklistViewController.swift
//  CellToFit-Swift
//
//  Created by ddSoul on 16/12/1.
//  Copyright © 2016年 dxl. All rights reserved.
//

import UIKit
import Alamofire

protocol testProtocol {
    func test()
}

extension testProtocol where Self: UIViewController {
    func test() {
        //在这里加默认实现，并提供ErrorView的默认参数。
        print("测试面向-协议");
    }
}
//class KrakenViewController: UIViewController, testProtocol {
//    func methodThatHasAnError() {
//        //…
//        //抛出error，原因是Kraken海妖今天吃人会感到不适。
//        presentError() //Woohoo! 没有参数了！我们现在有默认实现了！
//    }
//}

class JoklistViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,testProtocol {

    var tablewView : UITableView?
    var jokListData: NSMutableArray = NSMutableArray()
    var pageNum    : NSInteger = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageNum = 1
        initUI()
        createViews()
        requestList()
//        test()
        // Do any additional setup after loading the view.
    }
    
    func initUI()
    {
        self.view.backgroundColor = UIColor.white
        self.title = "jokList"
    }
    
    func createViews(){
        
        self.tablewView = UITableView()
        self.tablewView?.rowHeight = UITableViewAutomaticDimension
        self.tablewView?.estimatedRowHeight = 88

        self.tablewView?.delegate = self
        self.tablewView?.dataSource = self
        self.tablewView?.showsVerticalScrollIndicator = false
        self.tablewView?.register(JokCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tablewView!)
        
        self.tablewView?.snp.makeConstraints({ (make) in
            make.top.left.right.bottom.equalTo(0)
        })
    
        self.view.makeToastActivity(.center)
        self.tablewView?.addRefreshHeaderWithBlock {
            self.view.makeToastActivity(.center)
            print("下拉刷新")
            self.pageNum = 1
            self.jokListData.removeAllObjects()
            self.tablewView?.reloadData()
            self.requestList()
        }
        self.tablewView?.addLoadMoreFooterWithBlock {
            self.view.makeToastActivity(.center)
            print("上拉加载")
            self.pageNum = 2
            self.requestList()
        }
//

    }
    
    func requestList()
    {
        Alamofire.request("http://apis.baidu.com/showapi_open_bus/showapi_joke/joke_text", method:.get, parameters: ["page":pageNum,"num":"10"],headers:["apikey":"eb0d7633268c4e4d346bd6cfa57a47e5"]).responseJSON{
            response in
            if let json = response.result.value {
                
                let dic = JSON(json)
                let sourdata = dic["showapi_res_body"]["contentlist"].array
                for value in sourdata!
                {
                    print("model:\(value)")
                    var model :JokModel
                    model = JokModel()
                    model.text = String(describing: value["text"])
                    self.jokListData.add(model)
                    
                }
                self.tablewView?.reloadData()
                self.view.hideToastActivity()
            }
            self.tablewView?.endRefreshHeaderWithBlock {
                print("下拉结束")
            }
            //
            self.tablewView?.endLoadMoreFooterWithBlock {
                print("上拉结束")
            }

        }

    }

    // MARK: - Table view delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablewView?.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JokCell
        let jokM = self.jokListData[indexPath.row]
        cell.setModel(model:jokM as! JokModel )
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokListData.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
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
