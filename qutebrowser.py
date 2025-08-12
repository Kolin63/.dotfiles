config.load_autoconfig(False)

config.bind("<Ctrl-n>", "fake-key -g <Down>", mode="command")
config.bind("<Ctrl-p>", "fake-key -g <Up>", mode="command")

c.auto_save.session = True

c.tabs.position = "left"
c.tabs.width = 300

c.input.insert_mode.auto_enter = True

config.source("gruvbox.py")
