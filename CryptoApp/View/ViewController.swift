//
//  ViewController.swift
//  CryptoApp
//
//  Created by Andrew  on 3/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        self.colorArray = [
            UIColor(red: 0.2, green: 0.33, blue: 0.12, alpha: 1.0),
            UIColor(red: 0.44, green: 0.11, blue: 0.012, alpha: 1.0),
            UIColor(red: 0.877, green: 0.65, blue: 0.9564, alpha: 1.0),
            UIColor(red: 0.211, green: 0.436, blue: 0.11, alpha: 1.0),
            UIColor(red: 0.76, green: 0.3333, blue: 0.457, alpha: 1.0),
            UIColor(red: 0.124, green: 0.675, blue: 0.235, alpha: 1.0)
        ]
        getData()
    }
    
    func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        
        WebService().downloadCurrencies(url: url!) { cryptos in
            if let cryptos = cryptos {
                
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceLabel.text = cryptoViewModel.price
        cell.nameLabel.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        cell.priceLabel.textColor = UIColor.white
        cell.nameLabel.textColor = UIColor.white
        return cell
    }


}

