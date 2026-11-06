data:extend({
  {
    type = "artillery-projectile",
    name = "decoy-shell-projectile",
    flags = { "not-on-map" },
    reveal_map = true,
    picture = {
      filename = "__base__/graphics/icons/artillery-shell.png",
      width = 64,
      height = 64,
      scale = 0.5
    },
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "script",
            effect_id = "decoy-shell-impact"
          }
        }
      }
    }
  },
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
  },
  {
    type = "ammo",
    name = "decoy-shell",
    icon = "__base__/graphics/icons/artillery-shell.png",
    icon_size = 64,
    ammo_type = {
      category = "artillery-shell",
      target_type = "position",
      action = {
        type = "direct",
        action_delivery = {
          type = "artillery",
          projectile = "decoy-shell-projectile",
          starting_speed = 1,
          direction_deviation = 0,
          range_deviation = 0
        }
      }
    },
    subgroup = "ammo",
    order = "d[explosive]-d[decoy-shell]",
    stack_size = 1
  },
  {
    type = "recipe",
    name = "decoy-shell",
    enabled = true,
    energy_required = 10,
    ingredients = {
      { "iron-plate", 1 },
      { "explosives", 1 },
      { "raw-fish", 1 }
    },
    results = {
      { type = "item", name = "decoy-shell", amount = 1 }
    },
    subgroup = "ammo",
    order = "d[explosive]-d[decoy-shell]"
  }
})
