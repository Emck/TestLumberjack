//
//  MDDLogFileManager.m
//  TestLumberjack
//
//  Created by Emck on 6/14/22.
//

#import "MDDLogFileManager.h"

@implementation MDDLogFileManager

- (NSString *)defaultLogsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? paths[0] : NSTemporaryDirectory();
    return [basePath stringByAppendingPathComponent:@"Logs"];
}

- (NSString *)newLogFileName {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    return [NSString stringWithFormat:@"app.%@.log", [dateFormatter stringFromDate:[NSDate date]]];
}

- (BOOL)isLogFile:(NSString *)fileName {
    BOOL hasProperPrefix = [fileName hasPrefix:@"app."];
    BOOL hasProperSuffix = [fileName hasSuffix:@".log"];
    return (hasProperPrefix && hasProperSuffix);
}

@end
