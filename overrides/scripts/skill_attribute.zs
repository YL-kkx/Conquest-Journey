import skillful.event.EventManager;
import skillful.event.skill.registry.SkillRegisterEvent;
import skillful.skill.Skill;
import skillful.skill.SkillType;
import skillful.skill.SkillTypeBuilder;

import crafttweaker.event.EntityLivingUseItemEvent.All;
import crafttweaker.event.EntityLivingUseItemEvent.Finish;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import skillful.event.skill.lvl.SkillLevelEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.event.EntityLivingAttackedEvent;
import crafttweaker.event.ILivingEvent;
import crafttweaker.entity.IEntityDefinition;
import mods.ctutils.utils.Math;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.event.PlayerCraftedEvent;
import crafttweaker.event.CriticalHitEvent;
import crafttweaker.event.EntityStruckByLightningEvent;
import crafttweaker.event.ItemFishedEvent;
import crafttweaker.event.PlayerUseHoeEvent;
//注册技能
val manager as EventManager = EventManager.getInstance();
//生命
val maxhealth as SkillType = SkillTypeBuilder.create("test:maxhealth")
.setMaxLevel(100)
.setColor("white")
.setLevelRequiredXp(function(level as int) {
    return level * 200;
}).build();
//速度
val agility as SkillType = SkillTypeBuilder.create("test:agility")
.setMaxLevel(100)
.setColor("white")
.setLevelRequiredXp(function(level as int) {
    return level * 200;
}).build();
//防御
val defense as SkillType = SkillTypeBuilder.create("test:defense")
.setMaxLevel(100)
.setColor("white")
.setLevelRequiredXp(function(level as int) {
    return level * 200;
}).build();
//韧性
val building as SkillType = SkillTypeBuilder.create("test:building")
.setMaxLevel(100)
.setColor("white")
.setLevelRequiredXp(function(level as int) {
    return level * 200;
}).build();
//攻击
val attack as SkillType = SkillTypeBuilder.create("test:attack")
.setMaxLevel(100)
.setColor("white")
.setLevelRequiredXp(function(level as int) {
    return level * 200;
}).build();
//幸运
val gathering as SkillType = SkillTypeBuilder.create("test:gathering")
.setMaxLevel(100)
.setColor("white")
.setLevelRequiredXp(function(level as int) {
    return level * 200;
}).build();
//智力
val magic as SkillType = SkillTypeBuilder.create("test:magic")
.setMaxLevel(100)
.setColor("white")
.setLevelRequiredXp(function(level as int) {
    return level * 200;
}).build();
//攻速
val mining as SkillType = SkillTypeBuilder.create("test:mining")
.setMaxLevel(100)
.setColor("white")
.setLevelRequiredXp(function(level as int) {
    return level * 200;
}).build();
//添加技能
manager.onSkillRegister(function(event as SkillRegisterEvent) {
    event.addSkill(maxhealth);
    event.addSkill(agility);
    event.addSkill(defense);
    event.addSkill(building);
    event.addSkill(attack);
    event.addSkill(gathering);
    event.addSkill(magic);
    event.addSkill(mining);
});
//技能获取方式
//幸运
events.onCriticalHit(function(event as CriticalHitEvent){
    var player as IPlayer = event.player;
    val leve as int = event.damageModifier as int;
    if(Math.random() < 0.3){
    player.getSkillStat("test:gathering").changeXp(player,leve);
    }
});
events.onItemFished(function(event as ItemFishedEvent){
    var player as IPlayer = event.player;
    val leve as int = player.xp;
    if(Math.random() < 0.3){
    player.getSkillStat("test:gathering").changeXp(player,leve);
    }
});
events.onPlayerUseHoe(function(event as PlayerUseHoeEvent){
    var player as IPlayer = event.player;
    val leve as int = player.xp;
    if(Math.random() < 0.3){
    player.getSkillStat("test:gathering").changeXp(player,leve);
}
});
//智力
events.onPlayerCrafted(function(event as PlayerCraftedEvent){
    var player as IPlayer = event.player;
    val leve as int =player.xp;
    player.getSkillStat("test:magic").changeXp(player,leve);
});
//攻速
events.onEntityLivingAttacked(function(event as EntityLivingAttackedEvent) {
    var player as IPlayer = event.damageSource.trueSource;
    val leve as int =event.amount as int;
    if(!isNull(event.damageSource.trueSource) && event.damageSource.trueSource instanceof IPlayer){
    player.getSkillStat("test:mining").changeXp(player,leve);
    }
});
//攻击
events.onEntityLivingDeath(function(event as EntityLivingDeathEvent) {
    var player as IPlayer = event.damageSource.trueSource;
   val leve as int =event.entityLivingBase.maxHealth as int;
    if(!isNull(event.damageSource.trueSource) && event.damageSource.trueSource instanceof IPlayer){
        player.getSkillStat("test:attack").changeXp(player, leve);
   }
});
//韧性
events.onEntityLivingAttacked(function(event as EntityLivingAttackedEvent) {
   val player as IPlayer = event.entityLivingBase;
   val leve as int =event.amount as int;
    if(event.entityLivingBase instanceof IPlayer && !isNull(event.damageSource) && player.alive ){
        if(event.damageSource.damageType == <damageSource:ON_FIRE>.damageType || event.damageSource.damageType == <damageSource:FALL>.damageType || event.damageSource.magicDamage  || event.damageSource.explosion){
            player.getSkillStat("test:building").changeXp(player, leve);
        } else if(event.damageSource.damageType == <damageSource:CACTUS>.damageType){
            if(Math.random() < 0.1){
               player.getSkillStat("test:building").changeXp(player, leve); 
            }
        }
       
   }
});
//防御
events.onEntityLivingAttacked(function(event as EntityLivingAttackedEvent) {
   val player as IPlayer = event.entityLivingBase;
   val leve as int =event.amount as int;
    if(event.entityLivingBase instanceof IPlayer && !isNull(event.damageSource.trueSource) &&  event.damageSource.trueSource.alive){
       player.getSkillStat("test:defense").changeXp(player, leve);
   }
});
//速度
events.onPlayerTick(function(event as PlayerTickEvent) {
   val player as IPlayer = event.player;
    if(player.isSprinting){
        if(Math.random() < 0.05){
       player.getSkillStat("test:agility").changeXp(player, 1);
        }
   }
});

//生命
events.onEntityLivingUseItemFinish(function(event as All) {
   val player as IPlayer = event.player;
    val item as IItemStack = event.item;
    val leve as int = item.healAmount;
    if(item.isFood){
       player.getSkillStat("test:maxhealth").changeXp(player,leve);
   }
});

//属性
events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    val maxhealth as int = player.getSkillStat("test:maxhealth").level;
    val agilitys as int = player.getSkillStat("test:agility").level;
    val defenses as int = player.getSkillStat("test:defense").level;
    val buildings as int = player.getSkillStat("test:building").level;
    val attacks as int = player.getSkillStat("test:attack").level;
    val gatherings as int = player.getSkillStat("test:gathering").level;
    val magics as int = player.getSkillStat("test:magic").level;
    val minings as int = player.getSkillStat("test:mining").level;

    var farming as int = event.player.skillData.getSkillInfo(<skill:reskillable:farming>).getLevel() as int;
    var agility as int =event.player.skillData.getSkillInfo(<skill:reskillable:agility>).getLevel() as int;
    var defense as int = event.player.skillData.getSkillInfo(<skill:reskillable:defense>).getLevel() as int;
    var building as int = event.player.skillData.getSkillInfo(<skill:reskillable:building>).getLevel() as int;
    var attack as int = event.player.skillData.getSkillInfo(<skill:reskillable:attack>).getLevel() as int;
    var gathering as int = event.player.skillData.getSkillInfo(<skill:reskillable:gathering>).getLevel() as int;
    var magic as int = event.player.skillData.getSkillInfo(<skill:reskillable:magic>).getLevel() as int;
    var mining as int = event.player.skillData.getSkillInfo(<skill:reskillable:mining>).getLevel() as int;
    if(maxhealth >= 1 && farming != maxhealth){
        player.skillData.getSkillInfo(<skill:reskillable:farming>).levelUp();
    }else if(agilitys >= 1 && agility != agilitys){
        player.skillData.getSkillInfo(<skill:reskillable:agility>).levelUp();
    }
    else if(defenses >= 1 && defense != defenses){
        player.skillData.getSkillInfo(<skill:reskillable:defense>).levelUp();
    }else if(buildings >= 1 && building != buildings){
        player.skillData.getSkillInfo(<skill:reskillable:building>).levelUp();
    }else if(attacks >= 1 && attack != attacks){
        player.skillData.getSkillInfo(<skill:reskillable:attack>).levelUp();
    }else if(gatherings >= 1 && gathering != gatherings){
        player.skillData.getSkillInfo(<skill:reskillable:gathering>).levelUp();
    }else if(magics >= 1 && magic != magics){
        player.skillData.getSkillInfo(<skill:reskillable:magic>).levelUp();
    }else if(minings >= 1 && mining != minings){
        player.skillData.getSkillInfo(<skill:reskillable:mining>).levelUp();
    }
});

//清除缓存
events.onPlayerRespawn(function(event as PlayerRespawnEvent){
    val player as IPlayer = event.player;
    player.clearSkillInfoCache();
});