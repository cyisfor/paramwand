image = 'paramwand_wand.png'

minetest.register_tool("paramwand:wand",{
    description="Show param2",
    inventory_image = image,
    wield_image = image,
    stack_max = 1,
        tool_capabilities = {
            full_punch_interval=0,
            max_drop_level=0
        },
     on_use = function(self,user,punched)
        local pos = minetest.get_pointed_thing_position(punched)
        if pos==nil then
            return
        end
        local node = minetest.get_node(pos)
        if node == nil then
            return
        end
        local idef = minetest.registered_nodes[node.name]
        if idef == nil then
            return
        end
        node.param2 = (node.param2 + 1) % 23
        minetest.set_node(pos,node)
        minetest.chat_send_player(user:get_player_name(),"param2 = "..node.param2,"Paramwand")
    end
})
        
