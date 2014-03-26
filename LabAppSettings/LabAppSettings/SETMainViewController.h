//
//  SETMainViewController.h
//  LabAppSettings
//
//  Created by Maria Montserrat Lozano on 24/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "SETFlipsideViewController.h"
#define kUsernameKey @"username"
#define kPasswordKey @"password"
#define kProtocolKey @"protocol"
#define kWarpDriveKey @"warp"
#define kWarpFactorKey @"warpFactor"
#define kFavoriteTeaKey @"favoriteTea"
#define kFavoriteCandyKey @"favoriteCandy"
#define kFavoriteGameKey @"favoriteGame"
#define kFavoriteExcuseKey @"favoriteExcuse"
#define kFavoriteSinKey @"favoriteSin"

@interface SETMainViewController : UIViewController <SETFlipsideViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *userLabel;

@property (weak, nonatomic) IBOutlet UILabel *passLabel;
@property (weak, nonatomic) IBOutlet UILabel *protocolLabel;

@property (weak, nonatomic) IBOutlet UILabel *driveLabel;
@property (weak, nonatomic) IBOutlet UILabel *factorLabel;
@property (weak, nonatomic) IBOutlet UILabel *teaLabel;
@property (weak, nonatomic) IBOutlet UILabel *candyLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameLabel;
@property (weak, nonatomic) IBOutlet UILabel *excuseLabel;

@property (weak, nonatomic) IBOutlet UILabel *sinLabel;


@end
