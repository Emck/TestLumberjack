//
//  AppDelegate.m
//  TestLumberjack
//
//  Created by Emck on 6/14/22.
//

#import "AppDelegate.h"
#import "MDDLogFileManager.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

// Log levels: off, error, warn, info, verbose
#ifdef DEBUG
  static const DDLogLevel ddLogLevel = DDLogLevelDebug;
#else
  static const DDLogLevel ddLogLevel = DDLogLevelWarning;
#endif

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [DDLog addLogger:[DDOSLogger sharedInstance]];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] initWithLogFileManager:[[MDDLogFileManager alloc] init]];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 2;
    [DDLog addLogger:fileLogger];

    DDLogDebug(@"%@", fileLogger.currentLogFileInfo.filePath);
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
