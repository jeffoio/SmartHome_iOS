//
//  HomeViewController.swift
//  SmartHome
//
//  Created by jeff on 2020/06/04.
//  Copyright © 2020 TakHyun Jung. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var airSwitch: UISwitch!
    @IBOutlet weak var roomSwitch: UISwitch!
    @IBOutlet weak var bedSwitch: UISwitch!
    @IBOutlet weak var airLowToggleBtn: UIButton!
    @IBOutlet weak var airHighToggleBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Switch resize
        airSwitch.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        roomSwitch.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        bedSwitch.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        
    }
    
   
    @IBAction func airLowToggleBtn(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    @IBAction func airHighToggleBtn(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
}
//View에 Border 추가
extension CALayer {
    func addBorder(arrEdge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arrEdge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
            default:
                break
            }
            border.backgroundColor = color.cgColor
            self.addSublayer(border)
        }
    }
}
