+++
title = "snp_slidewin_to_bin"
showall = true
summary = """
  Sliding windows method for binning in genetic map construction
  """
rss = summary
# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasplotly = false
hasmermaid = false

pubdate = Date("2018-07-02")
tags = ["bioinformatics", "genetics"]

+++
{{page_tags}}



## 1. 基于黄学辉GR文章原理的实现：
- snp --> crosspoints
 
   - 只能用15 win + 0.8 ratio:
        [`slide_by_snp4RIL_V3.pl`](https://leanote.com/api/file/getAttach?fileId=5ae91841ab6441232a0004db)
    - 我修改版，可修改win大小，ratio大小，未测试：
        [`gst_slide_by_snp4RIL_V3.pl`](https://leanote.com/api/file/getAttach?fileId=5ae91841ab6441232a0004df)

- 根据长度过滤重组片段（自己DIY，未测试）
  [`filter_breakpoint.pl`](https://leanote.com/api/file/getAttach?fileId=5ae91841ab6441232a0004dc)

- 根据crosspoint划分bin（可设置最小bin长度）
   [`get_bin_num.pl`](https://leanote.com/api/file/getAttach?fileId=5ae91841ab6441232a0004dd)

- 生成bin的genotype
    [`get_geno_by_bin.pl`](https://leanote.com/api/file/getAttach?fileId=5ae91841ab6441232a0004de)

## 2. 一篇文章里的python脚本（未测试）

>[An ultra-high-density bin map facilitates high-throughput QTL mapping of horticultural traits in pepper (Capsicum annuum)](https://academic.oup.com/dnaresearch/article/23/2/81/1745287)


```
# Make three directories: ‘in_csv’, ‘out_csv’, and ‘bin_maps’
# Copy the python code and save the as ‘1.slid_wind.py’, ‘2.binmap.py’, and ‘3.binpic.py’

# 1. make genotyped ".csv" files of each chromosome
# 	(there is example file in in_csv folder)

# 2. change in '1.slid_wind.py'
#    - in/out directory: line 12 and line 13
#    - individual number: line 18
#    - breakpoint threshold: line 19
#    - chromosome length: line 20
#    - test different window length in line 109. 0.5e6 - 6e6 is recommended

# 3. run '1.slid_wind.py' for every chromosome
#    - output file will be made in 'out_csv' folder

# 4. change in '2.binmap.py'
#    - in/out directory: line 17 and 18

# 5. run '2.binmap.py' for every chromosome
#    - output file will be made in 'bin_maps' folder

# 6. change in '3.binpic.py'
#    - in/out directory: line 58 and 59

# 7. run '3.binpic.py'
#    - output file will be made in 'bin_maps' folder
 
<1.slid_wind.py>

#!/usr/bin/env python
# this code ignore heterozygous genotype

'''Instead of using SNPs as the basis for window length, this algorithm uses
cM or bp units to count how many SNPs should go in a window. '''

# Modules
from __future__ import division
import sys

# Paths
in_file = 'in_csv/example.csv'
out_file = 'out_csv/example_breakpoint.csv'

# Often-modified global variables len_unit_Mb = True         # specifies if the length unit is cM or Mb
genotype_case_upper = True # specifies if genotype cases are upper or lower
indi_number = 120          # number of individuals in csv file
break_consts = (0.3, 0.7)  # breakpoint ratios
chrom_len = 9050551        # position of last chromosome in csv file
het_toler = 2              # constant multiplied to find transitional hets

# Authorship information
__author__ = 'Sungmin Kang'
__date__ = '2015-05-16'
__version__ = '1.1'
__maintainer__ = 'Koeun Han'
__email__ = 'stuatlittle@kaist.ac.kr'

# Basic functions
def csvRead(filename, col_num):
    '''Reads a certain column of a csv file, given column number and 
    filename. The function currently ignores hetero and -s.'''
    f = open(filename, "r")
    snp_list = []
    
    for line in f:
        if 'marker' in line: continue #ignores first line
        line = line.strip()
        comps = line.split(',')
        #filter to ignore heteros or -s
        if comps[col_num].lower() in 'h-': continue
        snp_list.append((float(comps[1]), comps[col_num]))
    return snp_list

def MakeCsv(filename, ref, cross_list, chrom_len):
    '''adds lines to the filename in csv format. The function was copied
    and pasted directly from the previous movingwindow code.'''
    f = open(filename, "a")
    
    for i in xrange(len(cross_list)):
        cross_list[i] = str(cross_list[i])
    cross_list.append(str(chrom_len))
    f.write(ref + ',0,' + ",".join(cross_list) + ',\n')
    f.close()

# Definition of MovingWindow object
class MovingWindow():
    '''Moving window object. This object is needed because the length of the
    window constantly changes, and therefore custom methods of the window 
    have nice effect.'''
    def __init__(self, break_ref, genotype_names, window_len):
        '''The function that makes a movingwindow object.
        break_ref : genotype ratios from which to disern crosspoints
        genotype_names : the genotype names, such as 'a', 'h', 'b'
        window_len : the amount of the chromosome we want to include in our
        window. the length should be in bp or cM units, not SNP number units.'''
        self._snp_list = []
        self._break_ref = break_ref
        self._genotype_names = genotype_names
        self._point_dic = dict(zip(genotype_names, (0.0, 0.5, 1.0)))
        self._window_len = window_len
    
    def __len__(self):
        '''returns the number of SNPs that are currently in the window.'''
        return len(self._snp_list)
    
    def insert(self, element):
        '''inserts a new SNP in the window. 
        Upon inserting the new SNP to thewindow, the function will delete any 
        SNPs that are more than self._window_len away from the SNP inserted 
        just now. 
        element : a tuple in the format of (position, genotype)'''
        self._snp_list.append(element)
        while self._snp_list[0][0] + self._window_len < self._snp_list[-1][0]:
            self._snp_list.pop(0)
	        
    def genotype(self):
        '''calculates the current genotype of the window.
        The calculation is based on the breakpoint reference given when
        the MovingWindow is first made.'''
        _current_score = sum(self._point_dic[snp[1]] for snp in self._snp_list)
        _res = None
        if _current_score/len(self) > self._break_ref[1]:
            _res = self._genotype_names[2]
        elif _current_score < self._break_ref[0]:
            _res = self._genotype_names[0]
        else:
            _res = self._genotype_names[1]
        return _res
    
    def dump(self):
        '''dumps any previous SNP data for efficient use of the moving window.'''
        self._snp_list = []

# Matching setting variables on top
if len_unit_Mb:
    ''' window length can be changed here'''
    win_len = 5e6
else:
    win_len = 1 # Change this to window length when length unit is cM

if genotype_case_upper:
    gen_names = ('A', 'H', 'B')
else:
    gen_names = ('a', 'h', 'b')

# Generates MovingWindow object for use
window = MovingWindow(break_consts, gen_names, win_len)

# Refreshes out_file to empty
f = open(out_file, 'w')
f.close()

# Where the actual work happens
for column in xrange(2, indi_number+2):
    # First, read the data from the column.
    snp_list = csvRead(in_file, column)

    # Make a list to store the positions and genotypes.
    genoty = []

    snp = [snp_list[0]]
    for k in range(1,len(snp_list)):
	    if snp_list[k][0] >= snp[-1][0] + 500000: # step size can be changed here
		   snp.append(snp_list[k])
 		   window.insert(snp_list[k])
        	   genoty.append((snp_list[k][0], window.genotype()))
	    else:
		    continue


    # Calculate the breakpoints.
    prev_type = genoty[0][1]
    cross_points = [genoty[0][1]]
    for genotype_bit in genoty[1:]:
        if prev_type != genotype_bit[1]:
            cross_points.append(genotype_bit[0]) # Append crosspoint position
            cross_points.append(genotype_bit[1]) # Append genotype
            prev_type = genotype_bit[1]

    # Exclude transition point heteros.
    gen_name_list = list(gen_names)
    # gen_name_ref contains gen_names and its reverse for comparison
    gen_name_ref = (gen_name_list, gen_name_list[::-1])


    i = 0
    while i < len(cross_points)-4:
        if cross_points[i:i+5:2] in gen_name_ref: # If genotype ahb/bha...
            if cross_points[i+3]-cross_points[i+1] < het_toler*win_len:
                del cross_points[i+2:i+4] # Delete hetero data
                print 'del'
        i += 2

    k = 0
    same_gen_list = ( ['A','H','A'],['B','H','B'])
    while k < len(cross_points)-3:
        if cross_points[k:k+5:2] in same_gen_list: # If genotype aha/bhb...
            if cross_points[k+3]-cross_points[k+1] < het_toler*win_len:
                del cross_points[k+1:k+5] # Delete hetero and following same genotype data
                print 'del'
        k += 2

    # Export to out_file.
    MakeCsv(out_file, str(column-1), cross_points, chrom_len)
    
    # Dump the SNP data just used.
    window.dump()
 
<2.binmap.py>

#!/usr/bin/python
#makes bin maps

import sys

def csvRead(filename):
	'''reads csv files in a format that would be useful'''
	f = open(filename, 'r')
	dat_list = []
	for line in f:
		line = line.strip()
		temp = line.split(',')
		#reads only the crosspoints
		dat_list.append(temp[:-1])
	return dat_list

in_dir = 'out_csv/example_breakpoint.csv'
out_dir = 'bin_maps/example_binmap.csv'

dat_list = csvRead(in_dir)
chrom_len = float(dat_list[-1][-1])
f_out = open(out_dir, 'w')

#interval 1 for cM and 100000 for bp
interval = 100000

#acc_thresh is individuals that should have crossover at that point
acc_thresh = 1

#cross_list is array that saves crosspoints
comb_cross_list = []

for i in xrange(0, int(chrom_len)-1, interval):
	#searches for each point of chromosome
    range_temp = 0
    for individual in dat_list:
        for crosspoint in individual[1::2]:
			#for all crosspoints in all individuals, 
            if i<= float(crosspoint) < i+interval:
				#if crosspoint is in appropriate range, add to temp variable
                range_temp += 1

    if range_temp >= acc_thresh:
		#if same or more than acc_thresh discovered, added to cross_list
        comb_cross_list.append(i+(interval/2))

#header information: on top is bin numbers compared with chromosome length;
f_out.write('##bin number %d / %d\n' % (len(comb_cross_list), int(chrom_len)))

#header information: 2nd row has crosspoint positions for each bin
f_out.write(','.join([str(crosspoint) for crosspoint in comb_cross_list])+','+str(int(chrom_len))+'\n')

#finally writes meaningful data on folder.
#the 1st thing in a line is the individual number

for individual in dat_list:
	f_out.write(individual[0]+',')
	for ref in comb_cross_list:
		for cross_index in xrange(1, len(individual), 2):
			if int(float(individual[cross_index])) > ref:
				f_out.write(individual[cross_index-1]+',')
				break
	f_out.write('\n')
f_out.close()
 
<3.binpic.py>

#!/usr/bin/python
#makes image files from csv file
#you need 'Python Imaging Library (PIL)'

from PIL import Image
import sys

# if cM unit, set as True
cM = False
# if small case in csv file, set as true
small_case = False

if small_case:
    colour = {'a':(255, 0, 0), 'h':(255, 192, 0), 'b':(20, 42, 178)}

else:
    colour = {'A':(255, 0, 0), 'H':(255, 192, 0), 'B':(20, 42, 178)}

def csvRead(filename):
    f = open(filename, 'r')
    dat_list = []
    for line in f:
        line = line.strip()
        temp = line.split(',')
        dat_list.append(temp[1:])
    return dat_list

if cM == True:
    compress = 1
else:
    compress = 500000

def drawpic(picname, dat_list):
    chrom_len = int(float(dat_list[-1][-2]))
    x_expand = 1
    y_expand = 10
    print chrom_len/compress
    binmap = Image.new('RGB', (chrom_len/compress, len(dat_list)))
    print 'image size :', binmap.size 
    for y in xrange(len(dat_list)):
        for x in xrange(chrom_len/compress):
            in_low = 0
            in_high = 0
            
            for i in xrange(len(dat_list[y])):
                if i%2 == 0 and x < float(dat_list[y][i])/compress:
                    in_high = (i if x != 0 else 2)
                    break
            for i in xrange(len(dat_list[y])-1, 0, -1):
                if i%2 == 0 and x >= float(dat_list[y][i])/compress:
                    in_low = i
                    break
            binmap.putpixel((x, y), colour[dat_list[y][in_low+1]])
            
    binmap.resize((x_expand*chrom_len/compress, y_expand*len(dat_list)))
    binmap.save(picname)

dat_list = csvRead('out_csv/example_breakpoint.csv')
drawpic('bin_maps/example_binmap.png', dat_list)

```

### 3 Github 上一个基于HMM的python包（似乎靠谱）

[snpbinner](https://github.com/solgenomics/SNPbinner)

