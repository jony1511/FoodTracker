//
//  RatingView.swift
//  FoodTracker
//
//  Created by HF on 5/14/16.
//  Copyright © 2016 HF. All rights reserved.
//

import UIKit

@objc protocol RatingViewDelegate: NSObjectProtocol{
     func ratingButtonTapped(button: UIButton)->Void
}

class RatingView: UIView {
    // MARK: Properties
    var ratingButtons = [UIButton]()
    var rating = 0{
        didSet{
            setNeedsLayout()
        }
    }
    let buttonNum = 5
    let spacing = 5
    var buttonSize: Int?
    var delegate: RatingViewDelegate?
    
    // MARK: Initialization
    // Failable Init, attached to playboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        buttonSize = Int(frame.size.height)
        for _ in 1...buttonNum{
            let button = UIButton(frame: frame)
    //      button.backgroundColor = UIColor.redColor()
            button.addTarget(self, action: #selector(ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            ratingButtons += [button]
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            button.adjustsImageWhenHighlighted = false
            addSubview(button)
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: buttonSize!)
    }
    
    override func layoutSubviews() {
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize!, height: buttonSize!)
        for (index, button) in ratingButtons.enumerate(){
            buttonFrame.origin.x = CGFloat(index*(buttonSize!+spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    
    // MARK: RatingButtonTapped
    func ratingButtonTapped(button: UIButton){
        let index = ratingButtons.indexOf(button)!
        if button.selected == true && index<rating{
            rating = index
        }
        else{
            rating = index+1
        }
    }
    
    func updateButtonSelectionStates(){
        for(index, button) in ratingButtons.enumerate(){
            button.selected = (index<rating)
        }
    }
}
