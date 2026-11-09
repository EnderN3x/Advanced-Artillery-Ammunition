-- Advanced artillery shell
local advanced_artillery_shell = {
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
}

local advanced_artillery_shell_recipe = {
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

data:extend({
  advanced_artillery_shell,
  advanced_artillery_shell_recipe
})
-- End of advanced artillery shell

-- Decoy shell
local decoy_shell = {
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
}

local decoy_shell_recipe = {
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

local decoy_shell_projectile = {
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
}

data:extend({
  decoy_shell,
  decoy_shell_recipe,
  decoy_shell_projectile
})
-- End of decoy shell

-- AB airburst shell
local ab_airburst_shell = {
  type = "ammo",
  name = "ab-airburst-shell",
  icon = "__base__/graphics/icons/artillery-shell.png",
  icon_size = 64,
  ammo_type = {
    category = "artillery-shell",
    target_type = "position",
    action = {
      type = "direct",
      action_delivery = {
        type = "artillery",
        projectile = "ab-airburst-shell-projectile",
        starting_speed = 1,
        direction_deviation = 0,
        range_deviation = 0
      }
    }
  },
  subgroup = "ammo",
  order = "d[explosive]-e[ab-airburst-shell]",
  stack_size = 1
}

local ab_airburst_shell_recipe = {
  type = "recipe",
  name = "ab-airburst-shell",
  enabled = true,
  energy_required = 10,
  ingredients = {
    { "artillery-shell", 1 },
    { "explosives", 10 }
  },
  results = {
    { type = "item", name = "ab-airburst-shell", amount = 1 }
  },
  subgroup = "ammo",
  order = "d[explosive]-e[ab-airburst-shell]"
}

local ab_airburst_shell_projectile = {
  type = "artillery-projectile",
  name = "ab-airburst-shell-projectile",
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
          effect_id = "ab-airburst-shell-impact"
        }
      }
    }
  }
}

data:extend({
  ab_airburst_shell,
  ab_airburst_shell_recipe,
  ab_airburst_shell_projectile
})
-- End of AB airburst shell

-- HE cluster shell
local he_cluster_shell = {
  type = "ammo",
  name = "he-cluster-shell",
  icon = "__base__/graphics/icons/artillery-shell.png",
  icon_size = 64,
  ammo_type = {
    category = "artillery-shell",
    target_type = "position",
    action = {
      type = "direct",
      action_delivery = {
        type = "artillery",
        projectile = "he-cluster-shell-projectile",
        starting_speed = 1,
        direction_deviation = 0,
        range_deviation = 0
      }
    }
  },
  subgroup = "ammo",
  order = "d[explosive]-f[he-cluster-shell]",
  stack_size = 1
}

local he_cluster_shell_recipe = {
  type = "recipe",
  name = "he-cluster-shell",
  enabled = true,
  energy_required = 10,
  ingredients = {
    { "artillery-shell", 1 },
    { "explosives", 10 }
  },
  results = {
    { type = "item", name = "he-cluster-shell", amount = 1 }
  },
  subgroup = "ammo",
  order = "d[explosive]-f[he-cluster-shell]"
}

local he_cluster_shell_projectile = {
  type = "artillery-projectile",
  name = "he-cluster-shell-projectile",
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
          effect_id = "he-cluster-shell-impact"
        }
      }
    }
  }
}

data:extend({
  he_cluster_shell,
  he_cluster_shell_recipe,
  he_cluster_shell_projectile
})
-- End of HE cluster shell
