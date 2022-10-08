//
//  VmContactDetailsViewController.swift
//  VM_app
//
//  Created by Abbut John on 08/10/2022.
//

import UIKit


class VmContactDetailsViewController: UIViewController {
    
    var viewModel : VmContactDetailsViewModel
    
    
    init?(viewModel: VmContactDetailsViewModel, coder: NSCoder) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    @available(*, unavailable, renamed: "init(viewModel:coder:)")
    required init?(coder: NSCoder) {
        fatalError("Invalid way of decoding this class")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tableView: UITableView!
    
}
//MARK: TableViewcontroller

extension VmContactDetailsViewController: UITableViewDataSource, UITableViewDelegate{
    
  
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.viewModel.getSectionsCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.getRowsInSectionCount(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "VmContactImageTableviewCell") as! VmContactImageTableviewCell
            
            cell.nameLabel?.text        =   self.viewModel.getFullContatctName()
            cell.avatarUrl              =   self.viewModel.getAvatarName()
            
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VmContactLabelTableViewCell") as! VmContactLabelTableViewCell
            
            cell.nameLabel?.text        =   self.viewModel.getNameAndValue(indexPath: indexPath).0
            cell.valuLabel?.text        =   self.viewModel.getNameAndValue(indexPath: indexPath).1
            
            return cell
       
        }
    }
}
