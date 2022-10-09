//
//  VmRoomsViewController.swift
//  VM_app
//
//  Created by Abbut John on 08/10/2022.
//

import UIKit

class VmRoomsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var activityView: UIActivityIndicatorView?
    private var viewModel : VmAvailableRoomViewModel?
    

    //MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Occupied",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(addTapped))

        self.bindViewModel()
        self.title = "Rooms"
        self.showActivityIndicator()
    }

    //MARK: Binding with ViewModel
    
    func bindViewModel(){
        self.viewModel =  VmAvailableRoomViewModel()
        self.viewModel?.loadData = {
            self.tableView.reloadData()
        }
        self.viewModel?.hideActivityIndicator = {
            self.hideActivityIndicator()
        }
    }
    
    //MARK: Funtions

    func showActivityIndicator() {
        
        activityView            = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activityView?.center    = self.view.center
        activityView?.color     = .systemBlue
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }
    
    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    
    @objc func addTapped(){
        
        self.viewModel?.filterOccupied(filter: !viewModel!.filterStatus )
        self.viewModel!.filterStatus  = !viewModel!.filterStatus

    }
    
}
//MARK: TableViewcontroller

extension VmRoomsViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.viewModel?.rooms.count ?? 0
    }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel!.getRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VmRoomTableViewCell") as! VmRoomTableViewCell
                    
        if let details =  self.viewModel?.rooms[indexPath.section] {
            
            cell.nameLabel?.text        =   self.viewModel?.getNameAndValue(room: details, indexPath: indexPath).0
            cell.valueLabel?.text       =   self.viewModel?.getNameAndValue(room: details, indexPath: indexPath).1
            
        }
        return cell
        
    }
}

