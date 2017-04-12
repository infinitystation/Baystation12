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
opt.add_argument('path', help='The path to the custom item config to verify.')
args = opt.parse_args()

if(not path.isfile(args.path)):
    print('Not a file: ' + args.path)
    sys.exit(1)
	
errors = defaultdict(list)
mandatory_keys = ['ckey', 'character_name']

regex_lowercase_alphanumeric = re.compile('^[a-z0-9]*$')
regex_not_whitespace = re.compile('.*\S.*')

known_keys = {
	'ckey': [regex_lowercase_alphanumeric],
	'character_name': [regex_not_whitespace],	
	'item_path': [regex_not_whitespace],
	'item_name': [regex_not_whitespace],
	'item_icon': [regex_not_whitespace],
	'inherit_inhands': [regex_not_whitespace],
	'item_desc': [regex_not_whitespace],
	'req_access': [regex_not_whitespace],
	'req_titles': [regex_not_whitespace],
	'kit_name': [regex_not_whitespace],
	'kit_desc': [regex_not_whitespace],
	'kit_icon': [regex_not_whitespace],
	'additional_data': [regex_not_whitespace]
	}
	
def verify_item_line(line, line_number, found_keys, errors):
	if not ':' in line:
		errors[line_number].append("No : found")
		return

	split = line.split(':', 1)
	key = split[0].strip()
	value = split[1].strip()
	
	if not key in known_keys:
		errors[line_number].append("Unknown key: %s" % key)
	else:
		found_keys[key] = found_keys[key] + 1
		if found_keys[key] > 1:
			errors[line_number].append("Duplicate key: %s" % key)
			return
		for regex in known_keys[key]:
			if not regex.match(value):
				errors[line_number].append("Invalid format: '%s'" % value)
		
def verify_block(line_number, found_keys, errors):
	for mandatory_key in mandatory_keys:
		if not mandatory_key in found_keys:
			errors[line_number].append('Mandatory key missing: %s' % mandatory_key)

block_open = 0
line_number = 0
found_keys = defaultdict(int)

with open(args.path, 'r') as file:
	for line in file:
		line_number += 1
		line = line.strip()
		if (not line) or line.startswith('#'):
			continue
		if line == '{':
			if block_open:
				print('{ followed by {, expected }, at line %d' % line_number)
				sys.exit(1)
			block_open = 1
		elif line == '}':
			if not block_open:
				print('} without preceding { at line %d' % line_number)
				sys.exit(1)
			block_open = 0
			verify_block(line_number, found_keys, errors)
			found_keys.clear()
		else:
			verify_item_line(line, line_number, found_keys, errors)

for line_num, error_list in errors.iteritems():
	if len(error_list) == 1:
		print('%d: %s' % (line_num, error_list[0]))
	else:
		print(line_num)
		for error in error_list:
			print("\t%s" % error)

if block_open:
	print('Last block unclosed.')
	sys.exit(1)
if len(errors) > 0:
	sys.exit(1)
