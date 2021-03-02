///get_damage(allyAttackStat, allyAttackMultiplier, allyPower, foeDefense)
var allyAttackStat = argument0;
var allyAttackMultiplier = argument1;
var allyPower = argument2;
var foeDefense = argument3;

var rawDamage = allyAttackStat * allyAttackMultiplier;
var maxDamage = rawDamage * 1.75;

// Damage will always be at least 25% of the ally attack stat and multiplier
var minDamage = rawDamage * 0.25;

// Ally Power Breaks through defense much more than expected total damage ever will.
var allyAntiDefenseAttack = allyPower * 0.75 + rawDamage / 2;

// The defense effective against the attack is only half as potent.
var foeEffectiveDefense = foeDefense * 0.5;

// Always take at least one of the damage
var damageFromDefense = max(1, allyAntiDefenseAttack - foeEffectiveDefense);

var effectiveDamageFromDefense = damageFromDefense * 0.75;

// We add the 75% of this damage to the 25% of the max damage we already have.
var someDamage = minDamage + effectiveDamageFromDefense;
someDamage = min(someDamage, maxDamage);
someDamage = max(someDamage, 1);

return floor(someDamage);
