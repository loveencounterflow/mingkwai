





############################################################################################################
njs_path                  = require 'path'
# njs_fs                    = require 'fs'
#...........................................................................................................
CND                       = require 'cnd'
rpr                       = CND.rpr
badge                     = 'MINGKWAI/main'
log                       = CND.get_logger 'plain',     badge
info                      = CND.get_logger 'info',      badge
whisper                   = CND.get_logger 'whisper',   badge
alert                     = CND.get_logger 'alert',     badge
debug                     = CND.get_logger 'debug',     badge
warn                      = CND.get_logger 'warn',      badge
help                      = CND.get_logger 'help',      badge
urge                      = CND.get_logger 'urge',      badge
echo                      = CND.echo.bind CND
# #...........................................................................................................
# suspend                   = require 'coffeenode-suspend'
# step                      = suspend.step
# #...........................................................................................................
# D                         = require 'pipedreams'
# $                         = D.remit.bind D
# $async                    = D.remit_async.bind D


debug '©69647', Object.keys global.MKTS = require 'mingkwai-typesetter'
# debug '©32489', Object.keys require.main.require 'mingkwai-typesetter-jizura'


# route     = njs_path.resolve process.cwd(), 'node_modules'
route     = njs_path.resolve __dirname, '../node_modules'
help '7238', process.cwd()
help '7238', route
plugins   = {}
# plugin_info_by_routes = @PLUGIN_MANAGER.find_plugin_package_infos route, { keyword: 'peerDependencies', }
plugin_info_by_routes = MKTS.PLUGIN_MANAGER.find_plugin_package_infos route #, { keyword: 'ansi', }
for plugin_route, plugin_info of plugin_info_by_routes
  plugin_name = plugin_info[ 'name' ]
  debug '234627', plugin_route
  plugins[ plugin_name ] = require plugin_route

# urge '93274', Object.keys @TEX_WRITER
for plugin_name, plugin of plugins
  urge '93274', plugin_name, Object.keys plugin





