//
//  SearchViewController.swift
//  LocationSearch
//
//  Created by Oguz Demırhan on 19.01.2021.
//

import UIKit
import CoreLocation

protocol SearchViewControllerDelegate: AnyObject{
    func searchViewController(_ vc: SearchViewController,didSelectLocationWith coordinates:CLLocationCoordinate2D?)
}

class SearchViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    weak var delegate: SearchViewControllerDelegate?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = locations[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        cell.contentView.backgroundColor = .secondarySystemBackground
        cell.backgroundColor = .secondarySystemBackground
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let coordinate = locations[indexPath.row].coordinates
        
        delegate?.searchViewController(self, didSelectLocationWith: coordinate)
    }
    
    
    
    
    private let label: UILabel = {
        
        let label = UILabel()
        label.text = "Where To?"
        label.font = .systemFont(ofSize: 24, weight:.semibold)
        
        return label
    }()
    
    private let field: UITextField = {
       let field = UITextField()
        field.placeholder = "Please Enter Destination"
        field.layer.cornerRadius = 9
        field.backgroundColor = .tertiarySystemBackground
        field.leftView = UIView(frame: CGRect(x: 0, y:0, width: 10,height: 50))
        field.leftViewMode = .always
    
        
        return field
    }()
    
    private let tableView: UITableView = {
       
        let table = UITableView()
        table.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        
        return table
        
    }()
    
    var locations = [Location]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(label)
        view.addSubview(field)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .secondarySystemBackground
        field.delegate = self

    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        label.sizeToFit()
        label.frame = CGRect(x:10, y: 10, width: label.frame.size.width, height: label.frame.size.height)
        field.frame = CGRect(x: 10, y: 20+label.frame.size.height, width: view.frame.size.width-2, height: 50)
        let tableY: CGFloat = field.frame.origin.y+field.frame.size.height+5
        tableView.frame = CGRect(x: 0, y: tableY, width: view.frame.size.width, height: view.frame.size.height-tableY)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        field.resignFirstResponder()
        
        if let text = field.text, !text.isEmpty {
            LocationManager.shared.findLocations(with: text) { [weak self] locations in
                
                
                DispatchQueue.main.async {
                    self?.locations = locations
                    self?.tableView.reloadData()
                }
                
                
                
            }
        }
        return true
    }
    
}
