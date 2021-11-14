//
//  AddImgLoadViewController.swift
//  ImageLoadProject
//
//  Created by Md Nazrul Islam on 2021-11-09.
//

import UIKit

protocol AddingImageDelegateProtocol {
    func controllerDidFinishWithNewImages(si: ImageInfo)// did , will ,
    func controllerDidCancel()
}

class AddImgLoadViewController: UIViewController {
    public var delegate: AddingImageDelegateProtocol?
    
   
    
    @IBOutlet weak var txtImageName: UITextField!
   
    
    @IBOutlet weak var txtImageLink: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Add New Image"
        // Do any additional setup after loading the view.
    }
    @IBAction func btnSave(_ sender: Any) {
        
        if let name = txtImageName.text {
            if let Link = txtImageLink.text {
                if !name.isEmpty && !Link.isEmpty{
                  
                        let newImage = ImageInfo(a: name, link: Link)
                        print (newImage.ImageName)
                        delegate?.controllerDidFinishWithNewImages(si: newImage)
                        dismiss(animated: true, completion: nil)
                    
                    
                    
                }
            }
        }
        
    }
    @IBAction func btnCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
