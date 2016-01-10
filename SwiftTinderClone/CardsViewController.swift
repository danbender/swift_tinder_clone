import UIKit

class CardsViewController: UIViewController, SwipeViewDelegate {

    struct Card {
        let cardView: CardView
        let swipeView: SwipeView
    }
    
    let frontCardTopMargin: CGFloat = 0
    let backCardTopMargin: CGFloat = 10
    
    @IBOutlet weak var cardStackView: UIView!
    
    var backCard: SwipeView?
    var frontCard: SwipeView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cardStackView.backgroundColor = UIColor.clearColor()
        
        backCard = SwipeView(frame: createCardFrame(backCardTopMargin))
        backCard?.delegate = self
        cardStackView.addSubview(backCard!)
        
        frontCard = SwipeView(frame: createCardFrame(frontCardTopMargin))
        frontCard!.delegate = self
        cardStackView.addSubview(frontCard!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createCardFrame(topMargin: CGFloat) -> CGRect {
        return CGRect(x: 0, y: topMargin, width: cardStackView.frame.width, height: cardStackView.frame.height)
    }
    
    private func createCard(topMargin: CGFloat) -> Card {
        let cardView = CardView()
        let swipeView = SwipeView(frame: createCardFrame(topMargin))
        swipeView.delegate = self
        swipeView.innerView = cardView
        return Card(cardView: cardView, swipeView: swipeView)
    }

    
//    MARK: SwipeViewDelegate
    
    func swipedLeft() {
        println("left")
        if let frontCard = frontCard {
            frontCard.removeFromSuperview()
        }
    }
    
    func swipedRight() {
        println("right")
        if let frontCard = frontCard {
            frontCard.removeFromSuperview()
        }
    }
}
