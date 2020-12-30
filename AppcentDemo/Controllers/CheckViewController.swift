//
//  CheckViewController.swift
//  AppcentDemo
//
//  Created by Hakan Üstünbaş on 26.12.2020.
//

import UIKit

protocol isAbleToReceiveData {
    
    func pass(fhaz: Bool,rhaz:Bool,mast:Bool,chemcam:Bool,pancam:Bool,navcam:Bool,mardi:Bool,mahli:Bool,minites:Bool)
}

class CheckViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var inView: UIView!
    
    var fhaz : Bool? = false
    var rhaz : Bool? = false
    var mast : Bool? = false
    var chemcam : Bool? = false
    var pancam : Bool? = false
    var navcam : Bool? = false
    var mardi : Bool? = false
    var mahli : Bool? = false
    var minites : Bool? = false
    
    var delegate : isAbleToReceiveData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
       
    }

    func configureUI(){
    
        self.backView.layer.cornerRadius = 15
        self.backView.layer.borderColor =  CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        self.backView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.backView.layer.borderWidth = 1
        self.inView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
    
    }
   
    
    @IBAction func okayClicked(_ sender: Any) {
        
        delegate?.pass(fhaz: fhaz!, rhaz: rhaz!, mast: mast!, chemcam: chemcam!, pancam: pancam!, navcam: navcam!, mardi: mardi!, mahli: mahli!, minites: minites!)
        
        dismiss(animated: true, completion: nil)
   
    }
 
    
    @IBAction func fhazCheck(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            
            if sender.isSelected {
                self.fhaz = sender.isSelected
          
                 
             } else {
                self.fhaz = sender.isSelected
              
                 
             }
            
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
        
        
      
    }
    
    @IBAction func rhazCheck(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            
            if sender.isSelected {
                self.rhaz = sender.isSelected
               
                 
             } else {
                self.rhaz = sender.isSelected
               
                 
             }
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
      
    }
    
    @IBAction func mastCheck(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            
            if sender.isSelected {
                self.mast = sender.isSelected
               
                 
             } else {
                self.mast = sender.isSelected
             
                 
             }
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
       
    }
    
    @IBAction func chemcam(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            
            if sender.isSelected {
                self.chemcam = sender.isSelected
                
                 
             } else {
                self.chemcam = sender.isSelected
               
                 
             }
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
       
    }
    
    @IBAction func mahliChecked(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            
            if sender.isSelected {
                self.mahli = sender.isSelected
              
                 
             } else {
                self.mahli = sender.isSelected
             
                 
             }
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
      
    }
    
    @IBAction func mardiChecked(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            
            if sender.isSelected {
                self.mardi = sender.isSelected
            
                 
             } else {
                self.mardi = sender.isSelected
            
                 
             }
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
      
    }
    
    @IBAction func navcamChecked(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            
            if sender.isSelected {
                self.navcam = sender.isSelected
               
                 
             } else {
                self.navcam = sender.isSelected
              
                 
             }
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
       
    }
    
    @IBAction func pancamChecked(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            
            if sender.isSelected {
                self.pancam = sender.isSelected
                
                 
             } else {
                self.pancam = sender.isSelected
               
                 
             }
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
      
    }
    @IBAction func minitesChecked(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            
            if sender.isSelected {
                self.minites = sender.isSelected
                
                 
             } else {
                self.minites = sender.isSelected
          
                 
             }
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
       
    }
    

}
