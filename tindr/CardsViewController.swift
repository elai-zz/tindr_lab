//
//  CardsViewController.swift
//  tindr
//
//  Created by Minnie Lai on 11/10/16.
//  Copyright © 2016 minnie. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!
    var imageCenter: CGPoint!
    
    @IBOutlet weak var draggableImageView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        draggableImageView.image = UIImage(named: "ryan")
        self.view.addSubview(draggableImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

