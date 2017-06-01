//
//  ViewController.swift
//  Interactuando-con-el-hardware-del-dispositivo-iOS_Semana-5_EjemploFotos
//
//  Created by Juan Carlos Carbajal Ipenza on 1/06/17.
//  Copyright © 2017 Juan Carlos Carbajal Ipenza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var fotoVista: UIImageView!
    @IBOutlet weak var camaraBoton: UIButton!

    private let miPicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.camaraBoton.isHidden = true
        }
        self.miPicker.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.fotoVista.image = image
        }
        self.miPicker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.miPicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func camara() {
        self.miPicker.sourceType = UIImagePickerControllerSourceType.camera
        self.present(self.miPicker, animated: true, completion: nil)
    }
    @IBAction func album() {
        self.miPicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(self.miPicker, animated: true, completion: nil)
    }
    @IBAction func guardar() {
        UIImageWriteToSavedPhotosAlbum(self.fotoVista.image!, nil, nil, nil)
        let alerta = UIAlertController(title: "Listo!", message: "Foto guardada en el álbum", preferredStyle: .alert)
        let accionOK = UIAlertAction(title: "OK", style: .default, handler: {
            accion in
            //..
        })
        alerta.addAction(accionOK)
        self.present(alerta, animated: true, completion: nil)
    }
}

