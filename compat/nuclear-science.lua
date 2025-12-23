if not mods["Krastorio2-spaced-out"] and not mods["atan-nuclear-science"] then return end

data:extend {{
    type = "item",
    name = "nuclear-research-data",
    stack_size = 200,
    icon = "__k2-plante-techcard-compat__/graphics/nuclear-science-research-data.png",
    icon_size = 256,
    subgroup = "science-pack",
    weight = 1 * kg,
    order = "b[nuclear-research-data]"
},
{
    type = "tool",
    name = "nuclear-tech-card",
    stack_size = 200,
    icon = "__k2-plante-techcard-compat__/graphics/nuclear-science-tech-card.png",
    icon_size = 256,
    durability = data.raw.tool["automation-science-pack"].durability,
    durability_description_key = data.raw.tool["automation-science-pack"].durability_description_key,
    factoriopedia_durability_description_key = data.raw.tool["automation-science-pack"].factoriopedia_durability_description_key,
    durability_description_value = data.raw.tool["automation-science-pack"].durability_description_value,
    subgroup = "science-pack",
    weight = 1 * kg,
    order = "b[nuclear-tech-card]"
}}


data:extend {{
        type = "recipe",
        name = "nuclear-research-data",
        category = "centrifuging",
        enabled = false,
        energy_required = 10,
        ingredients = {
            { type = "item", name = "uranium-235", amount = 1 },
            { type = "item", name = "water-barrel", amount = 20 },
            { type = "item", name = "concrete", amount = 10 },
        },
        results = {
            { type = "item", name = "nuclear-research-data", amount = 2 },
            { type = "item", name = "barrel", amount = 20, ignored_by_productivity = 20 },
        },
        main_product = "nuclear-research-data",
        allow_productivity = true,
        surface_conditions = {
            { property = "pressure", min = 1000, max = 1000 },
        }
    },{
      type = "recipe",
      name = "nuclear-tech-card",
      category = "kr-tech-cards",
      enabled = false,
      energy_required = 20,
      ingredients = {
          {type = "item", name = "nuclear-research-data", amount = 5},
          {type = "item", name = "kr-blank-tech-card", amount = 5},
      },
      results = {
          {type = "item", name = "nuclear-tech-card", amount = 5},
      },
      allow_productivity = true,
      auto_recycle = false,
  }}

local tech = data.raw.technology["nuclear-science-pack"]

if tech then
    -- table.insert(tech.effects, {type = "unlock-recipe", recipe = "nuclear-research-data"})
    tech.effects = {
        {type = "unlock-recipe", recipe = "nuclear-research-data"},
        {type = "unlock-recipe", recipe = "nuclear-tech-card"}
    }
end
