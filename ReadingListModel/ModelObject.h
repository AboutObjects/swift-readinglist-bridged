#import <Foundation/Foundation.h>

@interface ModelObject : NSObject

+ (NSArray *)keys;

+ (id)modelObjectWithDictionary:(NSDictionary *)dictionary;
- (id)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryRepresentation;


@end
