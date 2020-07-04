import os
from os.path import join
import argparse

opt = argparse.ArgumentParser()
opt.add_argument('--targetDir', help='Directory to parse.', type=str, default='.',)

args = opt.parse_args()

root = args.targetDir

fnames = []
for path, subdirs, files in os.walk(root):
	for name in files:
		if name[-3:] == '.dm':
			fnames.append(os.path.join(path, name))

for fname in fnames:
	with open(fname, 'ab+') as file:
		file.seek(0)
		lines = file.readlines()
		if not lines:
			continue
		last = lines[-1]
		if last[-1] != 10:
			print('%s have no trailing newline!' % fname)
			file.write(b'\n')
