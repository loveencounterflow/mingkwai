(function() {
  var CND, alert, badge, debug, echo, help, info, log, njs_path, plugin, plugin_info, plugin_info_by_routes, plugin_name, plugin_route, plugins, route, rpr, urge, warn, whisper;

  njs_path = require('path');

  CND = require('cnd');

  rpr = CND.rpr;

  badge = 'MINGKWAI/main';

  log = CND.get_logger('plain', badge);

  info = CND.get_logger('info', badge);

  whisper = CND.get_logger('whisper', badge);

  alert = CND.get_logger('alert', badge);

  debug = CND.get_logger('debug', badge);

  warn = CND.get_logger('warn', badge);

  help = CND.get_logger('help', badge);

  urge = CND.get_logger('urge', badge);

  echo = CND.echo.bind(CND);

  debug('©69647', Object.keys(global.MKTS = require('mingkwai-typesetter')));

  route = njs_path.resolve(__dirname, '../node_modules');

  help('7238', process.cwd());

  help('7238', route);

  plugins = {};

  plugin_info_by_routes = MKTS.PLUGIN_MANAGER.find_plugin_package_infos(route);

  for (plugin_route in plugin_info_by_routes) {
    plugin_info = plugin_info_by_routes[plugin_route];
    plugin_name = plugin_info['name'];
    debug('234627', plugin_route);
    plugins[plugin_name] = require(plugin_route);
  }

  for (plugin_name in plugins) {
    plugin = plugins[plugin_name];
    urge('93274', plugin_name, Object.keys(plugin));
  }

}).call(this);

//# sourceMappingURL=../sourcemaps/main.js.map
