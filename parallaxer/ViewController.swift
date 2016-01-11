//
//  ViewController.swift
//  parallaxer
//
//  Created by Sebastian Drew on 1/11/16.
//  Copyright © 2016 withcovertvalue. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var calendarFeedImage: UIImageView!
    @IBOutlet weak var cityImageView: UIView!
    @IBOutlet weak var cityImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = calendarFeedImage.image!.size
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
        func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
         
            let currentOffset = scrollView.contentOffset.y
            let finalOffset = scrollView.contentSize.height - scrollView.frame.height
            
            print("Current offset \(currentOffset) - final offset \(finalOffset)")
            
            let yPosition = convertValue(currentOffset, r1Min: 0, r1Max: 260, r2Min: -86, r2Max: -50)
            
            cityImage.frame.origin.y = yPosition
            
    }


    
    
    func convertValue(value: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
        let ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }


}

