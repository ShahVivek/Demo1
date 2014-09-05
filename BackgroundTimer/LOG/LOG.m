
#import "LOG.h"

@implementation LOG

#pragma mark - Private Helper Method

/* Check Log file is exist or not */
+(NSString *) verifyLogFile
{
    CREATE_DIRECTORY(LOG_DIRECTORY);
    
    NSString *path = PATH_MAKER(LOG_DIRECTORY, @"Log.html");
    
    if (IS_FILE_EXISTS(path))
        return path;
    
    NSString *htmlText = @"<table style=\"width:100%; border=1px\" cellpadding=2 cellspacing=2 border=1><tr><td style=\"width:30%\"><b>Date n Time</b></td><td style=\"width:20%\"><b>Title</b></td><td style=\"width:50%\"><b>Description</b></td></tr>";
    
    [htmlText writeToFile: path atomically: YES encoding: NSUTF8StringEncoding error: nil];
    
    return path;
}

#pragma mark - Public Helper Method

+(void) debug:(NSString *) title Message:(NSString *) mesg
{
    // get a handle to the file
    NSFileHandle *objFileHandle = [NSFileHandle fileHandleForWritingAtPath: [self verifyLogFile]];
    
    // move to the end of the file
    [objFileHandle seekToEndOfFile];
    
    NSString *writeString = [NSString stringWithFormat:@"<tr><td>%@</td><td>%@</td><td>%@</td></tr>", [NSDate date], title, mesg];
    
    // convert the string to an NSData object
    NSData *writeData = [writeString dataUsingEncoding:NSUTF8StringEncoding];
    
    // write the data to the end of the file
    [objFileHandle writeData: writeData];
    
    // clean up
    [objFileHandle closeFile];
}

+(void) error:(NSString *) title Message:(NSString *) mesg
{
    // get a handle to the file
    NSFileHandle *objFileHandle = [NSFileHandle fileHandleForWritingAtPath: [self verifyLogFile]];
    
    // move to the end of the file
    [objFileHandle seekToEndOfFile];
    
    NSString *writeString = [NSString stringWithFormat:@"<tr><td style=\"color:#FF0000\">%@</td><td style=\"color:#ff0000\">%@</td><td style=\"color:#FF0000\">%@</td></tr>", [NSDate date], title, mesg];
    
    // convert the string to an NSData object
    NSData *writeData = [writeString dataUsingEncoding:NSUTF8StringEncoding];
    
    // write the data to the end of the file
    [objFileHandle writeData: writeData];
    
    // clean up
    [objFileHandle closeFile];
}

+(void) error:(NSString *) title Exception:(NSException *) mException
{
    // get a handle to the file
    NSFileHandle *objFileHandle = [NSFileHandle fileHandleForWritingAtPath: [self verifyLogFile]];
    
    // move to the end of the file
    [objFileHandle seekToEndOfFile];
    
    NSString *writeString = [NSString stringWithFormat:@"<tr><td style=\"color:#FF0000\">%@</td><td style=\"color:#ff0000\">%@</td><td style=\"color:#ff0000\">ExceptionName :: %@<br/><br/> ExceptionReason :: %@<br/><br/> Exception :: %@</td></tr>", [NSDate date], title, [mException name], [mException reason], [mException userInfo]];
    
    // convert the string to an NSData object
    NSData *writeData = [writeString dataUsingEncoding:NSUTF8StringEncoding];
    
    // write the data to the end of the file
    [objFileHandle writeData: writeData];
    
    // clean up
    [objFileHandle closeFile];
  
    /*
    @try {
        
    }
    @catch (NSException *exception) {
        [Logging error:@"Splash Screen" Exception:exception];
    }
    @finally {
        
    }
    */
}

+(void) error:(NSString *) title Error:(NSError *) mError
{
    // get a handle to the file
    NSFileHandle *objFileHandle = [NSFileHandle fileHandleForWritingAtPath: [self verifyLogFile]];
    
    // move to the end of the file
    [objFileHandle seekToEndOfFile];
    
//    NSString *writeString = [NSString stringWithFormat:@"<tr><td style=\"color:#FF0000\">%@</td><td style=\"color:#ff0000\">%@</td><td style=\"color:#ff0000\">StatusCode :: %d<br/><br/> Error :: %@<br/><br/> Description :: %@</td></tr>", [NSDate date], title, [[[mError userInfo] objectForKey:AFNetworkingOperationFailingURLResponseErrorKey] statusCode], [mError userInfo], mError];
    
    // convert the string to an NSData object
//    NSData *writeData = [writeString dataUsingEncoding:NSUTF8StringEncoding];
    
    // write the data to the end of the file
//    [objFileHandle writeData: writeData];
    
    // clean up
    [objFileHandle closeFile];
}

@end
