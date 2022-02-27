local function init()
  require 'Jordi.vim'.init()
  require 'Jordi.packer'.init()
end

return {
  init = init,
}
