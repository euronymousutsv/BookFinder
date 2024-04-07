//
//  handleimageViewController.swift
//  BookFinder
//
//  Created by Utsav on 7/4/2024.
//

import UIKit

class handleimageViewController: UIViewController {

    @IBOutlet weak var urlimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTEwL3Jhd3BpeGVsb2ZmaWNlMTFfM2RfY2FydG9vbl9nYW5lc2hfcmVhbGlzdGljX2lzb2xhdGVkX3doaXRlX2JhY182ZTA2ZjdkYS1iMzEzLTQxODQtYmNmOC04NWFjNTgyMjBmYjdfMS5wbmc.png") {
            loadImage(from: url, into: urlimage)
        }
        // Do any additional setup after loading the view.
    }
    func loadImage(from url: URL, into imageView: UIImageView) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
            }
        }.resume()
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
