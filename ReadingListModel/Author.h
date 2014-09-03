#import <Foundation/Foundation.h>
#import "ModelObject.h"

@interface Author : ModelObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;

@property (nonatomic, readonly) NSString *fullName;

@end
