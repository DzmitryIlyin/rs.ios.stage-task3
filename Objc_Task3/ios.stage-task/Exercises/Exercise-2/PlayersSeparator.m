#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger counter = 0;
    for (int i = 0; i < ratingArray.count; i++)
    {
        for (int j = i + 1; j < ratingArray.count; j++)
        {
            if(ratingArray[i].intValue > ratingArray[j].intValue)
            {
                for (int k = j + 1; k < ratingArray.count; k++)
                {
                    if (ratingArray[j].intValue > ratingArray[k].intValue) {
                        counter++;
                    }
                }
            } else
            {
                for (int k = j + 1; k < ratingArray.count; k++)
                {
                    if (ratingArray[j].intValue < ratingArray[k].intValue) {
                        counter++;
                    }
                }
            }
        }
    }
    
    return counter;
}

@end
