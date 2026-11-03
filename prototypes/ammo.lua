local artillery_shell = data.raw["ammo"]["artillery-shell"]

if artillery_shell then
  local advanced_artillery_shell = table.deepcopy(artillery_shell)

  advanced_artillery_shell.name = "advanced-artillery-shell"
  advanced_artillery_shell.order = "d[explosive]-c[advanced-artillery-shell]"
  advanced_artillery_shell.icon = artillery_shell.icon or "__base__/graphics/icons/artillery-shell.png"
  advanced_artillery_shell.icon_size = artillery_shell.icon_size or 64
  advanced_artillery_shell.icons = artillery_shell.icons
  advanced_artillery_shell.stack_size = 10

  advanced_artillery_shell.ammo_type = table.deepcopy(artillery_shell.ammo_type)
  advanced_artillery_shell.ammo_type.category = "artillery-shell"
  advanced_artillery_shell.ammo_type.action = {
    type = "direct",
    action_delivery = {
      type = "projectile",
      projectile = "artillery-projectile",
      starting_speed = 1,
      direction_deviation = 0,
      range_deviation = 0,
      max_range = 0,
      min_range = 0
    }
  }

  data:extend({
    advanced_artillery_shell,
    {
      type = "recipe",
      name = "advanced-artillery-shell",
      enabled = true,
      energy_required = 10,
      ingredients = {
        { "artillery-shell", 1 },
        { "explosives", 10 }
      },
      results = {
        { type = "item", name = "advanced-artillery-shell", amount = 1 }
      },
      subgroup = "ammo",
      order = "d[explosive]-c[advanced-artillery-shell]"
    }
  })
else
  log("advanced-artillery-ammunition: base artillery-shell prototype was not found; skipping custom ammo creation.")
end
