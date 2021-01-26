//
//  GaleriaViewController.swift
//  UeeraniApp
//
//  Created by Ross on 16/01/21.
//


import UIKit
import ImageSlideshow

class GaleriaViewController: UIViewController, ImageSlideshowDelegate {

    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    var pueblo : String?
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true)
        //slideImage()
        let localSource = [BundleImageSource(imageString: "\(pueblo!)1"), BundleImageSource(imageString: "\(pueblo!)2"), BundleImageSource(imageString: "\(pueblo!)3"), BundleImageSource(imageString: "\(pueblo!)4")]
        slideshow.slideshowInterval = 5.0
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill


        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.delegate = self

        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideshow.setImageInputs(localSource)

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(GaleriaViewController.didTap))
        slideshow.addGestureRecognizer(recognizer)
    }
    @objc func didTap() {
            let fullScreenController = slideshow.presentFullScreenController(from: self)
            // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
            fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
        }
    @IBAction func fromGaleriaView(segue:UIStoryboardSegue!){
        
    }
    

}
extension ViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
