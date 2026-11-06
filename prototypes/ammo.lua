data:extend({
  {
    type = "ammo",
    name = "advanced-artillery-shell",
    icon = "__base__/graphics/icons/artillery-shell.png",
    icon_size = 64,
    ammo_type = {
      category = "artillery-shell",
      target_type = "position",
      action = {
        type = "direct",
        action_delivery = {
          type = "artillery",
          projectile = "artillery-projectile",
          starting_speed = 1,
          direction_deviation = 0,
          range_deviation = 0
        }
      }
    },
    subgroup = "ammo",
    order = "d[explosive]-c[advanced-artillery-shell]",
    stack_size = 1
  },
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
