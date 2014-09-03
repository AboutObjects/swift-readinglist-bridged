#import "Book.h"
#import "Author.h"

@implementation Book

@synthesize title = _title;
@synthesize year = _year;
@synthesize author = _author;

+ (NSArray *)keys
{
    static NSArray *_keys;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _keys = @[ @"title", @"year", @"author" ];
    });
    return _keys;
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableVals = [[super dictionaryWithValuesForKeys:[[self class] keys]] mutableCopy];
    
    Author *author = [mutableVals objectForKey:@"author"];

    [mutableVals setObject:[author dictionaryRepresentation]
                    forKey:@"author"];
    
    return mutableVals;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"author"] &&
        [value isKindOfClass:[NSDictionary class]])
    {
        value = [Author modelObjectWithDictionary:value];
    }
    
    [super setValue:value forKey:key];
}

- (NSString *)description
{
    return [NSString stringWithFormat:
            @"Title: %@, Year: %@, Author: %@",
            [self title],
            [self year],
            [self author]];
}

@end









