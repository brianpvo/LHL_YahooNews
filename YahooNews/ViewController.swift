//
//  ViewController.swift
//  YahooNews
//
//  Created by Brian Vo on 2018-05-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit

struct NewsItem {
    var category: Categories
    var headline: String
}

enum Categories {
    case World, Americas, Europe, MiddleEast, Africa, Asia
    
    func string() -> String {
        switch self {
        case .World:
            return "World"
        case .Americas:
            return "Americas"
        case .Europe:
            return "Europe"
        case .MiddleEast:
            return "Middle East"
        case .Africa:
            return "Africa"
        case .Asia:
            return "Asia"
        }
    }
    
    func color() -> UIColor {
        switch self {
        case .World:
            return UIColor.red
        case .Americas:
            return UIColor.blue
        case .Europe:
            return UIColor.green
        case .Africa:
            return UIColor.orange
        case .Asia:
            return UIColor.purple
        case .MiddleEast:
            return UIColor.yellow
        }
    }
}

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var newsItem = [NewsItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    
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

}

