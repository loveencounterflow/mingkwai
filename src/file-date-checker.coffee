
throw new Error "module not yet ready"

#-----------------------------------------------------------------------------------------------------------
get_file_time = ( path, allow_missing = no ) ->
  try
    stats = FS.statSync path
  catch error
    throw error unless allow_missing and error[ 'code' ] is 'ENOENT'
    return -Infinity
  return +stats.mtime

#-----------------------------------------------------------------------------------------------------------
sim_cache_is_out_of_date = ( S = null) ->
  S                  ?= new_state()
  source_time         = -Infinity
  source_time         = Math.max source_time, get_file_time S.paths.mkts_options
  source_time         = Math.max source_time, get_file_time S.paths.sims
  cache_time          = get_file_time S.paths.cache, true
  return cache_time < source_time


must_rewrite_cache  = sim_cache_is_out_of_date S


  # S                   = new_state()
  # must_rewrite_cache  = no
  # #.........................................................................................................
  # if must_rewrite_cache
  #   if module.parent? and not handler?
  #     cache_path = PATH.relative process.cwd(), S.paths.cache
  #     warn "cache file"
  #     warn "#{cache_path}"
  #     warn "is out of date"
  #     urge "run the command"
  #     urge CND.white "node #{PATH.relative process.cwd(), __filename}"
  #     urge "to rebuild #{cache_path}"
  #     # throw new Error "cache #{S.paths.cache} out of date"
  #   else
  #     rewrite_cache S, handler
  # else
  #   handler ?= ( error ) -> throw error if error?
  #   read_cache S, handler
  # #.........................................................................................................
  # return null



# ############################################################################################################
# if module.parent?
#   ### If this module is `require`d from another module, run `populate_isl` *without* callback. This will
#   succeed if cache is present and up to date; it will fail with a helpful message otherwise. ###
#   populate_isl()
#   # populate_isl ( error, S ) ->
#   #   throw error if error?
#   #   return null
# else
#   ### If this module is run as a script, rebuild the cache when necessary: ###
#   populate_isl ( error, S ) ->
#     throw error if error?
#     help "#{S.paths.cache}"
#     help "is up to date"
#     return null





