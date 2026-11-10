-- Runtime initialization and event handlers go here.

local decoy_shell_impact = "decoy-shell-impact"
local decoy_shell_range = 30
local ab_airburst_shell_impact = "ab-airburst-shell-impact"
local ab_airburst_shell_range = 20
local ab_airburst_unit_damage = 1000
local ab_airburst_structure_damage = 1
local he_cluster_shell_impact = "he-cluster-shell-impact"
local he_cluster_count = 8
local he_cluster_spread = 30
local he_cluster_radius = 5
local he_cluster_damage = 1000

script.on_event(defines.events.on_script_trigger_effect, function(event)
  if not event.target_position
    or (event.effect_id ~= decoy_shell_impact
      and event.effect_id ~= ab_airburst_shell_impact
      and event.effect_id ~= he_cluster_shell_impact) then
    return
  end

  local surface = game.get_surface(event.surface_index)
  if not surface then
    return
  end

  if event.effect_id == he_cluster_shell_impact then
    for _ = 1, he_cluster_count do
      -- sqrt gives a uniform spread over the disc
      local angle = math.random() * 2 * math.pi
      local distance = math.sqrt(math.random()) * he_cluster_spread
      local position = {
        x = event.target_position.x + math.cos(angle) * distance,
        y = event.target_position.y + math.sin(angle) * distance
      }

      surface.create_entity({ name = "big-explosion", position = position })
      local victims = surface.find_entities_filtered({
        position = position,
        radius = he_cluster_radius,
        force = "enemy"
      })
      for _, victim in pairs(victims) do
        if victim.valid and victim.destructible then
          victim.damage(he_cluster_damage, game.forces["player"], "explosion")
        end
      end
    end
    return
  end

  if event.effect_id == decoy_shell_impact then
    local units = surface.find_entities_filtered({
      position = event.target_position,
      radius = decoy_shell_range,
      force = "enemy",
      type = "unit"
    })

    for _, unit in pairs(units) do
      if unit.commandable then
        unit.commandable.set_command({
          type = defines.command.go_to_location,
          destination = event.target_position,
          radius = 1,
          distraction = defines.distraction.none
        })
      end
    end
    return
  end

  local targets = surface.find_entities_filtered({
    position = event.target_position,
    radius = ab_airburst_shell_range,
    force = "enemy",
    type = { "unit", "unit-spawner", "turret" }
  })

  for _, target in pairs(targets) do
    local damage
    if target.type == "unit" then
      if target.name:match("%-biter$") or target.name:match("%-spitter$") then
        damage = ab_airburst_unit_damage
      end
    elseif target.type == "unit-spawner"
      or (target.type == "turret" and target.name:match("%-worm%-turret$")) then
      damage = ab_airburst_structure_damage
    end

    if damage then
      target.damage(damage, game.forces.player, "physical")
    end
  end
end)
