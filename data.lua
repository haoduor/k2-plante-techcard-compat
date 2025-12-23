if settings.startup["enable-muluan-tech-card"].value then
  require "compat.muluan";
end

if settings.startup["enable-atan-nuclear-tech-card"].value then
  require "compat.nuclear-science";
end