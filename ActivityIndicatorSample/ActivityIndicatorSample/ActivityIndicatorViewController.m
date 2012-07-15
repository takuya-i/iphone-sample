//
//  ActivityIndicatorViewController.m
//  ActivityIndicatorSample
//
//
//  Created by tak_ino on 12/07/15.
//  Copyright (c) 2012 tak_ino. All rights reserved.
//

#import "ActivityIndicatorViewController.h"
#import "ProgressIndicator.h"

@interface ActivityIndicatorViewController ()

-(void) doProcess;
-(void) finishProcess;
@property (atomic, strong)ProgressIndicator * indicator;
@end

@implementation ActivityIndicatorViewController

@synthesize indicator = _indicator;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (IBAction)onButtonClik:(id)sender {
    
    self.indicator = [[ProgressIndicator alloc]initWithRootView:self.view];
    [self.indicator startIndicator];
    
    //call BackGroundThread
    [self performSelectorInBackground:@selector(doProcess) withObject:nil];
}

#pragma mark ProcesIndicator process

-(void) doProcess
{
    //do somthing
    [NSThread sleepForTimeInterval:3];
    
    //when process finish, call finish process for dismiss view at MaitUIThread.
    [self performSelectorOnMainThread:@selector(finishProcess) withObject:nil waitUntilDone:NO];
}

-(void) finishProcess {
    [self.indicator stopIndicator];
    

}

@end
