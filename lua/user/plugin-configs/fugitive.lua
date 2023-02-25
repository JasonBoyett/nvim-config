local all_good, fugitive = pcall(require, 'fugitive')
  if not all_good then
    return
end

require('fugitive').setup()