local all_good, ts_utils = pcall(require, 'twoslash-queries')
if not all_good then
  return
end

require('twoslash-queries').setup()
