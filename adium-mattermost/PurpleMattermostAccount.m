//
//  PurpleMattermostAccount.m
//  adium-mattermost
//
//  Created by Tobias Tangemann on 15.07.17.
//  Copyright © 2017 Tobias Tangemann. All rights reserved.
//

#import "PurpleMattermostAccount.h"
#import <Adium/AIStatus.h>

@implementation PurpleMattermostAccount

- (const char*)protocolPlugin
{
    return "prpl-eionrobb-mattermost";
}

- (PurpleAccount *)getPurpleAccount {
    return account;
}

@end
