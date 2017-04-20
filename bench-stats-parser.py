import sys
def onefile(NAME):
	FILE = open(NAME, 'r')
	TEXT = FILE.read().split('\n')
	FILE.close()
	L = [4, 7, 10, 13, 16]
	def select(l):
		U = [x for x in TEXT[l-1].split(' ') if x!='']
		U = [x for x in U[-1].split('\t') if x!='']
		return U[-1].replace(',', '.')
        try:
            print(",\t".join([TEXT[0]]+list(map(select, L))))
        except:
            print(TEXT[0])

for name in sys.argv[1:]:
	onefile(name)
