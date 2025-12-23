if not mods["Krastorio2-spaced-out"] and not mods["planet-muluna"] then return end

data:extend {{
    type = "item",
    name = "interstellar-research-data",
    stack_size = 200,
    icon = "__k2-plante-techcard-compat__/graphics/interstellar-research-data.png",
    icon_size = 256,
    subgroup = "science-pack",
    weight = 1 * kg,
    order = "ao75[muluna-research-data]"
},
{
    type = "tool",
    name = "interstellar-tech-card",
    stack_size = 200,
    icon = "__k2-plante-techcard-compat__/graphics/interstellar-tech-card.png",
    icon_size = 256,
    durability = data.raw.tool["automation-science-pack"].durability,
     durability_description_key = data.raw.tool["automation-science-pack"].durability_description_key,
    factoriopedia_durability_description_key = data.raw.tool["automation-science-pack"].factoriopedia_durability_description_key,
    durability_description_value = data.raw.tool["automation-science-pack"].durability_description_value,
    category = "kr-tech-cards",
    subgroup = "science-pack",
    weight = 1 * kg,
    order = "ao75[muluna-tech-data]"
}}

data:extend {{
        type = "recipe",
        name = "interstellar-research-data",
        category = "crafting-with-fluid",
        enabled = false,
        energy_required = 10,
        ingredients = {
            { amount = 1, name = "rocket-fuel", type = "item"},
            { amount = 1, name = "muluna-steam-crusher", type = "item" },
            { amount = 2, name = "low-density-space-platform-foundation", type = "item" },
            { amount = 10, fluidbox_index = 2, name = "muluna-astronomical-data", type = "fluid" }
        },
        results = {{ amount = 5, name = "interstellar-research-data", type = "item"}},
        main_product = "interstellar-research-data",
        allow_productivity = true,
        auto_recycle = false,
        surface_conditions = {
            { property = "gravity", min = 0.1, max = 0.1 },
            { property = "oxygen", min = 0, max = 0 }
        }
    },{
      type = "recipe",
      name = "interstellar-tech-card",
      category = "kr-tech-cards",
      enabled = false,
      energy_required = 20,
      ingredients = {
          {type = "item", name = "interstellar-research-data", amount = 5},
          {type = "item", name = "kr-blank-tech-card", amount = 5},
      },
      results = {
          {type = "item", name = "interstellar-tech-card", amount = 5},
      },
      allow_productivity = true,
      auto_recycle = false,
  }}

local tech = data.raw.technology["interstellar-science-pack"]

if tech then
    tech.effects = {
        {type = "unlock-recipe", recipe = "interstellar-research-data"},
        {type = "unlock-recipe", recipe = "interstellar-tech-card"}
    }
end
