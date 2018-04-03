//
//  ListCarVC.swift
//  SimpleMVP
//
//  Created by UziApel on 03/04/18.
//  Copyright © 2018 UziEngine. All rights reserved.
//

import UIKit

class ListCarVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter : ListCarPresenter = ListCarPresenter()
    var cars : [Car] = [Car]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cars"
        presenter.attachView(view: self)
        tableView.dataSource = self
        tableView.register(CarCell.nib,
                           forCellReuseIdentifier: CarCell.identifier)
     
        presenter.getCars()
        
        
    }
}

extension ListCarVC  : ListCarView {
    func displayLoading(message: String) {
        
    }
    
    func dismissLoading() {
        
    }
    
    func showListCar(listCar: [Car]) {
        print("Cars \(listCar)")
        cars = listCar
        self.tableView.reloadData()
    }
}
extension ListCarVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarCell.identifier, for: indexPath) as! CarCell
        let data = self.cars[indexPath.row]
        cell.labelName.text = data.model
        return cell
        
    }
}
