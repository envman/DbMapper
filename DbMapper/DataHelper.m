//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <objc/runtime.h>
#import "DataHelper.h"


@implementation DataHelper

+ (void)getPropertyList:(Class)class
{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(class, &count);

    for (NSUInteger i = 0; i < count; i++) {
        objc_property_t property = properties[i];

        property_getName(property);
        const char *propName = property_getName(property);
        if(propName) {
            const char *propType = [[DataHelper getPropertyType:property] cStringUsingEncoding:NSASCIIStringEncoding];
            NSString *propertyName = [NSString stringWithUTF8String:propName];
            NSString *propertyType = [NSString stringWithUTF8String:propType];
            //[results setObject:propertyType forKey:propertyName];
            //NSLog(@"%@, %@", propertyType, propertyName);
        }
    }
}

//static const char * getPropertyType(objc_property_t property) {
+ (NSString *)getPropertyType:(objc_property_t)property
{
    const char *attributes = property_getAttributes(property);
    printf("attributes=%s\n", attributes);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T' && attribute[1] != '@') {
            // it's a C primitive type:
            /*
                if you want a list of what will be returned for these primitives, search online for
                "objective-c" "Property Attribute Description Examples"
                apple docs list plenty of examples of what you get for int "i", long "l", unsigned "I", struct, etc.
            */
            NSData *data = [NSData dataWithBytes:(attribute + 1) length:strlen(attribute) - 1];
            return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
        else if (attribute[0] == 'T' && attribute[1] == '@' && strlen(attribute) == 2) {
            // it's an ObjC id type:
            return @"id";
        }
        else if (attribute[0] == 'T' && attribute[1] == '@') {
            // it's another ObjC object type:
            NSData *data = [NSData dataWithBytes:(attribute + 3) length:strlen(attribute) - 4];
            return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    }
    return nil;
}

+ (NSString *)getPropertyType:(Class)class WithName:(NSString *)propertyName
{
    objc_property_t property = class_getProperty(class, [propertyName cStringUsingEncoding:NSASCIIStringEncoding]);
    return [DataHelper getPropertyType:property];
}
@end