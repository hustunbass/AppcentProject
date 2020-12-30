//
//  PopUpViewController.swift
//  AppcentDemo
//
//  Created by Hakan Üstünbaş on 24.12.2020.
//

import UIKit
import SDWebImage

class PopUpViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var photoDate: UILabel!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var cameraName: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var launchDate: UILabel!
    @IBOutlet weak var landingDate: UILabel!
    @IBOutlet weak var backView: UIView!
    
    
    var spaceImageUrl : String!
    var pictureDate : String!
    var car : String!
    var camera : String!
    var currentStatus : String!
    var launch : String!
    var landing : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        image.sd_setImage(with: URL(string: spaceImageUrl))
        photoDate.text = pictureDate
        carName.text = car
        cameraName.text = camera
        status.text = currentStatus
        launchDate.text = launch
        landingDate.text = landing
   
    }
    
    func configureUI(){
        
        backView.layer.cornerRadius = 15
        backView.layer.borderColor =  CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        backView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.85)
        backView.layer.borderWidth = 1
        
        image.layer.cornerRadius = 15
        image.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        image.layer.borderWidth = 1
   
    }
    
    


}
