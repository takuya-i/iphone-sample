/*
 * Copyright 2012 at Takuya Inoue
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 */

#import "ProgressIndicator.h"
#import <QuartzCore/QuartzCore.h>

@interface  ProgressIndicator()

@property (nonatomic, strong) UIView *alphaView;
@property (nonatomic, strong) UIView *loadingView;
@property (nonatomic, strong) UIActivityIndicatorView * indicatorView; 
@property (nonatomic, weak, readonly) UIView * rootView;

@end

@implementation ProgressIndicator

@synthesize rootView = _rootView;
@synthesize loadingView = _loadingView;
@synthesize alphaView = _alphaView;
@synthesize indicatorView = _indicatorView;
@synthesize frame = _frame;
@synthesize alpha = _alpha;
@synthesize showing = _showing;
@synthesize withNetworkActivityIndicator = _withNetworkActivityIndicator;

-(id)initWithRootView:(UIView *) rootView {
    self = [super init];
    if(self) {
        
        /* initialization code */
        _frame.size.width = INDICATOR_WIDTH;
        _frame.size.height = INDICATOR_HEIGHT;
        _rootView = rootView;
        _alpha = LOADING_ALPHA;
        _showing =NO;
        _withNetworkActivityIndicator = NO;
    }
    return self;
}




-(void) dealloc 
{
    [self setAlphaView:nil];
    [self setLoadingView:nil];
    [self setIndicatorView:nil];
    //[self setRootView:nil];
}

#pragma mark Network indicator 
+ (void)showProgress {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

+ (void)hideProgress {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


-(void)startIndicator {
    
    self.alphaView = [[UIView alloc]initWithFrame:[self.rootView frame]];
    [self.alphaView setAlpha:1.0f];
    
    self.loadingView = [[UIView alloc] initWithFrame:self.frame];
    [self.loadingView setBackgroundColor:[UIColor blackColor]];
    [self.loadingView setAlpha:LOADING_ALPHA];
    self.loadingView.layer.cornerRadius = 16.0f;  
    
    CGSize rootSize = self.alphaView.frame.size;
    
    self.loadingView.center = CGPointMake(rootSize.width /2, rootSize.height - (rootSize.height /2));
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    [self.indicatorView setFrame:CGRectMake(0,0, self.loadingView.frame.size.width,self.loadingView.frame.size.height)]; 

    [self.loadingView addSubview:self.indicatorView];
    [self.alphaView addSubview:self.loadingView];
    [self.rootView addSubview:self.alphaView];
    
    //Start indicatot abu¥imation
    [self.indicatorView startAnimating];
    if(self.withNetworkActivityIndicator) {
        [ProgressIndicator showProgress];
    }
    self.showing = YES;
    
}

-(void) stopIndicator {
    if(self.withNetworkActivityIndicator) {
        [ProgressIndicator hideProgress];
    }
    [self.indicatorView stopAnimating];
    [self.alphaView removeFromSuperview];
    
    self.showing = NO;
    
}
@end
