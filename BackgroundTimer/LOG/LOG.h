
@interface LOG : NSObject

+(void) debug:(NSString *) title Message:(NSString *) mesg;
+(void) error:(NSString *) title Message:(NSString *) mesg;
+(void) error:(NSString *) title Exception:(NSException *) mException;
+(void) error:(NSString *) title Error:(NSError *) mError;

@end
