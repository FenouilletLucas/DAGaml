import sys
name = sys.argv[1]
path = name.split('/')
folder = path[1]
name = path[2].replace('topure-', '').split('.')[0]
print('workdir/'+folder+'/'+name)

