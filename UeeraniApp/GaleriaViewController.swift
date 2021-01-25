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
    @IBOutlet weak var galeria: UIImageView!
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true)
        slideImage()
    }
    @objc func didTap() {
            let fullScreenController = slideshow.presentFullScreenController(from: self)
            // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
            fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
        }

    func slideImage(){
        
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
        pageIndicator.pageIndicatorTintColor = UIColor.black
        slideshow.pageIndicator = pageIndicator

        let images = [BundleImageSource(imageString: "cuitzeo"),BundleImageSource(imageString: "angangueo")]
        slideshow.slideshowInterval = 5.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill


        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.delegate = self
        slideshow.setImageInputs(images)
    }

}
extension ViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
