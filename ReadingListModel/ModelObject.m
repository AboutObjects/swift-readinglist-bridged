#import "ModelObject.h"

@implementation ModelObject

// TODO: See whether this is thread-safe.
//
+ (NSArray *)keys
{
    return [NSArray array];
}

+ (id)modelObjectWithDictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (!(self = [super init])) return nil;
    [self setValuesForKeysWithDictionary:dictionary];
    return self;
}

- (NSDictionary *)dictionaryRepresentation
{
    return [self dictionaryWithValuesForKeys:[[self class] keys]];
}

@end
