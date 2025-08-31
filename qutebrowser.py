config.load_autoconfig(False)

config.bind("<Ctrl-n>", "fake-key -g <Down>", mode="command")
config.bind("<Ctrl-p>", "fake-key -g <Up>", mode="command")

config.bind("tpo", "config-cycle tabs.position top left")

config.bind("yf", "fake-key -g ;y")

config.bind("<Ctrl-=>", "zoom-in")
config.bind("<Ctrl-->", "zoom-out")
config.bind("<Ctrl-0>", "zoom 100")

c.aliases = {
	"q": "close",
	"qa": "quit",
	"w": "session-save",
	"wq": "quit --save",
	"wqa": "quit --save",
    "o": "open"
}

c.auto_save.session = True

c.tabs.position = "top"
c.tabs.width = 300

c.input.insert_mode.auto_enter = True

c.url.searchengines = { 
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "gh": "https://github.com/{}",
    "yt": "https://youtube.com/results?search_query={}",
}

config.source("gruvbox.py")
