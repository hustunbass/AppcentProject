//
//  MainViewController.swift
//  AppcentDemo
//
//  Created by Hakan Üstünbaş on 23.12.2020.
//

import UIKit
import Alamofire
import SDWebImage

class CurriosityViewController: UIViewController,isAbleToReceiveData {
   
    let rover =  "curiosity"
    var isMoreDataLoading = false
    var currentPage = 1
    var itemCount : Int?
    
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
        
        let loadingReusableNib = UINib(nibName: "SpinnerViewCell", bundle: nil)
        collectionView.register(loadingReusableNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "spinnerCell")
        
        configureView()
        getCuriosityRequest()
      
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
    @IBAction func deleteFilter(_ sender: Any){
       
        self.showImage.removeAll()
        self.currentPage = 0
        getCuriosityRequest()
    }
    
    func pass(fhaz: Bool, rhaz: Bool, mast: Bool, chemcam: Bool, pancam: Bool, navcam: Bool, mardi: Bool, mahli: Bool, minites: Bool) {
  
        self.showImage.removeAll()
        
        if fhaz{
            getFhazRequest()
        }
        if rhaz{
            getRhazRequest()
        }
        if mast{
            getMastRequest()
        }
        if chemcam{
            getChemcamRequest()
        }
        if navcam{
            getNavcamRequest()
        }
        if mardi{
           getMardiRequest()
        }
        if mahli{
           getMahliRequest()
        }
    }
    
    func getArrayCount() -> Int{
        return self.showImage.count
    }
    
    func getFhazRequest(){
        
        for index in 1...35{
            
            currentPage = index
            
            service.fetchDataCamera(rover: rover,page: currentPage,camera: "fhaz") { (fhaz) in
                
                if (fhaz != nil){
                    
                    self.imageData = fhaz!
                    for index in self.imageData {
                        self.showImage.append(index)
                    }
                    self.collectionView.reloadData()
                    
                }
            }
        }
    }
    
    func getRhazRequest(){
        
        for index in 1...35{
            
            currentPage = index
            
            service.fetchDataCamera(rover: rover,page: currentPage,camera: "rhaz") { (rhaz) in
                
                if (rhaz != nil){
                    
                    self.imageData = rhaz!
                    for index in self.imageData {
                        self.showImage.append(index)
                    }
                    self.collectionView.reloadData()
                    
                }
            }
        }
        
    }
    
    func getMastRequest(){
        
        for index in 1...35{
            
            currentPage = index
            
            service.fetchDataCamera(rover: rover,page: currentPage,camera: "mast") { (mast) in
                
                if (mast != nil){
                    
                    self.imageData = mast!
                    for index in self.imageData {
                        self.showImage.append(index)
                    }
                    self.collectionView.reloadData()
                    
                }
            }
        }
        
    }
    
    func getChemcamRequest(){
        
        for index in 1...35{
            
            currentPage = index
            
            service.fetchDataCamera(rover: rover,page: currentPage,camera: "chemcam") { (chemcam) in
                
                if (chemcam != nil){
                    
                    self.imageData = chemcam!
                    for index in self.imageData {
                        self.showImage.append(index)
                    }
                    self.collectionView.reloadData()
                    
                }
            }
        }
        
    }
    
    func getMahliRequest(){
        
        for index in 1...35{
            
            currentPage = index
            
            service.fetchDataCamera(rover: rover,page: currentPage,camera: "mahli") { (mahli) in
                
                if (mahli != nil){
                    
                    self.imageData = mahli!
                    for index in self.imageData {
                        self.showImage.append(index)
                    }
                    self.collectionView.reloadData()
                    
                }
            }
        }
        
    }
    
    func getMardiRequest(){
        
        for index in 1...35{
            
            currentPage = index
            
            service.fetchDataCamera(rover: rover,page: currentPage,camera: "mardi") { (mardi) in
                
                if (mardi != nil){
                    
                    self.imageData = mardi!
                    for index in self.imageData {
                        self.showImage.append(index)
                    }
                    self.collectionView.reloadData()
                    
                }
            }
        }
        
    }
    
    func getNavcamRequest(){
        
        for index in 1...35{
            
            currentPage = index
            
            service.fetchDataCamera(rover: rover,page: currentPage,camera: "navcam") { (navcam) in
                
                if (navcam != nil){
                    
                    self.imageData = navcam!
                    for index in self.imageData {
                        self.showImage.append(index)
                    }
                    self.collectionView.reloadData()
                    
                }
            }
        }
        
    }

    func getCuriosityRequest(){
        
        service.fetchData(rover: rover, page: self.currentPage) { (photo) in
            
            if (photo != nil){
                
                self.imageData = photo!
                
                self.showImage = self.imageData
                
                self.isMoreDataLoading = false
                
                self.itemCount = self.getArrayCount()
                print(self.itemCount!)
                
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

extension CurriosityViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (!isMoreDataLoading) {

            let scrollViewContentHeight = collectionView.contentSize.height
            let scrollOffsetThreshold = scrollViewContentHeight - collectionView.bounds.size.height
            
            if (scrollView.contentOffset.y > scrollOffsetThreshold && collectionView.isDragging) {
                isMoreDataLoading = true
     
                let page = currentPage
                
                currentPage = page + 1
                
                service.fetchData(rover: rover, page: self.currentPage) { (photo) in
                    
                    if (photo != nil){
                        
                        self.imageData = photo!
                        
                        for index in self.imageData {
                            
                            self.showImage.append(index)
                        }
                        
                        self.isMoreDataLoading = false

                    }
                    self.collectionView.reloadData()
                }
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.showImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as? MainCollectionViewCell {
           
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
        
        performSegue(withIdentifier: "showPopUp", sender: nil)
      
    }
}
