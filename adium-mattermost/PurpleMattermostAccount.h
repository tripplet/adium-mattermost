//
//  PurpleMattermostAccount.h
//  adium-mattermost
//
//  Created by Tobias Tangemann on 15.07.17.
//  Copyright © 2017 Tobias Tangemann. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AdiumLibpurple/CBPurpleAccount.h>

@interface PurpleMattermostAccount : CBPurpleAccount {
    
}

- (PurpleAccount*) getPurpleAccount;

@end
