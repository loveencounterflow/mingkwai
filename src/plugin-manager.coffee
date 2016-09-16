
############################################################################################################
njs_path                  = require 'path'
njs_fs                    = require 'fs'
#...........................................................................................................
CND                       = require 'cnd'
rpr                       = CND.rpr
badge                     = 'mkts/plugin-manager'
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


#...........................................................................................................
join                      = njs_path.resolve
isa_folder                = ( route ) -> ( njs_fs.statSync route ).isDirectory()

#-----------------------------------------------------------------------------------------------------------
@find_plugin_package_infos = ( plugin_home, settings ) ->
  keyword       = settings?[ 'keyword' ] ? 'mingkwai-typesetter-plugin'
  help "looking for #{keyword} in #{plugin_home}"
  plugin_names  = njs_fs.readdirSync plugin_home
  R             = {}
  #.........................................................................................................
  for plugin_name in plugin_names
    continue if plugin_name.startsWith '.'
    plugin_route = join plugin_home, plugin_name
    continue unless isa_folder plugin_route
    #.......................................................................................................
    try
      package_info    = require join plugin_route, 'package.json'
    #.......................................................................................................
    catch error
      { message, } = error
      if message.startsWith 'Cannot find module '
        warn "#{message} (ok)"
        continue
      throw error
    #.......................................................................................................
    if ( keywords = package_info[ 'keywords' ] )?
      if keyword in keywords
        urge "found #{keyword}: #{plugin_route}"
        R[ plugin_route ] = package_info
  #.........................................................................................................
  return R


############################################################################################################
unless module.parent?
  debug @find_plugin_package_infos join __dirname, 'node_modules'

