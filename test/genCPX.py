def check(m):
	n = len(m)
	T = [0] * n
	for x in m : T[x]+=1
	for i in range(n):
		if T[i] == 0:
			for j in range(i+1, n):
				if T[j] != 0 :
					return False
			return True
	return True

def rec(n, m, x, f):
	if n == 0 :
		return [f(x)]
	else :
		return sum((rec(n-1, m, x+(y, ), f) for y in range(m)), [])

def cnk(n, k, f):
	red = lambda x : tuple(i for i, y in enumerate(x) if y == 1)
	return sum(rec(n, 2, tuple(), lambda x : [f(red(x))] if sum(x)==k else []), [])

def gen0(i, n, nmax, x, f):
	assert(n<=nmax)
	if i == 0 :
		return [f(n, x)]
	else :
		L = sum((gen0(i-1, n, nmax, x+(y, ), f) for y in range(n)), [])
		if n == nmax :
			return L
		else :
			return L + gen0(i-1, n+1, nmax, x+(n, ), f)

def fact(n):
	if n == 0 : return [tuple()]
	else:
		L = fact(n-1)
		return [(i,)+tuple(x if x < i else x+1 for x in t) for t in L for i in range(n)]

def arg(n, k, fun):
	F = fact(k)
	for f in F:
		assert(len(f) == k)
	print("len(F) = "+str(len(F)))
	C = cnk(n, k, lambda x : x)
	for c in C:
		assert(len(c) == k)
	print("len(C) = "+str(len(C)))
	return  [fun(tuple(c[i] for i in f)) for c in C for f in F ]

def gen1(n, X):
	F = fact(n)
	return [tuple(f[x] for x in X) for f in F]

print('GEN0')
gen0(3, 0, 5, tuple(), print)
print('CNK')
cnk(5, 3, print)
print('FACT')
for i in fact(3): print(i)
print('=)')
arg(5, 3, print)

def gen2(n, k, fun):
	def aux(m, X):
		return arg(n, m, lambda f : fun(tuple(f[x] for x in X)))
	return sum(gen0(n, 0, k, tuple(), aux), []) 

for i in range(8):
	print('i: '+str(i))
	print('X: '+str(i**i))
	print('Y: '+str(sum(rec(i, i, tuple(), check))))
	print('Z: '+str(len(sum(gen0(i, 0, i, tuple(), gen1), []))))

for i in range(8):
	print('i: '+str(i))
	def acheck(x):
		if check(x):
			return x
		else:
			print(x)
			assert(False)
	print('x: '+str(len(gen2(i, i+2, acheck))))

			
