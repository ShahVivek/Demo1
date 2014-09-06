//
//  ViewController.m
//  BackgroundTimer
//

#import "ViewController.h"
#import "LOG.h"


@implementation ViewController
@synthesize objTimer;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Check the Log file from DOCUMENTS_DIRECTORY==%@",DOCUMENTS_DIRECTORY);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didTapStart:(id)sender {
    NSLog(@"hey i m in the timer ..%@",[NSDate date]);
    [objTimer invalidate];
    objTimer=nil;
    
    bgTask= UIBackgroundTaskInvalid;
    UIApplication  *app = [UIApplication sharedApplication];
    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
        //        [app endBackgroundTask:bgTask];
    }];
    objTimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self
                                              selector:@selector(methodFromTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:objTimer forMode:UITrackingRunLoopMode];
}

-(void)methodFromTimer{
    [LOG debug:@"ViewController.m ::methodFromTimer " Message:[NSString stringWithFormat:@"hey i m from timer ....%@",[NSDate date] ]];
    NSLog(@"hey i m from timer ....%@",[NSDate date]);
}

@end
