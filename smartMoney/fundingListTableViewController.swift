import UIKit

class fundingListTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "background")
        let imageView = UIImageView(image : backgroundImage)
        imageView.contentMode = .scaleAspectFill
        self.tableView.backgroundView = imageView
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // 셀들 구성
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fundingList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fundingCell", for: indexPath)
        
        let item = fundingList[indexPath.row]
        cell.backgroundColor = UIColor(white : 1, alpha : 0.5)
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.dueDate
        
        
        return cell
    }
    
    // fundingInfo씬에 정보 넘겨주기 준비
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow,
            let detailVC = segue.destination as? fundingInfoController{
            let selectedfund : Funding = fundingList[indexPath.row]
            detailVC.getFunding = selectedfund
        }
    }
    
    
    
    
}

