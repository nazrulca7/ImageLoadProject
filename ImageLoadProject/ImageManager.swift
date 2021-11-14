//
//  ImageManager.swift
//  ImageLoadProject
//
//  Created by Md Nazrul Islam on 2021-11-09.
//

import Foundation

class ImageManager{
    
    private var listOfImages = [ImageInfo]()
    
    func addNewImage(Img:ImageInfo){
        listOfImages.append(Img)
    }
    
    func getAllImages() -> [ImageInfo]{
        return listOfImages
    }
    
    
}
