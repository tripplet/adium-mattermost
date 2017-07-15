//
//  PurpleMattermostService.m
//  adium-mattermost
//
//  Created by Tobias Tangemann on 15.07.17.
//  Copyright © 2017 Tobias Tangemann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

#import "PurpleMattermostAccount.h"
#import "PurpleMattermostService.h"

#import <Adium/AISharedAdium.h>
#import <Adium/AIStatusControllerProtocol.h>
#import <AIUtilities/AIStringUtilities.h>
#import <AIUtilities/AIImageAdditions.h>

@implementation PurpleMattermostService

- (Class)accountClass {
    return [PurpleMattermostAccount class];
}

// Service Description
- (AIServiceImportance)serviceImportance { return AIServicePrimary; }
- (NSString *) serviceCodeUniqueID       { return @"prpl-eionrobb-mattermost"; }
- (NSString *) serviceID                 { return @"MatterMost"; }
- (NSString *) serviceClass              { return @"MatterMost"; }
- (NSString *) shortDescription          { return @"MatterMost"; }
- (NSString *) longDescription           { return @"MatterMost"; }
- (NSUInteger) allowedLength             { return 64; }
- (BOOL) requiresPassword                { return YES; }
- (BOOL) supportsPassword                { return YES; }
- (BOOL) caseSensitive                   { return NO; }
- (BOOL) canRegisterNewAccounts          { return NO; }

- (NSImage *)defaultServiceIconOfType:(AIServiceIconType)iconType
{
    if ((iconType == AIServiceIconSmall) || (iconType == AIServiceIconList)) {
        return [NSImage imageNamed:@"mattermost16" forClass:[self class] loadLazily:YES];
    } else {
        return [NSImage imageNamed:@"mattermost48" forClass:[self class] loadLazily:YES];
    }
}

- (NSString *)pathForDefaultServiceIconOfType:(AIServiceIconType)iconType
{
    if ((iconType == AIServiceIconSmall) || (iconType == AIServiceIconList)) {
        return [[NSBundle bundleForClass:[self class]] pathForImageResource:@"mattermost16"];
    }
    return [[NSBundle bundleForClass:[self class]] pathForImageResource:@"mattermost48"];
}

- (void)registerStatus:(NSString*) status_name ofType:(AIStatusType) status_type
{
    [adium.statusController registerStatus:status_name
                           withDescription:[adium.statusController localizedDescriptionForCoreStatusName:status_name]
                                    ofType:status_type forService:self];
}

- (void)registerStatuses {
    [self registerStatus: STATUS_NAME_AVAILABLE ofType:AIAvailableStatusType];
    [self registerStatus: STATUS_NAME_AWAY      ofType:AIAwayStatusType];
    [self registerStatus: STATUS_NAME_OFFLINE   ofType:AIOfflineStatusType];
}

@end
