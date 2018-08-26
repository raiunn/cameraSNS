//
//  ViewController.swift
//  cameraSNS
//
//  Created by 梅北文仁 on 2018/05/21.
//  Copyright © 2018年 梅北文仁. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var photoImage: UIImageView!
    @IBAction func camareLaunchAction(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print ("Camera can be used")
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.delegate = self
            present(ipc, animated: true,completion: nil)
        }
        else {
            print ("Camera is not available")
        }
    }


    
    @IBAction func shareAction(_ sender: Any) {    if let sharedImage = photoImage.image {            let sharedItems = [sharedImage]
            let controller = UIActivityViewController(activityItems: sharedItems, applicationActivities: nil)
            controller.popoverPresentationController?.sourceView = view
            present(controller, animated: true,completion: nil)
        }
    }
    
    func imagePickerController(_ picker:UIImagePickerController, didFinishPickingMediaWithInfo info: [String:Any])
    {
        photoImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)    }
        
    }


