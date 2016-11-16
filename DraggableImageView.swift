//
//  DraggableImageView.swift
//  tindr
//
//  Created by Minnie Lai on 11/10/16.
//  Copyright © 2016 minnie. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var draggableImageView: UIImageView!
    var imageCenter: CGPoint!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageCenter = CGPoint(x: draggableImageView.frame.midX, y: draggableImageView.frame.midY)
        initSubviews()
    }
    
    var image: UIImage? {
        get { return draggableImageView.image }
        set { draggableImageView.image = newValue }
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
    }
    
    override func awakeFromNib() {
        imageCenter = CGPoint(x: draggableImageView.frame.midX, y: draggableImageView.frame.midY)
        let recognizer = UIPanGestureRecognizer.init(target: self, action: #selector(self.onPan))
        contentView.addGestureRecognizer(recognizer)
    }
    
    @IBAction func onPan(_ panGestureRecognizer: UIPanGestureRecognizer) {
        let point = panGestureRecognizer.location(in: superview)
        
        let velocity = panGestureRecognizer.velocity(in: superview)
        if panGestureRecognizer.state == .changed {
            let translation = panGestureRecognizer.translation(in: superview)
            print("Gesture changed at: \(point)")
            draggableImageView.center = CGPoint(x: imageCenter.x + translation.x, y: imageCenter.y)
            transform = CGAffineTransform(rotationAngle: velocity.x / 20 * CGFloat.pi / 180.0)
            draggableImageView.transform = transform
        }
    }
}
extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / .pi }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}


