-- Runtime initialization and event handlers go here.

local decoy_shell_impact = "decoy-shell-impact"
local decoy_shell_range = 30

script.on_event(defines.events.on_script_trigger_effect, function(event)
  if event.effect_id ~= decoy_shell_impact or not event.target_position then
    return
  end

  local surface = game.get_surface(event.surface_index)
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
end)
