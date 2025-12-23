if not mods["Krastorio2-spaced-out"] and not mods["planet-muluna"] then return end

local util = require("util");

util.remove_lab_input("lab", "interstellar-science-pack");
util.remove_lab_input("biolab", "interstellar-science-pack");
util.remove_lab_input("kr-advanced-lab", "interstellar-science-pack");
util.remove_lab_input("kr-singularity-lab", "interstellar-science-pack");

util.add_lab_input("lab", "interstellar-tech-card");
util.add_lab_input("biolab", "interstellar-tech-card");
util.add_lab_input("kr-advanced-lab", "interstellar-tech-card");

util.replace_science_pack_in_all_technologies("interstellar-science-pack", "interstellar-tech-card");
