# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

atom.commands.add 'atom-workspace',
  'custom:close-panes': ->
    panes = atom.workspace.getPaneItems()
    # editors = atom.workspace.getTextEditors()
    activeEditor = atom.workspace.getActiveTextEditor()
    for editor in panes
      if editor.destroy
        editor.destroy() if activeEditor isnt editor
  # 'custom:select-undo': ->
  #   
  #   activeEditor = atom.workspace.getActiveTextEditor()
  #   

# atom.commands.add 'atom-workspace', 'custom:vim-mode-plus-visual-to-cursors': ->
#   editor = atom.workspace.getActiveTextEditor()
#   view = atom.views.getView(editor)
#   console.log 'd0fbcdd3-6f63-4043-8b7c-828045ee0ab1'
#   console.log atom.commands.dispatch(view, 'vim-mode-plus:blockwise-insert-at-beginning-of-line')
#   console.log atom.commands.dispatch(view, 'vim-mode-plus:reset-normal-mode')
