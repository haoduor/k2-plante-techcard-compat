if not mods["Krastorio2-spaced-out"] and not mods["atan-nuclear-science"] then return end

local util = require("util");

util.remove_lab_input("lab", "nuclear-science-pack");
util.remove_lab_input("biolab", "nuclear-science-pack");
util.remove_lab_input("kr-advanced-lab", "nuclear-science-pack");
util.remove_lab_input("kr-singularity-lab", "nuclear-science-pack");

util.add_lab_input("lab", "nuclear-tech-card");
util.add_lab_input("biolab", "nuclear-tech-card");
util.add_lab_input("kr-advanced-lab", "nuclear-tech-card");


util.replace_science_pack_in_all_technologies("nuclear-science-pack", "nuclear-tech-card");
