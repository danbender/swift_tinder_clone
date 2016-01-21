import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginWithFacebookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginWithFacebookButton.layer.cornerRadius = 3
        loginWithFacebookButton.titleEdgeInsets = UIEdgeInsetsMake(5, 20, 5, 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pressedFBLogin(sender: UIButton) {
        PFFacebookUtils.logInWithPermissions(["public_profile", "user_about_me", "user_birthday"], block: {
            user, error in
            
            if user == nil {
                println("User canceled the Facebook Login.")
                return
//                TODO: add UIAlertController or so.
            }
            else if user!.isNew {
                println("User signed up and logged in through Facebook!")
                
                FBRequestConnection.startWithGraphPath("/me?fields=picture,first_name,birthday,gender", completionHandler: {
                    connection, result, error in
                    var r = result as! NSDictionary
                    user!["firstName"] = r["first_name"]
                    user!["gender"] = r["gender"]
                    var dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    user!["birthday"] = dateFormatter.dateFromString(r["birthday"] as! String)

                    let pictureURL = ((r["picture"] as! NSDictionary)["data"] as! NSDictionary)["url"] as! String
                    let url = NSURL(string: pictureURL)
                    let request = NSURLRequest(URL: url!)
                   
                    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
                        response, data, error in
                        
                        let imageFile = PFFile(name: "avatar.jpg", data: data)
                        user!["picture"] = imageFile
                        user!.saveInBackgroundWithBlock(nil)
                    })
                }
            )}
            else {
                println("User logged in through Facebook!")
            }
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CardsNavController") as? UIViewController
            self.presentViewController(vc!, animated: true, completion: nil)
        })
    }
}
