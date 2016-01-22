import Foundation

struct Match {
    let id: String
    let user: User
}

func fetchMatches (callBack: ([Match]) -> ()) {
    PFQuery(className: "Action")
        .whereKey("byUser", equalTo: PFUser.currentUser()!.objectId!)
        .whereKey("type", equalTo: "matched")
        .findObjectsInBackgroundWithBlock({
            objects, error in
            if let matches = objects as? [PFObject] {
                let matchedUsers = matches.map({
                    (object)->(matchID: String, userID: String) in
                    (object.objectId!, object.objectForKey("toUser") as! String)
                })
                let userIDs = matchedUsers.map({$0.userID})
            }
        })
}