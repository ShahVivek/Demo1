//
//  ViewController.h
//  BackgroundTimer
//

//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *objTimer;
    UIBackgroundTaskIdentifier bgTask;
}
@property (nonatomic, retain) NSTimer *objTimer;
- (IBAction)didTapStart:(id)sender;
@end
