'''
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
'''
import argparse, re, sys
from collections import defaultdict
from os import path

opt = argparse.ArgumentParser()
opt.add_argument('path', help='The path to the custom sprite config to verify.')
args = opt.parse_args()

if(not path.isfile(args.path)):
    print('Not a file: ' + abspath(args.path))
    sys.exit(1)
	
def has_error(line, split_on):
	split = line.split(split_on, 1)
	key = split[0].strip()
	value = split[1].strip()
	
	if not key:
		return 1
	if not value:
		return 1
	return 0

error_found = 0
line_number = 0
with open(args.path, 'r') as file:
	for line in file:
		line_number += 1
		line = line.strip()
		colon_index = line.find(':')
		hyphen_index = line.find('-')
		if colon_index < 0 and hyphen_index < 0:
			print('%d: No - or : found' % line_number)
			error_found = 1			
		if has_error(line, ':' if (colon_index >= 0 and (colon_index < hyphen_index or hyphen_index < 0)) else '-'):
			print('%d: Invalid line' % line_number)
			error_found = 1

if error_found:
	sys.exit(1)

