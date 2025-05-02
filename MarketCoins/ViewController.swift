//
//  ViewController.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 28/04/25.
//

import UIKit

class ViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup() {
        preconditionFailure("This method must be overridden")
    }
    
    func showError(message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { action in
            exit(0)
        }))
        
        alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: handler))
        
        present(alert, animated: true)
    }
}

