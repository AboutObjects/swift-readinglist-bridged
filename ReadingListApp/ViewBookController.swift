//
// Copyright (C) 2014 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//

import UIKit

class ViewBookController : UITableViewController
{
    var book: Book!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    
    override func viewDidLoad() {
        authorImageView.layer.cornerRadius = 5.0
        authorImageView.layer.masksToBounds = true
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        titleLabel.text = book.title
        yearLabel.text = book.year
        firstNameLabel.text = book.author.firstName
        lastNameLabel.text = book.author.lastName
        authorImageView.image = UIImage.imageNamed(book.author.lastName,
            inBundle:NSBundle(forClass:Book.self))
        
        title = titleLabel.text
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        var navController = segue.destinationViewController as UINavigationController
        var controller = navController.topViewController as EditBookController
        controller.book = book
    }
}