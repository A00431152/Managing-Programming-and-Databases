# reads the name, say F, of a text file, and creates a text file 
# F.json containing one JSON object with three fields:
# {"file_name": "F", "title": "1st line of F", "content": "rest of F lines"}
# any double quote, \n, \r in F is replaced with a space " "
#

import sys

fname = raw_input()
try:
    inf = open(fname,"r")
except IOError:
    print "\nError opening file!"
    sys.exit()

sys.stdout.write('{"file_name": "'+fname+'", "title": "')
first = True
for line in inf.readlines():
    oline = ''
    for ch in line:
        if ch not in '\n\r"': oline += ch
        else: oline += " "
    if first:
        sys.stdout.write(oline +'", "content": "')
        first = False
    else:
        sys.stdout.write(oline)
sys.stdout.write('"}')

inf.close()
