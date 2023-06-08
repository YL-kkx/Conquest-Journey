// 改脚本复刻于贪婪整合包
import crafttweaker.entity.Attribute;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.event.PlayerCloneEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.player.IPlayer;
import mods.compatskills.Skill;
import mods.ctutils.utils.Math;
import crafttweaker.event.PlayerPickupXpEvent;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.IPlayerEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.EntityLivingDeathEvent;

events.onPlayerTick(function(event as PlayerTickEvent) {
    var player as IPlayer = event.player;
       if (event.phase != "END" || event.side != "SERVER") {
        return;
    }
    var farming as int = event.player.skillData.getSkillInfo(<skill:reskillable:farming>).getLevel() as int;
    var attack as int = event.player.skillData.getSkillInfo(<skill:reskillable:attack>).getLevel() as int;
    var defense as int = event.player.skillData.getSkillInfo(<skill:reskillable:defense>).getLevel() as int;
    var mining as int = event.player.skillData.getSkillInfo(<skill:reskillable:mining>).getLevel() as int;
    var gathering as int = event.player.skillData.getSkillInfo(<skill:reskillable:gathering>).getLevel() as int;
    var building as int = event.player.skillData.getSkillInfo(<skill:reskillable:building>).getLevel() as int;
    var agility as int = event.player.skillData.getSkillInfo(<skill:reskillable:agility>).getLevel() as int;
    if (!player.world.remote){
        if(farming!=1){
            var maxHealth as AttributeInstance = player.getAttribute("generic.maxHealth");
            var amount as double = 0.5 * farming;
            if (!isNull(maxHealth.getModifier("dc356de3-240b-4c4a-bcf4-79ab4c063151"))) {
                        maxHealth.removeModifier("dc356de3-240b-4c4a-bcf4-79ab4c063151");
                    }
            maxHealth.applyModifier(AttributeModifier.createModifier("max", amount, 0 ,"dc356de3-240b-4c4a-bcf4-79ab4c063151"));
        }if(attack!=1){
            var attackDamage as AttributeInstance = player.getAttribute("generic.attackDamage");
            var amount as double = 0.075 * attack;
            if (!isNull(attackDamage.getModifier("78a0db89-e54c-480c-8fb9-7d441a4ae395"))) {
                        attackDamage.removeModifier("78a0db89-e54c-480c-8fb9-7d441a4ae395");
                    }
            attackDamage.applyModifier(AttributeModifier.createModifier("attack", amount, 0 ,"78a0db89-e54c-480c-8fb9-7d441a4ae395"));
        }if(defense!=1){
            var armor as AttributeInstance = player.getAttribute("generic.armor");
            var amount as double = 0.25 * defense;
            if (!isNull(armor.getModifier("cea744da-83ec-4ab8-b14f-1dfc6b66bf35"))) {
                        armor.removeModifier("cea744da-83ec-4ab8-b14f-1dfc6b66bf35");
                    }
            armor.applyModifier(AttributeModifier.createModifier("arm", amount, 0 ,"cea744da-83ec-4ab8-b14f-1dfc6b66bf35"));
        }if(mining!=1){
            var attackSpeed as AttributeInstance = player.getAttribute("generic.attackSpeed");
            var amount as double = 0.03 * mining;
            if (!isNull(attackSpeed.getModifier("5e18aded-53cb-425f-ae5a-4e9d31f0042f"))) {
                        attackSpeed.removeModifier("5e18aded-53cb-425f-ae5a-4e9d31f0042f");
                    }
            attackSpeed.applyModifier(AttributeModifier.createModifier("attackspeed", amount, 0 ,"5e18aded-53cb-425f-ae5a-4e9d31f0042f"));
        }if(gathering!=1){
            var luck as AttributeInstance = player.getAttribute("generic.luck");
            var amount as double = 0.05 * gathering;
            if (!isNull(luck.getModifier("259e7ce3-66d8-4ba0-8c71-aed7b9ae183b"))) {
                        luck.removeModifier("259e7ce3-66d8-4ba0-8c71-aed7b9ae183b");
                    }
            luck.applyModifier(AttributeModifier.createModifier("luck", amount, 0 ,"259e7ce3-66d8-4ba0-8c71-aed7b9ae183b"));
        }if(building!=1){
            var armorToughness as AttributeInstance = player.getAttribute("generic.armorToughness");
            var amount as double = 0.2 * building;
            if (!isNull(armorToughness.getModifier("f2dc9b3a-e45b-4604-a2ed-12862412ae74"))) {
                        armorToughness.removeModifier("f2dc9b3a-e45b-4604-a2ed-12862412ae74");
                    }
            armorToughness.applyModifier(AttributeModifier.createModifier("armortoughness", amount, 0 ,"f2dc9b3a-e45b-4604-a2ed-12862412ae74"));
        }if(agility!=1){
            var movementSpeed as AttributeInstance = player.getAttribute("generic.movementSpeed");
            var amount as double = 0.001 * agility;
            if (!isNull(movementSpeed.getModifier("4e81e9a7-e701-4fdb-bbfc-24040710b7bf"))) {
                        movementSpeed.removeModifier("4e81e9a7-e701-4fdb-bbfc-24040710b7bf");
                    }
            movementSpeed.applyModifier(AttributeModifier.createModifier("movementspeed", amount, 0 ,"4e81e9a7-e701-4fdb-bbfc-24040710b7bf"));
        }
    }
});

events.onPlayerPickupXp(function (event as PlayerPickupXpEvent) {
    var player as IPlayer = event.player;
    var level as int = player.skillData.getSkillInfo(<skill:reskillable:magic>).getLevel() as int;
    var addedAmount as int = Math.ceil((event.xp as double * (0.02 * level as double) as double)) as int;
    player.addExperience(addedAmount);
});