//
//  SignInViewController.swift
//  OnlineShopping
//
//  Created by Mert Gürcan on 12.12.2020.
//

import UIKit
import Network

class SignInViewController: UIViewController {

    let monitor = NWPathMonitor()

    var products: Product?

    let productServices = ProductsServices()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailInputView: EmailInputView!
    @IBOutlet weak var passwordInputView: PasswordInputView!
    @IBOutlet weak var signInButton: CommonButtonView!


    override func viewDidLoad() {
        super.viewDidLoad()
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        self.hideKeyboardWhenTappedAround()
        activityIndicator.hidesWhenStopped = true
        signInButton.updateUI(color: UIColor(red: 0.1765, green: 0.6118, blue: 0.8588, alpha: 1.0), text: "Giriş Yap")
        signInButton.buttonView.addTarget(self, action: #selector(goProductListViewController(_:)), for: .touchUpInside)
    }

    @objc func goProductListViewController(_ sender: UIButton){
        activityIndicator.startAnimating()
        if monitor.currentPath.status == .satisfied {
            productServices.getProducts(completion:
                { (productData, err) in
                    if let productData = productData {
                        DispatchQueue.main.async {
                            self.products = productData
                            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let productListViewController = storyboard.instantiateViewController(identifier: "productList") as! ProductListViewController
                            productListViewController.products = productData
                            productListViewController.modalPresentationStyle = .custom
                            self.activityIndicator.stopAnimating()
                            self.present(productListViewController, animated: true, completion: nil)
                        }
                    }
                    if err != nil {
                        print(err!)
                    }
                })
        } else {
            activityIndicator.stopAnimating()
            print("No internet connection")
        }

    }
}
extension UIViewController {

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
