//
//  ViewController.swift
//  ImageLoadProject
//
//  Created by Md Nazrul Islam on 2021-11-09.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource, AddingImageDelegateProtocol

{
    @IBOutlet weak var loadImgview: UIImageView!
    func controllerDidCancel() {
        
    }
    
    @IBAction func btnStart(_ sender: Any) {
        
        let queue = DispatchQueue.init(label: "1")
        queue.async {
            // task that takes time
            // api call // dateTask
            // access file system
            // connect DB // CoreData
         
        }
        
    }
    

    var Imageshow:ImageManager = ImageManager()
    @IBOutlet weak var Image_picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Image_picker.delegate = self
        Image_picker.dataSource = self
        self.navigationItem.title = "Image Viewer"
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Imageshow.getAllImages().count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        
        return Imageshow.getAllImages()[row].ImageName
    }
    
    func controllerDidFinishWithNewImages(si: ImageInfo) {
        Imageshow.addNewImage(Img: si)
        Image_picker.reloadAllComponents()
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //loadImgview.image = ""
       let imageLoad = Imageshow.getAllImages()[row].ImageLink
        let url = URL(string: imageLoad)
        if let data = try? Data(contentsOf: url!){
      
        loadImgview.image = UIImage(data: data)
        }
    }
    
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let aVC = segue.destination as! AddImgLoadViewController
        aVC.delegate = self
    }*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let aVC = segue.destination as! AddImgLoadViewController
        
        aVC.delegate = self
        }
}

