//
//  ViewController.swift
//  VM_app
//
//  Created by Abbut John on 08/10/2022.
//

import UIKit

class VmContactsViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var activityView    : UIActivityIndicatorView?
    private var viewModel       : VmContactsViewModel?
    
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let details = self.viewModel?.contatcs[viewModel!.selectedIndex] {
            guard let myViewController = segue.destination as? VmContactDetailsViewController else { return }
            myViewController.viewModel = VmContactDetailsViewModel(contact: details)
        }
    }
}

//MARK: TableViewcontroller

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
        
        if (self.viewModel?.contatcs[indexPath.row]) != nil {
            
            viewModel?.selectedIndex = indexPath.row
            self.performSegue (withIdentifier: "ShowDetail", sender: self)

        }
    }
}

extension VmContactsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.searchContacts(str: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
