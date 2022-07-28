//
//  ViewController.swift
//  ObservableExample
//
//  Created by marco rodriguez on 28/07/22.
//

import UIKit
import RxSwift


class PrimeroViewController: UIViewController {
    
    @IBOutlet weak var labelToSucribe: UILabel!
    @IBOutlet weak var imageToSuscribe: UIImageView!
    
    //Este VC se va suscribir al second VC
    //Se necesita siempre una bolse de desecho
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ir" {
            let destinoVC = segue.destination as! SegundoViewController
            //Se accede a la variable selectedImage y se subscribe en el siguiente Evento el cual genera una imagen como resultado, dicha imagen se le agrega a la imagen de este VC y al final se desecha o anula la subscripcion.
            destinoVC.selectedImage.subscribe(onNext: { [weak self] imagen in
                self?.imageToSuscribe.image = imagen
            }).disposed(by: disposeBag)
            
            //Se accede a la variable selectedName de tipo String y se subscribe en el siguiente Evento el cual genera un name como resultado, dicho name se le agrega al text del label de este VC y al final se desecha o anula la subscripcion.
            destinoVC.selectedName.subscribe(onNext: { [weak self] name in
                self?.labelToSucribe.text = name
            }).disposed(by: disposeBag)
        }//if segue
        
    }


}

