+++
title = "mstmap_geneticmap"
showall = true
summary = """
  mstmap: genetic map made easy
  """
rss = summary
# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasplotly = false
hasmermaid = false
tags = ["bioinformatics","genetics"]
pubdate = Date("2016-12-21")
+++

{{page_tags}}

```bash
用法：

    MSTMap [infile] [outfile]

    infile格式:(首先是12个参数设置，然后是genotyping数据)
    population_type                     <para1> 
    population_name                     <para2> 
    distance_function                   <para3> 
    cut_off_p_value                     <para4> 
    no_map_dist                         <para5> 
    no_map_size                         <para6> 
    missing_threshold                   <para7> 
    estimation_before_clustering        <para8> 
    detect_bad_data                     <para9> 
    objective_function                  <para10> 
    number_of_loci                      <para11> 
    number_of_individual                <para12> 
    <para1> specifies the type of mapping population being used. Possible values are DH and RILd, 
            where d is any natural number. For example, RIL6 means a RIL population at generation 6. 
            You should use DH for any population that involves only two distinct genotype states 
            (even if it is not a DH population), which includes BC1, DH, Hap, and advanced RIL.
    
    <para2> gives a name for the mapping population. It can be any string of letters (a-z, A-Z) 
            or digits (0-9).
    
    <para3> specifies the distance function to be used. Possible choices are kosambi and haldane, 
            which refers to the commonly used Kosambi's and Haldane's distance functions respectively.
    
    <para4> specifies the threshold to be used for clustering the markers into LGs. A reasonable 
            choice of p_value is 0.000001. Alternatively, the user can turn off this feature by 
            setting <para4> to any number larger than 1. If the user does so, our software tool 
            assumes that all markers belong to one single linakge group.
    
    <para5> and <para6> together allow one to detect bad markers. In high density genetic linkage 
            mapping, bad markers appear to be isolated from others. MSTmap will detect isolated 
            marker groups and will place them in seperate LGs. An isolated marker group is a 
            small set of markers of size less than or equal to <para6> and is more than <para5> 
            away from the rest of the markers. A reasonable choice for <para6> is 1 or 2. To 
            disable this feature, simply set <para6> to 0.
    
    For example, if <para5>=15 and <para6>=2, then any group whose size is less than 2 and is 15 
    centimorgans away from the rest of the markers will be placed in a linkage group by themselves.
    
    Occasionally there are markers with excessive number of missing observations. Those markers 
    can be eliminated by settting <para7> to a proper value. For example, if <para7>=0.25, then 
    any marker with more than 25% missing observations will be removed completely without being 
    mapped.
    
    <para8> is a binary flag which can be set to yes or no. If <para8> is set to yes, then our 
    software tool will try to estimate missing data before clustering the markers into linkage 
    groups.
    
    <para9> is a binary flag which can be set to yes or no. If <para9> is set to yes, then our 
    software tool will try to detect bad data during the map construction process. Those suspicious 
    genotype data will be printed to the console for user inspection. The error detection feature 
    can be turned off by setting <para9> to no.
    
    <para10> specifies the objective function to be used. Possible choices are COUNT and ML. 
    COUNT refers to the commonly used sum of recombination events objective function and ML 
    refers to the commonly used maximum likelihood objective function.
    
    <para11> specifies the total number of markers in the data set.
    
    <para12> specifies the total number of mapping lines in the data set.
    
    The body of the input file contains a table of dimension (m+1)*(n+1), where m is the total 
    number of markers (which is equal to the <para11> value) and n is the total number of mapping 
    lines (which is equal to the <para12> value). The first row gives the ids for the mapping 
    lines, while the first column gives the ids for the genetic markers. Each id is a string of 
    letters (a-z, A-Z) or digits (0-9). No space is allowed within an id. Each cell in the table 
    refers to the genotype state of a particular mapping line on a particular marker locus. The 
    genotype states can be specified with letters 'A', 'a', 'B', 'b', '-', 'U' or 'X'. 'A' and 
    'a' are equivalent, 'B' and 'b' are equivalent and so are '-' and 'U'. 'U' and '-' indicates 
    the missing genotype call. If the data set is from a RIL population, you can use 'X' to 
    indicate that the corresponding genotype is a heterozygous 'AB'.

```

