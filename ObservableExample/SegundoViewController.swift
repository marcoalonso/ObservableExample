//
//  SegundoViewController.swift
//  ObservableExample
//
//  Created by marco rodriguez on 28/07/22.
//

import UIKit
import RxSwift
import RxCocoa

class SegundoViewController: UIViewController {
    
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var nombre: UITextField!
    
    //Creamos el subject
    private let nombreSubject = PublishSubject<String>()
    private let imagenSubject = PublishSubject<UIImage>()
    
    var selectedImage: Observable<UIImage> {
        return imagenSubject.asObservable()
    }
    
    var selectedName: Observable<String> {
        return nombreSubject.asObservable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func guardarInformacion(_ sender: UIButton) {
        self.imagenSubject.onNext(imagenPerfil.image!)
        self.nombreSubject.onNext(nombre.text ?? "")
        
        
        let alerta = UIAlertController(title: "Informacion Guardada!", message: "Regresar?", preferredStyle: .alert)
        let accionAceptar = UIAlertAction(title: "Si", style: .default) { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        let accionCancelar = UIAlertAction(title: "No quiero modificar algo", style: .destructive, handler: nil)
        alerta.addAction(accionAceptar)
        alerta.addAction(accionCancelar)
        present(alerta, animated: true, completion: nil)
        
        
    }
    
    

}
