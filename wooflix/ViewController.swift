//
//  ViewController.swift
//  wooflix
//
//  Created by 여누 on 6/4/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBarButton()
    }
    func configureBarButton() {
        let item1 = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(starButtonClicked))
        
        navigationItem.leftBarButtonItem = item1
        
        let item2 = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(heartButtonClicked))
        
        navigationItem.rightBarButtonItem = item2
    }
    
    @objc func starButtonClicked() {
        let vc = MovieViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func heartButtonClicked() {
        let vc = SignViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

