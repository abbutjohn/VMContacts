//
//  ViewController.swift
//  VM_app
//
//  Created by Abbut John on 08/10/2022.
//

import UIKit

class VmContactsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var activityView: UIActivityIndicatorView?
    private var viewModel : VmContactsViewModel?


    //MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        self.bindViewModel()
        self.showActivityIndicator()
    }

    //MARK: Binding with ViewModel
    
    func bindViewModel(){
        self.viewModel =  VmContactsViewModel()
        self.viewModel?.loadData = { [weak self] in
            self?.tableView.reloadData()
        }
        self.viewModel?.hideActivityIndicator = { [weak self] in
            self?.hideActivityIndicator()
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
}

//MARK: TableViewcontroller

@available(iOS 13.0, *)
extension VmContactsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel?.contatcs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VmPeopleTableViewCell") as! VmContatcTableViewCell
        
        if let conatct = self.viewModel?.contatcs[indexPath.row] {
            
            cell.nameLabel?.text        = self.viewModel?.getFullContatctName(contact: conatct)
            cell.avatarUrl              = conatct.avatar
           
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            
        if let details = self.viewModel?.contatcs[indexPath.row] {
            
            let viewController = UIStoryboard(name: "Contacts", bundle: nil).instantiateViewController(
                identifier: "VmContactDetailsViewController",
                creator: { coder in
                    VmContactDetailsViewController(viewModel: VmContactDetailsViewModel(contact: details), coder: coder)
                }
            )
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
