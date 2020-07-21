from os import path as os_path, listdir as os_listdir
from shutil import rmtree as rmtree
for File in os_listdir("/usr/lib/enigma2/python/Plugins/Extensions"):
	file=File.lower()
	if file.find("panel") is not -1 or file.find("feed") is not -1 or file.find("unisia") is not -1 or file.find("ersia") is not -1 or file.find("olden") is not -1 or file.find("venus") is not -1:
		rmtree("/usr/lib/enigma2/python/Plugins/Extensions/%s" % File, ignore_errors=True)

for File in os_listdir("/usr/lib/enigma2/python/Plugins/SystemPlugins"):
	file=File.lower()
	if file.find("panel") is not -1 or file.find("feed") is not -1 or file.find("unisia") is not -1 or file.find("ersia") is not -1 or file.find("olden") is not -1 or file.find("venus") is not -1:
		rmtree("/usr/lib/enigma2/python/Plugins/SystemPlugins/%s" % File, ignore_errors=True)
if not os_path.exists("/var/lib/dpkg/info/enigma2-plugin-systemplugins-gutemine.md5sums"):
	if os_path.exists("/usr/lib/enigma2/python/Plugins/SystemPlugins/gutemine"):
		rmtree("/usr/lib/enigma2/python/Plugins/SystemPlugins/gutemine", ignore_errors=True)
if not os_path.exists("/var/lib/dpkg/info/enigma2-plugin-extensions-epgload.md5sums"):
	if os_path.exists("/usr/lib/enigma2/python/Plugins/Extensions/EPGLoad"):
		rmtree("/usr/lib/enigma2/python/Plugins/Extensions/EPGLoad", ignore_errors=True)