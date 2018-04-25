//
//  ViewController.swift
//  Constriants
//
//  Created by Shannen Bravo-Brown on 4/23/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let IV = UIImageView()
        IV.image = UIImage(named: "bg")
        IV.contentMode = .scaleAspectFill
        IV.translatesAutoresizingMaskIntoConstraints = false
        return IV
        
    }()
    
    let appleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "apple").withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(swtichToController), for: .touchUpInside)
        return button;
        
    }()
    
    
    let grapeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "grape").withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(swtichToController), for: .touchUpInside)
        return button;
        
    }()
    
    let lemonButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "lemon").withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(swtichToController), for: .touchUpInside)
        return button;
        
    }()
    
    let berryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "berry").withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(swtichToController), for: .touchUpInside)
        return button;
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
   
    func setupView(){
        let stackView = UIStackView(arrangedSubviews: [appleButton,
                                                       grapeButton,
                                                       lemonButton,
                                                       berryButton])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 50
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundImageView)
        view.addSubview(stackView)
        
        backgroundImageView.pinTodEdges(view: self.view)
        stackView.anchor(top: view.safeTopAnchor, left: view.safeLeftAnchor, right: view.safeRightAnchor, bottom: view.safeBottomAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20, paddingBottom: -20)

    }
    @objc func swtichToController(){
        let detailVC = DetailVC()
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

}

extension UIView{
    
    func pinTodEdges(view: UIView) {
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor? , right: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingRight: CGFloat, paddingBottom: CGFloat, width: CGFloat = 0, height: CGFloat = 0){

        self.translatesAutoresizingMaskIntoConstraints = false

        if let top = top{
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }

        if let left = left{
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }

        if let right = right{
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }

        if let bottom = bottom{
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }

        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }

    }
    


    //safe anchors
    var safeTopAnchor: NSLayoutYAxisAnchor{
        //if running ios 11
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }

    var safeLeftAnchor: NSLayoutXAxisAnchor{
        //if running ios 11
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.leftAnchor
        }
        return leftAnchor
    }

    var safeRightAnchor: NSLayoutXAxisAnchor{
        //if running ios 11
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.rightAnchor
        }
        return rightAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor{
        //if running ios 11
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }
}

