(function() {
  var CND, alert, app, app_name, badge, debug, echo, help, info, log, rpr, urge, warn, whisper;

  (require('source-map-support')).install();

  CND = require('cnd');

  rpr = CND.rpr;

  badge = 'MK/cli';

  log = CND.get_logger('plain', badge);

  info = CND.get_logger('info', badge);

  whisper = CND.get_logger('whisper', badge);

  alert = CND.get_logger('alert', badge);

  debug = CND.get_logger('debug', badge);

  warn = CND.get_logger('warn', badge);

  help = CND.get_logger('help', badge);

  urge = CND.get_logger('urge', badge);

  echo = CND.echo.bind(CND);

  app = require('commander');

  app_name = process.argv[1];

  app.version((require('../package.json'))['version']).command('mkts <filename>').action(function(filename) {
    help(CND.grey("" + app_name), CND.gold('mkts'), CND.lime(filename));

    /* Needed to register global `MK` */
    require('./main');
    return MK.TS.TEX_WRITER.pdf_from_md(filename, (function(_this) {
      return function(error) {
        if (error != null) {
          throw error;
        }
        return help("finished on " + (new Date()));
      };
    })(this));
  });

  app.parse(process.argv);

}).call(this);

//# sourceMappingURL=../sourcemaps/cli.js.map
