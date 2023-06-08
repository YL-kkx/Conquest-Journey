import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.Attribute;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.player.IPlayer;

events.onEntityLivingDeath(function(event as EntityLivingDeathEvent) {
        var player as IPlayer = event.damageSource.trueSource;
        if(event.entity.world.remote) return;
    if(isNull(event.entity)) return;
    if(!isNull(event.damageSource.trueSource) && event.damageSource.trueSource instanceof IPlayer && event.entity.definition.id == "mca:grimreapermca"){
         for entity in event.entity.world.getEntitiesInArea(crafttweaker.util.Position3f.create(((event.entity.x)- 250),((event.entity.y)- 250),((event.entity.z)- 250)),crafttweaker.util.Position3f.create(((event.entity.x)+ 250),((event.entity.y)+ 250),((event.entity.z)+ 250))){
        if(!isNull(entity.definition) && entity.definition.id == "mca:entityvillagermca"){
            var entityLivingBase as IEntityLivingBase = entity;
            var maxHealth as AttributeInstance = entityLivingBase.getAttribute("generic.maxHealth");
            if (!isNull(maxHealth.getModifier("a317b2f6-e2a5-46c6-919d-92e2b5c45194"))) {
                        maxHealth.removeModifier("a317b2f6-e2a5-46c6-919d-92e2b5c45194");
                    }
            maxHealth.applyModifier(AttributeModifier.createModifier("max", 50, 0 ,"a317b2f6-e2a5-46c6-919d-92e2b5c45194"));
            entityLivingBase.health = entityLivingBase.maxHealth;
            }
    }
    }
   
});