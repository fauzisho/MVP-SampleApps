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
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var viewLoading: UIView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cars"
        presenter.attachView(view: self)
        tableView.dataSource = self
        tableView.delegate =  self
        tableView.register(CarCell.nib,
                           forCellReuseIdentifier: CarCell.identifier)
     
        presenter.getCars()
        addButton.addTarget(self, action: #selector(addCarTarget(_:)), for: .touchUpInside)
    }
   @objc func addCarTarget(_ car : UIButton){
    let addCarVC = AddCarVC()
    self.navigationController?.pushViewController(addCarVC, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.getCars()
    }
}

extension ListCarVC  : ListCarView {
    func showFailed(message: String) {
        print("error : \(message)")
    }
    
    func displayLoading(message: String) {
        viewLoading.isHidden = false
        indicatorView.startAnimating()
        tableView.isHidden = true
    }
    
    func dismissLoading() {
        viewLoading.isHidden = true
        indicatorView.stopAnimating()
        tableView.isHidden = false
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
        cell.buttonDelete.id  = data.id
        cell.buttonDelete.addTarget(self, action: #selector(deleteTarget(_:)), for: .touchUpInside)
        return cell
    }
    @objc func deleteTarget(_ delete : DeleteButton){
        presenter.deleteCar(id: delete.id!)
    }
}

extension ListCarVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = self.cars[indexPath.row]
        let carDetail = CarDetailVC()
        carDetail.car = car
        self.navigationController?.pushViewController(carDetail, animated: true)
    }
}
