import UIKit
import ReadingListModel

class ReadingListController : UITableViewController
{
    private let objectStore = ReadingListObjectStore("BooksAndAuthors")
    private var books: NSMutableArray!
    
    
    // MARK: - Unwind Segues
    
    @IBAction private func doneEditingBook(segue: UIStoryboardSegue) -> Void
    {
        let controller = segue.sourceViewController as EditBookController
        books.addObject(controller.book)
        save()
        
        self.tableView.reloadData()
    }
    
    @IBAction private func doneAddingBook(segue: UIStoryboardSegue) -> Void
    {
        // TODO: Implement me!
    }
    
    @IBAction private func cancelEditingBook(segue: UIStoryboardSegue) -> Void { }
    @IBAction private func cancelAddingBook(segue: UIStoryboardSegue) -> Void { }
    
    
    // MARK: - Updating Store
    
    private func save() -> Void
    {
        let newReadingList = ReadingList()
        newReadingList.books = books;
        newReadingList.title = title
        
        objectStore.saveReadingList(newReadingList)
    }
    
    private func insertBook(book: Book, index: Int)
    {
        books.insertObject(book, atIndex:index)
        save()
        
        let indexPath = NSIndexPath(forRow:index, inSection:0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation:.Fade)
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition:.Middle, animated:true)
    }
    
    
    // MARK: - UIViewController
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var newReadingList = objectStore.readingList()
        title = newReadingList.title
        self.books = (newReadingList.books as NSArray).mutableCopy() as NSMutableArray
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        switch (segue.identifier as NSString) {
        case "ViewBook":
                let controller = segue.destinationViewController as ViewBookController
                controller.book  = books[tableView.indexPathForSelectedRow()!.row] as Book
        case "AddBook":
            let navController = segue.destinationViewController as UINavigationController
            let controller = navController.childViewControllers.first as AddBookController
//            controller.completion = { book in self.insertBook(book, index:0) }
        default:
            println("Unmatched segue identifier \(segue.identifier)")
        }
    }
    
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 100;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("BookSummary") as UITableViewCell;
        
        let book: Book = books[indexPath.row] as Book
        
        cell.textLabel!.text = book.title
        cell.detailTextLabel!.text = book.year + "  " + book.author.fullName
        
        return cell;
    }
}

