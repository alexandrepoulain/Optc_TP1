import csv
import random

def write_dat(N, M, csv_file):
	# create the good name for the dat file
	if csv_file == "petite_sim.csv":
		dat_file = "p-sim.dat"
	elif csv_file == "moy_sim.csv":
		dat_file = "m-sim.dat"
	elif csv_file == "grande_sim.csv":
		dat_file = "g-sim.dat"

	# initialize matrix
	# M+1 column because the first column contains only 1
	X = [[0 for x in range(M+1)] for y in range(N)] 
	# fill first column with 1
	for i in range(0,N):
		X[i][0] = 1
	#initialize vectors
	B = [0 for j in range(M+1)]

	for j in range(0,M+1):
		B[j] = 2

	Y = [0 for i in range(N)]
	E = [0 for i in range(N)]
	
	with open(csv_file, newline='') as csvfile:
		# first line has the variables names
		spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
		# get back matrix X and vectors B and E 
		i = 0
		for row in spamreader:
			# we go over the first row
			if(i!=0):
				# for the other we take the M first variables and put them in X 
				for j in range(0,M):
					
					X[i-1][j+1] = row[j+1]
					
				E[i-1] = row[M+1]
			i+=1


		with open(dat_file, 'w') as datafile:
			datafile.write('data;\n')
			datafile.write('param N := ' + str(N) + ';\n\n')
			datafile.write('param M := ' + str(M) + ';\n\n')
			# write matrix X
			datafile.write('param X : ')
			for i in range(1,M+2):
				datafile.write( str(i) + ' ')
			datafile.write(' := \n')
			for i in range(1,N+1):
				datafile.write('        ' + str(i) )
				for j in range(0,M+1):
					datafile.write( ' ' + str(X[i-1][j]) + ' ' )
				if (i == N):
					datafile.write(';\n')
				datafile.write('\n')
			# write vector Y
			datafile.write('param Beta :=')
			for j in range(0,M+1):
				if (j == M):
					datafile.write(' ' + str(j+1) + ' ' + str(B[j]) + ' ')
				else:	
					datafile.write(' ' + str(j+1) + ' ' + str(B[j]) + ', ')
			datafile.write(';\n')
			datafile.write('param eps:=')
			for i in range(0,N):
				if (j == N-1):
					datafile.write(' ' + str(i+1) + ' ' + str(E[i]) + ' ')
				else:	
					datafile.write(' ' + str(i+1) + ' ' + str(E[i]) + ', ')
			datafile.write(';\nend;\n\n\n')

# small simulation
N = 1000
M = 10
write_dat(N, M, 'petite_sim.csv')
# medium simulation
N = 100000
M = 100
write_dat(N, M, 'moy_sim.csv')



