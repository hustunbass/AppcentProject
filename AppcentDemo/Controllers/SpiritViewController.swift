//
//  SpiritViewController.swift
//  AppcentDemo
//
//  Created by Hakan Üstünbaş on 25.12.2020.
//

import UIKit
import Alamofire
import SDWebImage

class SpiritViewController: UIViewController,isAbleToReceiveData {
    
    let rover =  "spirit"
    var isDataLoading = false
    var currentPage = 1
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let service = PhotoService()
    var imageData = [Photo]()
    var showImage = [Photo]()
    
    var fhaz : Bool? = false
    var rhaz : Bool? = false
    var mast : Bool? = false
    var chemcam : Bool? = false
    var pancam : Bool? = false
    var navcam : Bool? = false
    var mardi : Bool? = false
    var mahli : Bool? = false
    var minites : Bool? = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getSpiritRequest()
        configureView()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PopUpViewController,let index = collectionView.indexPathsForSelectedItems?.first{

            destination.spaceImageUrl = self.showImage[index.row].img_src
            destination.pictureDate = "Earth Date : " + (self.showImage[index.row].earth_date!)
            destination.car = "Car Name : " + (self.showImage[index.row].rover?.name)!
            destination.camera = "Camera : " + ((self.showImage[index.row].camera?.name)!)
            destination.currentStatus = "Status : " + (self.showImage[index.row].rover?.status?.uppercased())!
            destination.launch = "Launch Date : " + (self.showImage[index.row].rover?.launch_date)!
            destination.landing = "Landing Date : " + (self.showImage[index.row].rover?.landing_date)!

        }
        
        if let vc = segue.destination as? CheckViewController {
            vc.delegate = self
        }
 
    }
    @IBAction func deleteFilter(_ sender: Any) {
        
        self.showImage.removeAll()
        self.currentPage = 0
        getSpiritRequest()
    }
    
    func pass(fhaz: Bool, rhaz: Bool, mast: Bool, chemcam: Bool, pancam: Bool, navcam: Bool, mardi: Bool, mahli: Bool, minites: Bool) {
        
        self.showImage.removeAll()
        
        if navcam{
            getNavcamRequest()
        }
        if pancam{
            getPancamRequest()
        }
       
    }
    
    func getNavcamRequest(){
        
        service.fetchDataCamera(rover: rover, page: currentPage, camera: "navcam") { (navcam) in
            
            if (navcam != nil){
                
                self.imageData = navcam!
                
                for index in self.imageData {
                    self.showImage.append(index)
                }
                
                self.collectionView.reloadData()
 
            }
            
        }
    }
    
    func getPancamRequest(){
        
        service.fetchDataCamera(rover: rover, page: currentPage, camera: "pancam") { (pancam) in
            
            if (pancam != nil){
                
                self.imageData = pancam!
                
                for index in self.imageData {
                    self.showImage.append(index)
                }
                
                self.collectionView.reloadData()

            }
            
        }
    }
    
    
    func getSpiritRequest(){
        
        service.fetchData(rover: rover, page: self.currentPage) { (photo) in
            
            if (photo != nil){
                
                self.imageData = photo!
                
                self.showImage = self.imageData
                
                print(self.showImage)
                
            }
            self.collectionView.reloadData()
        }
    }
    

    func configureView(){
    
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: 300, height: 300)
        flowlayout.minimumInteritemSpacing = 0
        flowlayout.minimumLineSpacing = 0
        flowlayout.scrollDirection = .vertical
        collectionView.collectionViewLayout = flowlayout
        
        let bgImage = UIImageView();
        bgImage.image = UIImage(named: "splash");
        bgImage.contentMode = .scaleToFill
        self.collectionView?.backgroundView = bgImage
    }
}

extension SpiritViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.showImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "spiritCell", for: indexPath) as? SpiritViewCell {
           
            cell.image.sd_setImage(with: URL(string: self.showImage[indexPath.row].img_src!))
            cell.backView.layer.cornerRadius = 15
            cell.backView.layer.borderColor = UIColor.clear.cgColor
            cell.backView.layer.masksToBounds = true

                return cell
                
            } else {
                return UICollectionViewCell()
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showPopUpSpirit", sender: nil)
      
    }
    
}

