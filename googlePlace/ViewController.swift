//
//  ViewController.swift
//  googlePlace
//
//  Created by Pawan Yadav on 16/07/18.
//  Copyright © 2018 invetech. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces



class ViewController: UIViewController,GMSMapViewDelegate
{
    
    
    @IBOutlet var MytextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }
    
    
    
    
    @IBAction func openStartLocation(_ sender: UIButton)
    {
        
        let autoCompleteController = GMSAutocompleteViewController()
        autoCompleteController.delegate = self

        UISearchBar.appearance().setTextColor(color: UIColor.black)
        
        self.present(autoCompleteController, animated: true, completion: nil)
    }
    
    
}




// MARK: - GMS Auto Complete Delegate, for autocomplete search location
extension ViewController: GMSAutocompleteViewControllerDelegate
{
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error \(error)")
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        
        MytextField.text = place.name
        //"\(place.coordinate.latitude), \(place.coordinate.longitude)"
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}

public extension UISearchBar
{
    
    public func setTextColor(color: UIColor)
    {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf.textColor = color
    }
    
}

