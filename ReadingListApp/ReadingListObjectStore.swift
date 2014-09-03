import Foundation
import ReadingListModel

//
// TODO: Migrate to FileUtilities.
// MARK: - File Utilities
//
let documentsURLs = NSFileManager.defaultManager().URLsForDirectory(
    NSSearchPathDirectory.DocumentDirectory, inDomains:
    NSSearchPathDomainMask.UserDomainMask)

func fileURLForDocument(name: NSString, #type: NSString) -> NSURL
{
    let fileURL = documentsURLs.first as NSURL
    return fileURL.URLByAppendingPathComponent(name + ".plist")
}


// MARK: - ReadingListObjectStore

class ReadingListObjectStore : NSObject
{
    let storeName: NSString
    
    init(_ storeName: NSString)
    {
        self.storeName = storeName
        super.init()
    }
    
    func readingList(Void) -> ReadingList
    {
        var fileURL = fileURLForDocument(storeName, type: "plist")
        
        if !NSFileManager.defaultManager().fileExistsAtPath(fileURL.path!)
        {
            let bundle = NSBundle(forClass: ReadingListObjectStore.self)
            if let URL = bundle.URLForResource(storeName, withExtension: "plist") {
                fileURL = URL
            }
            else {
                println("Unable to locate \(storeName) in app bundle.")
            }
        }
        
        return ReadingList(dictionary: NSDictionary(contentsOfURL: fileURL))
    }
    
    func saveReadingList(readingList: ReadingList) -> Void
    {
        let fileURL = fileURLForDocument(storeName, type: "plist")
        let dict: NSDictionary = readingList.dictionaryRepresentation()
        
        dict.writeToURL(fileURL, atomically: true)
    }
}