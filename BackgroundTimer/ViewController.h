//
//  ViewController.h
//  BackgroundTimer
//
//  Created by Hardik Jani on 05/09/14.
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
