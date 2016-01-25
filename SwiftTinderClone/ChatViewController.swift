import Foundation

class ChatViewController: JSQMessagesViewController {
    
    var messages: [JSQMessage] = []
    
    override var senderId: String! {
        get {
            return currentUser()!.id
        }
        set {
            super.senderId = newValue
        }
    }
    
    override var senderDisplayName: String! {
        get {
            return currentUser()!.name
        }
        
        set {
            super.senderDisplayName = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
//    
//    func senderDisplayName() -> String! {
//        return currentUser()!.id
//    }
//    
//    func senderId() -> String! {
//        return currentUser()!.id
//    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        var data = self.messages[indexPath.row]
        return data
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    
    
}