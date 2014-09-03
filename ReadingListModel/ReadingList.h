#import <Foundation/Foundation.h>
#import "ModelObject.h"

@interface ReadingList : ModelObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray *books;

@end
