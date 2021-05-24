#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if(monthNumber > 0 && monthNumber <13)
    {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setCalendar:[NSCalendar autoupdatingCurrentCalendar]];
        [dateFormatter setDateFormat:@"MM"];
//        standaloneMonthSymbols - to return months with correct endings (падеж)
        return [[dateFormatter standaloneMonthSymbols] objectAtIndex:(monthNumber - 1)];
    }
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setCalendar:[NSCalendar autoupdatingCurrentCalendar]];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSDate *formattedDate = [dateFormatter dateFromString:date];
    if(formattedDate)
    {
        [dateFormatter setDateFormat:@"dd"];
        return [[dateFormatter stringFromDate:formattedDate] longLongValue];
    }
    return 0;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSTimeInterval timeZoneSeconds = [[NSTimeZone localTimeZone] secondsFromGMT];
    NSDate *dateInLocalTimezone = [date dateByAddingTimeInterval:timeZoneSeconds];
    
    if(dateInLocalTimezone)
    {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setCalendar:[NSCalendar autoupdatingCurrentCalendar]];
        [dateFormatter setDateFormat:@"EEE"];
        [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"ru_RU"]];
        
        return [dateFormatter stringFromDate:dateInLocalTimezone];
    }
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    calendar.firstWeekday = 2;
    
    NSDateComponents *dateComponent = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:[NSDate now]];
    
    NSDateComponents *currentWeekComponents = [NSDateComponents new];
    currentWeekComponents.weekday = calendar.firstWeekday;
    currentWeekComponents.weekOfYear = dateComponent.weekOfYear;
    currentWeekComponents.year = dateComponent.year;
    NSTimeInterval timeZoneSeconds = [[NSTimeZone localTimeZone] secondsFromGMT];
    
    NSDate *startOfTheWeek = [[calendar dateFromComponents:currentWeekComponents] dateByAddingTimeInterval:timeZoneSeconds];
    NSDate *endOfTheWeek = [calendar dateByAddingUnit:NSCalendarUnitDay value:6 toDate:startOfTheWeek options:0];
    
    
//    Alternative option to get first and last days of the current week
    
//    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
//    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:[NSDate date]];
//    [componentsToSubtract setDay: - ((([weekdayComponents weekday] - [calendar firstWeekday]) + 7 ) % 7)];
//    NSDate *beginningOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:[NSDate date] options:0];
//
//    NSDateComponents *components = [calendar components: (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate: beginningOfWeek];
//    beginningOfWeek = [[calendar dateFromComponents: components] dateByAddingTimeInterval:timeZoneSeconds];
//    NSDate *endOfWeek = [calendar dateByAddingUnit:NSCalendarUnitDay value:6 toDate:beginningOfWeek options:0];

    
    return ([date compare:startOfTheWeek] != NSOrderedAscending) && ([date compare:endOfTheWeek] != NSOrderedDescending);
}

@end
