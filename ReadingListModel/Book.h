#import <Foundation/Foundation.h>
#import "ModelObject.h"

@class Author;

@interface Book : ModelObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *year;

@property (nonatomic, retain) Author *author;

@end
