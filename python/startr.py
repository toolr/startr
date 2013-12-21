#!/bin/python

import sys, subprocess, os, re, codecs, shutil

def replace(text, args):
	result = text
	index = 0
	for a in args:
		index = index + 1
		pattern = "\$\{" + str(index) + "\}"
		while(re.search(pattern, result)):
			result = re.sub(pattern, a, result)

	return result


def build_startr_file(path, args):

	try:
		data = ""
		with codecs.open(path, 'r', 'utf8') as f:
			data = f.read()
			data = data.encode('utf-8')
			data = replace(data, args)

		fw = open(path, "w")
		fw.write(data)
		fw.flush()
		fw.close()

	except IOError:
		print 'Could not open: ' + path
	
	#with codecs.open(path, 'r', 'utf8') as f:
	# if target_path == "":
	# 	target_path = path
	# else:
	# 	target_path = path[1:]
	


	# data = f.read()
	# print(data)

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





# 

# def stream_watcher(identifier, stream):

#     for line in stream:
#         io_q.put((identifier, line))

#     if not stream.closed:
#         stream.close()

# proc = Popen('svn co svn+ssh://myrepo', stdout=PIPE, stderr=PIPE)

# Thread(target=stream_watcher, name='stdout-watcher',
#         args=('STDOUT', proc.stdout)).start()
# Thread(target=stream_watcher, name='stderr-watcher',
#         args=('STDERR', proc.stderr)).start()

# def printer():
#     while True:
#         try:
#             # Block for 1 second.
#             item = io_q.get(True, 1)
#         except Empty:
#             # No output in either streams for a second. Are we done?
#             if proc.poll() is not None:
#                 break
#         else:
#             identifier, line = item
#             print identifier + ':', line

# Thread(target=printer, name='printer').start()