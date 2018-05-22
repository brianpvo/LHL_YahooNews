//
//  ViewController.swift
//  YahooNews
//
//  Created by Brian Vo on 2018-05-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var newsItem = [NewsItem]()
    private let kTableHeaderHeight: CGFloat = 300.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
//        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
        
        let formatter = DateFormatter()
        formatter.timeZone = .none
        formatter.dateStyle = .medium
        dateLabel.text = formatter.string(from: Date())
    
        let world = NewsItem.init(category: Categories.World, headline: "Climate change protests, divestments meet fossil fuels realities")
        let americas = NewsItem.init(category: Categories.Americas, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        let europe = NewsItem.init(category: Categories.Europe, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'")
        let middleEast = NewsItem.init(category: Categories.MiddleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
        let africa = NewsItem.init(category: Categories.Africa, headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
        let asia = NewsItem.init(category: Categories.Asia, headline: "Despite UN ruling, Japan seeks backing for whale hunting")
        let world2 = NewsItem.init(category: Categories.World, headline: "South Africa in $40 billion deal for Russian nuclear reactors")
        let europe2 = NewsItem.init(category: Categories.Europe, headline: "'One million babies' created by EU student exchanges")
        
        newsItem += [world, europe, middleEast, africa, asia, americas, world2, europe2]
    }
    
    func updateHeaderView() {
        var transform = CGAffineTransform(translationX: 0, y: 0)
        dateLabel.transform = transform
        if tableView.contentOffset.y < 0 {
            
            transform = CGAffineTransform(translationX: 0, y: tableView.contentOffset.y/3.0)
            
            let scale = 1 + -(tableView.contentOffset.y/kTableHeaderHeight)
            transform = transform.concatenating(CGAffineTransform(scaleX: scale, y: scale))
            
//            transform = transform.concatenating(CGAffineTransform(rotationAngle: CGFloat.pi*tableView.contentOffset.y/100.0))
        }
        
        let imageView = headerView.subviews[0]
        imageView.transform = transform
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yahooCell") as! YahooTableViewCell
        cell.categoryLabel.textColor = newsItem[indexPath.row].category.color()
        cell.categoryLabel.text = newsItem[indexPath.row].category.string()
        cell.headlineLabel.text = newsItem[indexPath.row].headline
        return cell
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}

