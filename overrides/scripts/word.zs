import crafttweaker.player.IPlayer;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.data.IData;
import mods.contenttweaker.Commands;
import crafttweaker.entity.IEntity;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.world.IWorld;
events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
    var world as IWorld = event.player.world;
    var player as IPlayer = event.player;
    if(player.world.remote) return;
    if(isNull(world.getCustomWorldData().world)){
        mods.contenttweaker.Commands.call("worldborder center ~ ~", player, player.world, false, true);
        mods.contenttweaker.Commands.call("worldborder set 250", player, player.world, false, true);
        world.setCustomWorldData({world: {player: 1}});
    }
});

events.onEntityLivingDeath(function(event as EntityLivingDeathEvent) {
    var player as IPlayer = event.damageSource.trueSource ;
    if(!isNull(event.damageSource.trueSource) && event.damageSource.trueSource instanceof IPlayer){
        if(player.world.remote) return;
        if(!isNull(event.entity.nbt.ForgeCaps.memberGet("champions:championship"))){
            if(!isNull(event.entity.nbt.ForgeCaps.memberGet("champions:championship").tier)){
            var entitnbt as IData = event.entity.nbt.ForgeCaps.memberGet("champions:championship").tier;
            if(entitnbt == 0) return;
        if(!isNull(player.data.PlayerPersisted.world) && !isNull(player.data.PlayerPersisted.entity)){
            var world as IData = player.data.PlayerPersisted.world;
            var entity as IData = player.data.PlayerPersisted.entity;
            var worldt as int = 250 + world * 50;
            player.update({PlayerPersisted: {entity: entity+1}});
            if(entity >= 10){
                mods.contenttweaker.Commands.call("worldborder set " + worldt, player, player.world, false, true);
                player.update({PlayerPersisted: {entity: 0}});
                player.update({PlayerPersisted: {world: world+1}});
            }
        }else{
            player.update({PlayerPersisted: {world: 0}});
            player.update({PlayerPersisted: {entity: 1}});
        }
        }
        }   
   }
});