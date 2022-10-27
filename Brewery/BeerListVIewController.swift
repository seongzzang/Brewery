//
//  BeerListVIewController.swift
//  Brewery
//
//  Created by 양성혜 on 2022/10/27.
//

import UIKit


class BeerListViewController: UITableViewController {
    
    var beerList = [Beer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //UINavigationBar
        title = "브루어리"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //UITableView 설정
        tableView.register(BeerListCell.self, forCellReuseIdentifier: "BeerListCell")
        tableView.rowHeight = 150
    }
    
}

//UITableView DataSource, Delegate
extension BeerListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListCell", for:indexPath) as? BeerListCell else {return UITableViewCell()}
        
        let beer =  beerList[indexPath.row]
        cell.configure(with: beer)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBeer = beerList[indexPath.row]
        let detailViewController = BeerDetailViewController()
        
        detailViewController.beer = selectedBeer
        self.show(detailViewController, sender: nil)
    }
}
