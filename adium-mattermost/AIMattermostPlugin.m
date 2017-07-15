//
//  AIMattermostPlugin
//  adium-mattermost
//
//  Created by Tobias Tangemann on 15.07.17.
//  Copyright © 2017 Tobias Tangemann. All rights reserved.
//

#import "AIMattermostPlugin.h"
#import "PurpleMattermostService.h"

#import <Adium/ESDebugAILog.h>

extern void purple_init_mattermost_plugin();

@implementation AIMattermostPlugin

- (void)installPlugin
{
    purple_init_mattermost_plugin();
    [PurpleMattermostService registerService];
}

- (void)loadLibpurplePlugin
{
    AILog(@"Loading mattermost plugin %s (purple-mattermost: todo)",[[self pluginVersion] UTF8String]);
}

- (NSString *)pluginAuthor      { return @"Tobias Tangemann"; }
- (NSString *)pluginDescription { return @"MatterMost"; }
- (NSString *)pluginURL         { return @"https://github.com/tripplet/adium-mattermost#readme"; }
- (NSString *)pluginVersion     { return [[[NSBundle bundleForClass:[self class]] infoDictionary] objectForKey:@"CFBundleVersion"]; }

- (void)uninstallPlugin {}
- (void)installLibpurplePlugin {}

@end
