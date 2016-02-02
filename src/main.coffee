





############################################################################################################
njs_path                  = require 'path'
# njs_fs                    = require 'fs'
#...........................................................................................................
CND                       = require 'cnd'
rpr                       = CND.rpr
badge                     = 'MK/main'
log                       = CND.get_logger 'plain',     badge
info                      = CND.get_logger 'info',      badge
whisper                   = CND.get_logger 'whisper',   badge
alert                     = CND.get_logger 'alert',     badge
debug                     = CND.get_logger 'debug',     badge
warn                      = CND.get_logger 'warn',      badge
help                      = CND.get_logger 'help',      badge
urge                      = CND.get_logger 'urge',      badge
echo                      = CND.echo.bind CND
#...........................................................................................................
@PLUGIN_MANAGER           = require './plugin-manager'
# D                         = require 'pipedreams'
#...........................................................................................................
### Registering global `MK` that represents this app rack. ###
### NB we could do this using `Symbol.for 'MK'` to obtain better namespace separation ###
global.MK                 = @
global.MK.TS              = require 'mingkwai-typesetter'



#===========================================================================================================
# REGISTER PLUGINS (PRE-ALPHA)
#-----------------------------------------------------------------------------------------------------------
do ->
  ### To get started with plugins handling, we'll assume that all plugins are installed (or linked) in the
  MINGKWAI(rack) `node_modules` folder, and that all plugins are to be inserted after the producing
  end of the MD read stream and before the consuming end of the TeX write stream. At this point there will
  be no particular ordering between plugins. ###
  plugin_home           = njs_path.resolve __dirname, '../node_modules'
  plugin_info_by_routes = MK.PLUGIN_MANAGER.find_plugin_package_infos plugin_home
  MK.TS.plugins         = []
  #.........................................................................................................
  for plugin_route, plugin_info of plugin_info_by_routes
    plugin_name   = plugin_info[ 'name' ]
    plugin        = require plugin_route
    MK.TS.plugins.push plugin
  #.........................................................................................................
  return null




