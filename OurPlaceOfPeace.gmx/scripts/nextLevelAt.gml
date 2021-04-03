
// https://www.desmos.com/calculator/wwxegm7gt6
// f(x) = 10 * 9 * x * 5^(1 + x/150)
var nextLevel = global.maxPlayerLevel + 1;
if(nextLevel > 100) {
    return 999999;
}

// A foe's experience is their total stat multiplied by their level.
// Thus the experience required for the next level should be...
// averageStat * statCount * nextLevel * minimumFoeKillCount
// Killing exactly 5 isn't scalable, so add an exponent that increases with level.
// Make it small though: 1 + nextLevel / exponentialChange
var statCount = PLY_MAX - 1;
var averageStat = 10;
var minimumFoeKillCount = 3;
var fractionalExponentChange = 50;
var foeKillCount = power(minimumFoeKillCount, 1 + nextLevel / fractionalExponentChange);
var experienceRequired = averageStat * statCount * nextLevel * foeKillCount 
return floor(experienceRequired);

