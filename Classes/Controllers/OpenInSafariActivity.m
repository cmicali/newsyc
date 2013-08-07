//
//  OpenInSafariActivity.m
//  newsyc
//
//  Created by Grant Paul on 11/8/12.
//
//

#import "OpenInSafariActivity.h"

@implementation OpenInSafariActivity

- (void)dealloc {
    [url release];
    
    [super dealloc];
}

- (NSString *)activityType {
    return @"com.apple.safari.open-in";
}

- (NSString *)activityTitle {
    return @"Open in Safari";
}

- (UIImage *)activityImage {
    return [UIImage imageNamed:@"openinsafari.png"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)arr {
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    [url release];
	for (id activityItem in activityItems) {
		if ([activityItem isKindOfClass:[NSURL class]]) {
			url = [NSURL URLWithString:[activityItem absoluteString]];
            return;
		}
	}
}

- (void)performActivity {
    BOOL completed = [[UIApplication sharedApplication] openURL:url];
    [self activityDidFinish:completed];
}

@end
