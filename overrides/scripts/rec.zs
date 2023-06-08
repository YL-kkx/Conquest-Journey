import crafttweaker.event.PlayerLeftClickBlockEvent;
import crafttweaker.event.PlayerInteractEvent;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.block.IBlock;
import crafttweaker.item.IMutableItemStack;
import crafttweaker.item.IItemStack;
import mods.zenutils.cotx.TileEntityInGame;
import crafttweaker.data.IData;
events.onPlayerLeftClickBlock(function(event as PlayerLeftClickBlockEvent) {
        if(event.world.remote) return;
    if(!isNull(event.item) && event.item.definition.id == "minecraft:emerald_block"){
        if(event.block.definition.id == "spawnercontrol:recruiting_institute" || event.block.definition.id == "spawnercontrol:recruiting_institute"){
             event.item.mutable().shrink(1);
       event.world.setBlockState(event.world.getBlockState(event.position), event.block.data+{spawnerCap: {SpawnedMobsCount: 0}}, event.position);
        }
      
    }
});