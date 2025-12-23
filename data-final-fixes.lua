if settings.startup["enable-muluan-tech-card"].value then
  require "compat.muluan-final-fixes";
end

if settings.startup["enable-atan-nuclear-tech-card"].value then
  require "compat.nuclear-science-final-fixes";
end