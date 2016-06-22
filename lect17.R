shell("echo Hello World")
shell("dir")
shell("notepad.exe", wait=F)
shell("rgui.exe")
aa<-shell("dir", intern=T)
getwd()
aa

file.copy("C:/Users/Christine/Documents/Dropbox/FISH559/Lecture17/lect17", "C:/Users/Christine/Documents/Dropbox/FISH559/Lecture17/lect17a")
