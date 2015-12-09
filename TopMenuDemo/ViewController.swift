//
//  ViewController.swift
//  TopMenuDemo
//
//  Created by 杨洋 on 15/12/9.
//  Copyright © 2015年 Sheepy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var topImage: UIImageView!
    var button: UIButton!
    
    let cellId = "Cell"
    let cellText = "I am a cell."

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
        initTopImage()
        initButton()
    }
    
    func initTableView() {
        tableView = UITableView(frame: MainBounds, style: .Grouped)
        tableView.contentInset.top = TopBorder
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        view.addSubview(tableView)
    }
    
    func initTopImage() {
        topImage = UIImageView(frame: CGRect(x: 0, y: 0, width: Width, height: ImageH))
        topImage.backgroundColor = UIColor.greenColor()
        
        view.addSubview(topImage)
    }
    
    func initButton() {
        let btnW = Width
        let btnY = TopBorder - BtnH
        button = UIButton(frame: CGRect(x: 0, y: btnY, width: btnW, height: BtnH))
        button.backgroundColor = UIColor.yellowColor()
        
        view.addSubview(button)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId)!
        
        cell.textLabel?.text = cellText
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < -BtnH {
            button.frame.origin.y = -offsetY - BtnH
            topImage.frame.origin.y = -(TopBorder + offsetY)
        } else if button.frame.origin.y != 0 {
            button.frame.origin.y = 0
            topImage.frame.origin.y = -ImageH
        }
    }
}

