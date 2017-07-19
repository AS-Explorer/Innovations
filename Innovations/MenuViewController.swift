//
//  MenuViewController.swift
//  Innovations
//
//  Created by AFSHA on 17/07/17.
//  Copyright © 2017 Afsha. All rights reserved.
//

import UIKit

enum MenuType : Int{
    case AnimationLabelBorder
    case SemiCicularBorderView
    case CustomTextFieldView
}

class MenuViewController: UIViewController {

    @IBOutlet weak var menuTableView : UITableView!
    var menuContent : [MenuType] = [.AnimationLabelBorder, .SemiCicularBorderView, .CustomTextFieldView]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.title = "MENU";
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func instantiateVCFor(contentType : MenuType){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch contentType {
            case .AnimationLabelBorder:
                guard let controller = storyboard.instantiateViewController(withIdentifier: "LabelBorderAnimationVC") as? LabelBorderAnimationVC else { fatalError() }
                self.navigationController?.pushViewController(controller, animated: true)
            break
            
            case .SemiCicularBorderView:
                guard let controller = storyboard.instantiateViewController(withIdentifier: "CustomBorderViewVC") as? CustomBorderViewVC else { fatalError() }
                self.navigationController?.pushViewController(controller, animated: true)
            break
            
            case .CustomTextFieldView:
                guard let controller = storyboard.instantiateViewController(withIdentifier: "SwiftVC") as? SwiftViewController else { fatalError() }
                self.navigationController?.pushViewController(controller, animated: true)
            break
        }
    }
}

extension MenuViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") ?? UITableViewCell.init(style: .default, reuseIdentifier: "menuCell")
        switch menuContent[indexPath.row] {
            case .AnimationLabelBorder:
                cell.textLabel?.text = "AnimationLabelBorder"
            break
            
            case .SemiCicularBorderView:
                cell.textLabel?.text = "SemiCicularBorderView"
            break
            
            case .CustomTextFieldView:
                cell.textLabel?.text = "CustomTextFieldView"
            break
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.instantiateVCFor(contentType: menuContent[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    
}
