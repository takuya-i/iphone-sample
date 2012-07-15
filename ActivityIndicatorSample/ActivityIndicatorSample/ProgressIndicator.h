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

#import <Foundation/Foundation.h>

//Size of default Indicator 
static const NSInteger INDICATOR_WIDTH = 96; // default width
static const NSInteger INDICATOR_HEIGHT = 96; // default height

//Default indicator back ground alpha
static const CGFloat LOADING_ALPHA = 0.5f; 

@interface ProgressIndicator : NSObject

// property when indicator is showing
@property BOOL showing;

// Property of show network indicator when call startIndicator.
//default value is NO
@property BOOL withNetworkActivityIndicator;

//starting Indicator
-(void)startIndicator;

//Hide indicator
-(void)stopIndicator;

//Object Instancing method. use this method to create object
// rootView is to attach Indicator View as ssubview

-(id)initWithRootView:(UIView *) rootView;

//Size of ActivutyIndicator
@property (nonatomic) CGRect frame;

//Loding Box alpha 
@property (nonatomic) CGFloat alpha;

//Showing network indicator at status bar
+ (void)showProgress;
//hide network indicator 
+ (void)hideProgress;

@end
