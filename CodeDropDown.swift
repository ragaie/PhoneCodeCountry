//
//  CodeDropDown.swift
//  CountryPhoneCodePicker
//
//  Created by Ragaie alfy on 9/24/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit



extension UIResponder {
    func owningViewController() -> UIViewController? {
        var nextResponser = self
        while let next = nextResponser.next {
            nextResponser = next
            if let vc = nextResponser as? UIViewController {
                return vc
            }
        }
        return nil
    }
}



public protocol CodeDropDownDelegate {
    
    
    func codeDropDown(_ codeDropDown: CodeDropDown, didSelectItem country: Country)
    
    
}

@objc
@IBDesignable open  class CodeDropDown: UIView ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var flageIcon: UIImageView!
    
    @IBOutlet weak var actionButton: UIButton!
    
    
    @IBOutlet weak var codeLabel: UILabel!

    public var delegate : CodeDropDownDelegate!

    private  var tableData : UITableView!
    private  var filterTable : UITableView!
    private  var showDrop : Bool! = false
    private var containerView : UIView!
    private var countries: [Country] = []
    
    var allCountries : [Country]! = []
    private var searchChar : [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    private  var tapGesture :UITapGestureRecognizer! // =
    
    public var resIdentifier : String!
    
    
    @IBInspectable public  var restIdentifier: String? {
        didSet {
            resIdentifier = restIdentifier
        }
    }
    
    
    @IBInspectable public  var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
            
        }
    }
    
    
    @IBInspectable public var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var borderColor: UIColor = UIColor.blue {
        didSet {
            
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    //MARK: Initializers
    override public init(frame : CGRect) {
        super.init(frame : frame)
        initSubviews()
    }
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
        initActionAndDelegete()
        
    }
 
    
    
    
    
    
    public func initSubviews() {
        
        let bundle = Bundle(for: type(of: self))
        
        
        let nib = UINib(nibName: "CodeDropDown", bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        // to make view fit view in design you welcome.
        view.frame = self.bounds

        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        // nib.contentView.frame = bounds
        codeLabel.adjustsFontSizeToFitWidth = true
        addSubview(view)
        
        codeLabel.adjustsFontSizeToFitWidth = true
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(CodeDropDown.tapBlurButton(_:)))

        // custom initialization logic
        
    }
  
    // add action of dropDown
    func initActionAndDelegete()  {
        
        
        actionButton.addTarget(self, action: #selector(CodeDropDown.showCountryCodes(_:)), for: .touchUpInside)
        
        //load all countries from json file
        allCountries =   self.getAllCountries()
        
       countries =  allCountries
    }

  

    @objc func showCountryCodes(_ sender : UIButton){
        
            if showDrop == true {
                
                containerView.removeFromSuperview()
                showDrop = false
            }
            else{
                if containerView == nil {
                    
                     containerView  = UIView(frame: CGRect.init(x: frame.minX - 10 , y: frame.minY - 5, width: frame.width + 20  , height: UIScreen.main.bounds.height / 2))

                    
                    tableData  = UITableView.init(frame: CGRect.init(x: 0   , y: 0 , width: frame.width - 10  , height: UIScreen.main.bounds.height / 2))
                    //register table nib file 
                    
                    filterTable  = UITableView.init(frame: CGRect.init(x: tableData.frame.maxX  , y: tableData.frame.minY, width: 20, height: tableData.frame.height ))
                    
                    filterTable.showsVerticalScrollIndicator = false
                    filterTable.separatorStyle = .none

                    filterTable.dataSource = self
                    filterTable.delegate = self
                    filterTable.tag = 1
                    
                    
                    tableData.register(UINib(nibName: "CodeTableCell", bundle: nil), forCellReuseIdentifier: "cellID")

                    
                    tableData.layer.zPosition = 1
                    tableData.layer.cornerRadius = 3
                    tableData.separatorStyle = .none
                    tableData.dataSource = self
                    tableData.delegate = self
                    
                    tableData.showsVerticalScrollIndicator = false

                    tableData.layer.borderColor = UIColor.white.cgColor
                    tableData.layer.borderWidth = 0.5
                    
                    
            //////// create shadow for tableView
                        let rectTemp = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height)
                    
                        containerView.layer.shadowColor = UIColor.darkGray.cgColor
                        containerView.layer.shadowOpacity = 0.5
                        containerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0) //CGSize.zero
                        containerView.layer.shadowRadius = 9
                        
                        containerView.layer.shadowPath = UIBezierPath(rect: rectTemp).cgPath
                        containerView.layer.shouldRasterize = false
                  
                        containerView.clipsToBounds = false
                    
                    

                }
 
               // tableData.backgroundView?.addSubview(filterTable)
                containerView.addSubview(tableData)
                containerView.addSubview(filterTable)
                self.owningViewController()?.view.addSubview(containerView)
                
                
               
                showDrop = true
            }
  
    }
    
    
    
    
    //// table view data source
    
    
    
    
    public func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        
        if tableView.tag == 0 {
                flageIcon.image = UIImage.init(named: countries[indexPath.row].code)
        
                codeLabel.text =   "+" + countries[indexPath.row].dial_code
        
                if delegate != nil {
        
                    self.delegate.codeDropDown(self, didSelectItem: countries[indexPath.row])
        
                }


                containerView.removeFromSuperview()
                showDrop = false
            }
        else{
        
                    filterContentForSearchText(searchText: searchChar[indexPath.row])
        
        }
     
    }
    
    
    
    
    public func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if tableView.tag == 0 {
        
            return countries.count
            
        }
        else{
        
            return searchChar.count
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        if tableView.tag == 0 {
            
          
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! CodeTableCell

        cell.codeLabel.text = "+" + countries[indexPath.row].dial_code
        cell.flageImage.image = UIImage.init(named: countries[indexPath.row].code)
        cell.codeLabel.adjustsFontSizeToFitWidth = true
        return cell
            
            
        }
        else{
            
            var cell : UITableViewCell! = UITableViewCell.init(frame: CGRect.init(x: 0, y: 0, width: 10, height: 15 ))
          
            cell.textLabel?.text = searchChar[indexPath.row]
            
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 12)
            
            return cell
        
        
        }
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
   public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    
    
    if tableView.tag == 0 {
        return 35
    }
    else{
    return 18
    
    }
    
    
    }
    
    
    @objc func tapBlurButton(_ sender: UITapGestureRecognizer) {
        print("Please Help!")
        
        
        
        if showDrop == true {
            
            
            containerView.removeFromSuperview()
            showDrop = false
            
        }
    }
    
   
    
    
    
    
    
    
    
    
    
    
    
    
   private func getAllCountries()-> [Country]  {
        var countries: [Country] = []
      
        do {
            if let file = Bundle.main.url(forResource: "countryCodes", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let array = json as? Array<[String: String]> {
                    for object in array {
                        guard let code = object["code"],
                            let phoneExtension = object["dial_code"],
                            let formatPattern = object["format"],let name = object["name"] else {
                                fatalError("Must be valid json.")
                        }
                        
                        countries.append(Country(countryCode: code,
                                                 phoneExtension: phoneExtension,
                                                 formatPattern: formatPattern,name : name))
                    }
                }
            } else {
                print("countryCodePicker can't find a bundle for the countries")
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return countries
    }
    
    
    
    func filterContentForSearchText(searchText: String) {
            countries = []
        
            let   filterdTerms = allCountries.filter { term in
                
                return   term.name.lowercased().first   == searchText.lowercased().first
     
                }
        
        
//        for item in allCountries {
//        
//        
//            if String.init( (item.name.lowercased())[0] )  == searchText.lowercased(){
//            
//            
//            
//            }
//        }
//        
        countries = filterdTerms
        tableData.reloadData()
        

    }

    

    

}




    
