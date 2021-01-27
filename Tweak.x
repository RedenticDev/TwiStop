@interface UIApplication (TwiStop)
-(void)suspend;
@end

%hook TFNPullToRefreshControl

-(void)_updateContentInset:(id)arg1 animated:(BOOL)arg2 {
    [[UIApplication sharedApplication] suspend];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.75 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{ exit(0); });
}

%end