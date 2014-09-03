//
// Copyright (C) 2014 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//

import UIKit

class AddBookController : UITableViewController
{
    var book: Book!
//    var completion: ((book: Book) -> Void) = { book in println("No completion block provided.") }
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        titleField.becomeFirstResponder()
    }
    
     var bookToAdd: Book {
        get { return Book(dictionary: NSDictionary(dictionary:
            ["title": titleField.text, "year": yearField.text,
            "author":[
                "firstName": firstNameField.text,
                "lastName": lastNameField.text]]))
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        if ((segue.identifier as NSString).isEqualToString("DoneAddingBook")) {
//            completion(book: bookToAdd)
        }
    }
}
