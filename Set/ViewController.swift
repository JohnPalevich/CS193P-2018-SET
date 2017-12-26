//
//  ViewController.swift
//  Set
//
//  Created by John Palevich on 12/25/17.
//  Copyright © 2017 John Palevich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game = Set()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpBoard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func addCards(_ sender: UIButton) {
        
    }
    func setUpBoard(){
        for iterator in 0..<12{
            cardButtons[iterator].backgroundColor = UIColor.red
        }
        for iterator in 12..<24{
            cardButtons[iterator].backgroundColor = UIColor.clear
            cardButtons[iterator].setTitle("", for: .normal )
        }
    }
    
}

