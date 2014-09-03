import UIKit

class ViewBookController : UITableViewController
{
    var book: Book!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        titleLabel.text = book.title
        yearLabel.text = book.year
        firstNameLabel.text = book.author.firstName
        lastNameLabel.text = book.author.lastName
        
        title = titleLabel.text
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        var navController = segue.destinationViewController as UINavigationController
        var controller = navController.topViewController as EditBookController
        controller.book = book
    }
}