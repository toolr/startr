#!/bin/python

import sys, subprocess, os, re, codecs, shutil, mimetypes

def replace(text, args):
	result = text
	index = 0
	for a in args:
		index = index + 1
		pattern = "\$\{" + str(index) + "\}"
		while(re.search(pattern, result)):
			result = re.sub(pattern, a, result)

	return result


def handle_codec(path, args):
	data = ""
	with codecs.open(path, 'r', 'utf8') as f:
		data = f.read()
		data = data.encode('utf-8')
		data = replace(data, args)
	return data

def build_startr_file(path, args):

	try:
		data = ""

		mime = mimetypes.guess_type(path)
		mime = mime[0]

		if mime is not None:
			if re.search('image',mime) is None:
				data = handle_codec(path, args)
			else:
				with open(path, "r") as f:
					data = f.read()
		else:
			data = handle_codec(path, args)

		fw = open(path, "w")
		fw.write(data)
		fw.flush()
		fw.close()

	except IOError:
		print 'Could not open: ' + path

def build_startr(dir, args):
	for root, subFolders, files in os.walk(dir):
		for f in files:
			source_path = root + "/" + f
			target_path = replace(root,args) + "/" + replace(f, args)
			os.rename(source_path, target_path)
			build_startr_file(target_path, args)

def get_repo(url, args):
	proc = subprocess.Popen(['git', 'clone', url, '.'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
	out, _ = proc.communicate()
	if proc.returncode == 0:
		shutil.rmtree('.git')
		build_startr('.', args)

args = sys.argv[1:]

if args >= 2:
	if args[0] == "get":
		url = args[1]
		print("fetching " + url + "...")
		get_repo(url, args[2:])
		print("done.")