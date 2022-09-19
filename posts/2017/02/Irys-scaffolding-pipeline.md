+++
title = "Irys-scaffolding-pipeline"
showall = true
summary = """
  Brief Introduction to the Irys scaffolding pipeline,
  for bionano optical map assembly.
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false

pubdate = Date("2017-02-10")
tags = ["bioinformatics", "bionano"]
+++
{{page_tags}}



## GitHub 上的 Bionano组装流程

[GitHub](https://github.com/i5K-KINBRE-script-share/Irys-scaffolding/blob/master/KSU_bioinfo_lab/assemble_XeonPhi/assemble_XeonPhi_LAB.md)

## 1. 程序的安装和配置

###  1.1 Install BioNano tools and scripts:

参考Bionano IrysView® v2.3官方安装说明：[HERE](http://www.bnxinstall.com/training/docs/IrysView_Software_Installation_Guide_23.pdf)

另， Bionano IrysView® v2.3 Software Training Guide 在： [HERE](http://www.bnxinstall.com/training/docs/IrysView_Software_Training_Guide_23.pdf)

```shell
wget http://www.bnxinstall.com/RefalignerAssembler/Linux/AVX/tools_v4287_AVX.tar.gz
wget http://www.bnxinstall.com/scripts/v4125/scripts_v4125.tar.gz
#然后都解压到 $SFTW/app/BioNano 目录下，都设定成可执行
```

###  1.2 Git install the KSU custom software using the code below:
```shell
cd ~
git clone https://github.com/i5K-KINBRE-script-share/Irys-scaffolding.git
git clone https://github.com/i5K-KINBRE-script-share/BNGCompare.git

#将以下目录中的*.pl添加执行权限后，添加到PATH：
"XXXXXX/Irys-scaffolding/KSU_bioinfo_lab/map_tools/"
"XXXXXX/Irys-scaffolding/KSU_bioinfo_lab/assemble_XeonPhi/"
"XXXXXX/Irys-scaffolding/KSU_bioinfo_lab/assemble_XeonPhi/third-party/"
```

为了方便使用，添加环境变量到`.bashrc`：
>export KSU=/XXX/XXX/Irys-scaffolding/KSU_bioinfo_lab

### 1.3 Personal Edit

__注意！！！__

>该pipeline是编写用于XeonPhi服务器和CL集群的，会用到SGE等集群运算的东西，默认参数在普通服务器上跑，
会占用全部cpu并且报错。
而且pipeline识别的默认Bionano程序是安装在~目录下，如果你的程序不在~目录, 也需要改。

#### 1.3.1 change for nomal linux

#####` rescale_stretch.pl`

修改`$KSU/assemble_XeonPhi/rescale_stretch.pl` 文件，主要修改:

1. tools和scripts目录的路径: 
2. piplineCL.py 的运行参数：
    - Threads 改小
    - -C 参数去掉

修改的`rescale_stretch.pl`:
```
#!/usr/bin/perl
################################################################################
#   
#	USAGE: perl rescale_stretch.pl <bnx_dir> <p_value Threshold> <project> <reference>
#
#  Created by jennifer shelton
#  perl rescale_stretch.pl $bnx_dir $reference $T $dirname
#
################################################################################
use strict;
use warnings;
use File::Basename; # enable maipulating of the full path
# use List::Util qw(max);
# use List::Util qw(sum);
################################################################################
##############           Customize RefAligner Settings        ##################
################################################################################
# This pipeline was designed to run on a Xeon Phi server with 576 cores (48x12-core Intel Xeon CPUs), 256GB of RAM, and Linux CentOS 7 operating system. Customization of this section may be required to run the BioNano Assembler on a different machine. Customization of Irys-scaffolding/KSU_bioinfo_lab/assemble_XeonPhi/clusterArguments.xml may also be required for assembly to run successfully on a different cluster.
my $refaligner = $ENV{"HOME"} ."/GuiSongtao/software/BioNano/tools/RefAligner"; # See "~/tools/RefAligner -help" for details about these parameters
unless (-f $refaligner)
{
    die "Can't find RefAligner at $refaligner. Please add correct path to rescale_stretch.pl and retry:\n $!";
}
my $maxmem = 40; #gst edited, raw is 240
my $hashmaxmem = 70; # gst edited, raw is 120
my $insertThreads = 10; # gst edited, raw is 16
my $maxthreads = 15; # gst edited, raw is 64
################################################################################
##############                 get arguments                  ##################
################################################################################
my $assembly_directory=$ARGV[0];
my $T=$ARGV[1];
my $project = $ARGV[2];
my $de_novo=1; # project is de novo
if ($ARGV[3])
{
    if (-f "$ARGV[3]")
    {
        $de_novo=0; # change project is not de novo because a refernce CMAP exists
        print "de_novo = false\n";
    }
}
else
{
    print "de_novo = true\n";
}
my $reference;
if($de_novo == 0)
{
    $reference = $ARGV[3];
    print "ref = $ARGV[3]\n";
}
my $dirname = dirname(__FILE__);
################################################################################
############         Adjust stretch (bpp) for BNX files       ##################
################################################################################
my $bnx_list_file = "${assembly_directory}/bnx_list.text"; #creat list to use in merging BNX files
open (my $bnx_list, ">", $bnx_list_file) or die "Can't open $bnx_list_file: $!";
my $bnx_dir = "$assembly_directory/bnx";
opendir(DIR, $bnx_dir) or die "Can't open $bnx_dir!\n"; # open directory full of .bnx files
while (my $file = readdir(DIR))
{
    next if ($file =~ m/^\./); # ignore files beginning with a period
    next if ($file !~ m/Molecules.*\.bnx$/); # if the filename is Molecules.bnx
    ############################################################################
    ############              Check BNX file version          ##################
    ############################################################################
    my $bnx_stats=`perl ${dirname}/../map_tools/bnx_version.pl -i ${bnx_dir}/${file}`;
    print "$bnx_stats";
    $bnx_stats =~ /version: (.*)\n/;
    if ($1 < 1)
    {
        die "Exiting because this workflow was developed for BNX version 1.0+";
    }
    print $bnx_list "${bnx_dir}/${file}\n";
}
################################################################################
############                Merge your BNX files               #################
################################################################################
my $refalign_log_file = "${assembly_directory}/refAlign_log.txt"; #creat log for refAligner output
open (my $refalign_log, ">", $refalign_log_file) or die "Can't open $refalign_log_file: $!";

mkdir "${assembly_directory}/all_flowcells"; # Make an outout directory for merged flowcells

my $merge_bnxs = `$refaligner -if $bnx_list_file -o ${assembly_directory}/all_flowcells/bnx_merged -merge -bnx -minsites 5 -minlen 100 -maxthreads $maxthreads`;
print $refalign_log "$merge_bnxs";
my $merged_file = "${bnx_dir}/../all_flowcells/bnx_merged.bnx";
if($de_novo == 0)
{
    ############################################################################
    ####         Subsample 50,000 molecules and run alignment with          ####
    ####         very loose alignment parameters (T should be about         ####
    ####                   inverse of the genome size).                     ####
    ############################################################################
    ## Subsample 50,000 molecules and run alignment with very loose alignment parameters.
    my $error_A = "${bnx_dir}/../all_flowcells/bnx_merged_errA";
    my $get_error_A = `$refaligner -o $error_A -i $merged_file -ref $reference -minlen 180 -minsites 9 -refine 0 -id 1 -mres 0.9 -res 3.4 -resSD 0.75 -FP 1.0 -FN 0.1 -sf 0.2 -sd 0 -sr 0.02 -resbias 4.0 64 -outlier 1e-4 -endoutlier 1e-4 -S -999 -T 1e-4 -MapRate 0.7 -A 5 -nosplit 2 -biaswt 0 -deltaX 4 -deltaY 6 -extend 1 -PVres 2 -f -randomize -subset 1 50000 -BestRef 1 -BestRefPV 1 -hashoffset 1 -AlignRes 1.5 -resEstimate -M 5 -hashgen 5 3 2.4 1.5 0.05 5.0 1 1 2 -hash -hashdelta 10 -maxmem $maxmem -hashmaxmem $hashmaxmem -insertThreads $insertThreads -maxthreads $maxthreads`; ## TEST when you get a reference !!!!!!!!
    print $refalign_log "#####\n#####\nStep 1: Subsample 50,000 molecules and run alignment with very loose alignment parameters\n#####\n#####\n";
    print $refalign_log "$get_error_A";

    ## The error metrics returned are refined in the following step using 100000 molecules and more stringent alignments.
    my $error_B = "${assembly_directory}/all_flowcells/bnx_merged_errB";

    my $get_error_B = `$refaligner -o $error_B -i $merged_file -ref $reference -readparameters ${error_A}_id1.errbin -minlen 180 -minsites 9 -refine 0 -id 1 -resbias 4.0 64 -outlier 1e-4 -endoutlier 1e-4 -S -999 -T 1e-4 -MapRate 0.7 -A 5 -nosplit 2 -biaswt 0 -deltaX 4 -deltaY 6 -extend 1 -PVres 2 -f -randomize -subset 1 100000 -BestRef 1 -BestRefPV 1 -hashoffset 1  -AlignRes 1.5 -resEstimate -M 5 -hashgen 5 3 2.4 1.5 0.05 5.0 1 1 2 -hash -hashdelta 10 -maxmem $maxmem -hashmaxmem $hashmaxmem -insertThreads $insertThreads  -maxthreads $maxthreads`;
    print $refalign_log "#####\n#####\nStep 2: The error metrics returned are refined in the following step using 100000 molecules and more stringent alignments.\n#####\n#####\n";

    print $refalign_log "$get_error_B";

    ## Finally the original BNX set is rescaled per the noise parameters from the second step. In this step, after noise parameters have be estimated using long molecules the minimum molecule length is set back to 100 kb.

    my $merged_file_adjusted = "${assembly_directory}/all_flowcells/bnx_merged_adj";

    #my $get_adjusted_bnx = `~/tools/RefAligner -o $merged_file_adjusted -i $merged_file -ref $reference -readparameters ${error_B}_id1.errbin -minlen 100 -minsites 9 -refine 0 -id 1 -resbias 4.0 64 -outlier 1e-4 -endoutlier 1e-4 -S -9 -T 1e-4 -MapRate 0.7 -A 5 -nosplit 2 -biaswt 0 -deltaX 4 -deltaY 6 -extend 1 -PVres 2 -f -BestRef 1 -BestRefPV 1 -maptype 1 -hashoffset 1 -AligneRes 1.5  -resEstimate -ScanScaling 2 -M 5 -hashgen 5 3 2.4 1.5 0.05 5.0 1 1 2 -hash -hashdelta 10 -maxmem 240 -hashmaxmem 120 -insertThreads 16  -maxthreads 64`; ## threw error unknown option:-AligneRes(argc=28)

    my $get_adjusted_bnx = `$refaligner -o $merged_file_adjusted -i $merged_file -ref $reference -readparameters ${error_B}_id1.errbin -minlen 100 -minsites 9 -refine 0 -id 1 -resbias 4.0 64 -outlier 1e-4 -endoutlier 1e-4 -S -9 -T 1e-4 -MapRate 0.7 -A 5 -nosplit 2 -biaswt 0 -deltaX 4 -deltaY 6 -extend 1 -PVres 2 -f -BestRef 1 -BestRefPV 1 -maptype 1 -hashoffset 1 -resEstimate -ScanScaling 2 -M 5 -hashgen 5 3 2.4 1.5 0.05 5.0 1 1 2 -hash -hashdelta 10 -maxmem $maxmem -hashmaxmem $hashmaxmem -insertThreads $insertThreads  -maxthreads $maxthreads`;
    print $refalign_log "#####\n#####\nStep 3: Finally the original BNX set is rescaled per the noise parameters from the second step. In this step, after noise parameters have be estimated using long molecules the minimum molecule length is set back to 100 kb\n#####\n#####\n";
    print $refalign_log "$get_adjusted_bnx";

    ## Run final alignment for noise parameters .
    my $rescaled_file = "${bnx_dir}/../all_flowcells/bnx_merged_adj_rescaled.bnx";
    my $error_C = "${bnx_dir}/../all_flowcells/bnx_merged_rescaled_final";
    my $get_error_C = `$refaligner -o $error_C -i $rescaled_file -ref $reference -nosplit 2 -M 5 -biaswt 0 -Mfast 0 -FP 1.5 -FN 0.15 -sf 0.2 -sd 0.2 -A 5 -res 3.5 -resSD 0.7 -outlier 1e-4 -endoutlier 1e-4 -minlen 100 -minsites 5 -T $T -insertThreads $insertThreads -maxthreads $maxthreads -randomize 1 -subset 1 10000`;
    print $refalign_log "#####\n#####\nStep 4: Subsample 10,000 molecules and run final alignment for noise parameters\n#####\n#####\n";
    print $refalign_log "$get_error_C";

    close($refalign_log);

    ############################################################################
    ####                      Plot rescaling factors by scan                ####
    ############################################################################
    #  scan=0:RunIndex=1,ScanNumber=0:scale=0.99938102
    open ($refalign_log, "<", $refalign_log_file) or die "Can't open $refalign_log_file: $!";

    my $rescaling_factor_list_out_file = "${assembly_directory}/${project}/bnx_rescaling_factors.tab";
    open (my $rescaling_factor_list_out, ">", $rescaling_factor_list_out_file) or die "Can't open $rescaling_factor_list_out_file in rescale_stretch.pl\n";
    print $rescaling_factor_list_out "flow_cell\tscan\tscale\n";
    my $scan_count=0;
    my $first_scans = '';
    while (<$refalign_log>) # grab rescaling factor for each scan from RefAlign log
    {
        chomp;
        if (/scan=(.*):RunIndex=(.*),ScanNumber=(.*):scale=(.*)/)
        {
            my $scan = $1;
            my $RunIndex = $2;
            my $ScanNumber = $3;
            my $scale = $4;
            print $rescaling_factor_list_out "$RunIndex\t$ScanNumber\t$scale\n";
            ++$scan_count;
            if ($ScanNumber == 0)
            {
                $first_scans = $first_scans." ".$scan_count; # grab position of the first scan for each BNX file
            }
        }
    }

    my $command = "Rscript ${dirname}/plot_bnx_rescaling_factors.R ${assembly_directory}/${project}/bnx_rescaling_factors.tab ${assembly_directory}/${project}/bnx_rescaling_factors.pdf ${scan_count}${first_scans}";
    #print "Command: $command\n";
    my $get_rescaled_bnx = `$command`; # plot rescaling factor for each scan
    print "$get_rescaled_bnx";

    ############################################################################

    print "Done merging BNX files and rescaling molecule maps\n";
}
else
{
    print "Done merging BNX files\n";
}

```
##### `assemble.pl`

修改 `$KSUb/assemble_XeonPhi/assemble.pl` 文件：
1. RefAligner路径
2. RefAligner 运行参数

```
#!/usr/bin/perl
################################################################################
#   
#	USAGE: perl assemble.pl <assembly_directory> <p_value Threshold> <project prefix> <genome size> <reference>
#
#  Created by Jennifer Shelton
#
################################################################################
use strict;
use warnings;
# use List::Util qw(max);
# use List::Util qw(sum);
#use XML::Simple;
#use Data::Dumper;
use File::Basename; # enable manipulating of the full path
################################################################################
##############       Customize BioNano Script Settings        ##################
################################################################################
# This pipeline was designed to run on a Xeon Phi server with 576 cores (48x12-core Intel Xeon CPUs), 256GB of RAM, and Linux CentOS 7 operating system. Customization of this section may be required to run the BioNano Assembler on a different machine. Customization of Irys-scaffolding/KSU_bioinfo_lab/assemble_XeonPhi/clusterArguments.xml may also be required for assembly to run successfully on a different cluster.
my $pipelineCL = $ENV{"HOME"} ."/GuiSongtao/software/BioNano/scripts/pipelineCL.py"; #Change if not ~/scripts/pipelineCL.py #GST changed! raw is:
#my $pipelineCL = $ENV{"HOME"} ."/scripts/pipelineCL.py"; 
unless (-f $pipelineCL)
{
    die "Can't find pipelineCL.py at $pipelineCL . Please add correct path to assemble.pl and retry:\n $!";
}
my $tools = $ENV{"HOME"} ."/GuiSongtao/software/BioNano/tools/"; #Change if not ~/tools #GST changed! raw is:
#my $tools = $ENV{"HOME"} ."/tools/";
unless (-d $tools)
{
    die "Can't find the BioNano directory \"tools\" at $tools . Please add correct path to assemble.pl and retry:\n $!";
}
################################################################################
##############                     get arguments              ##################
################################################################################
my $assembly_directory = $ARGV[0];
my $T = $ARGV[1];
my $project = $ARGV[2];
my $genome = $ARGV[3];
my $de_novo=1; # project is de novo
if ($ARGV[4])
{
    if (-f "$ARGV[4]")
    {
        $de_novo=0; # change project is not de novo because a reference CMAP exists
        print "de_novo = false\n";

    }
}
else
{
    print "de_novo = true\n";
}
my $ref;
unless($de_novo == 1)
{
    $ref = $ARGV[4];
    print "ref = $ARGV[4]\n";
}
print "assembly_directory = $ARGV[0]\n";
print "T = $ARGV[1]\n";
my $dirname = dirname(__FILE__); # has no trailing slash
################################################################################
##############              get parameters for XML            ##################
################################################################################
my $T_relaxed = $T * 10;
my $T_strict = $T/10;
my ($FP,$FN,$SiteSD_Kb,$ScalingSD_Kb_square,$LabelDensity);
my $merged_error_file = "${assembly_directory}/all_flowcells/bnx_merged_rescaled_final.err";
#0Iteration	1FP(/100kb)	2FNrate	3SiteSD(Kb)	4ScalingSD(Kb^1/2)	5bpp	6res(pixels)	7Maps	8Log10LR(/Maps)	9GoodMaps	10log10LR(/GoodMaps)	11bppSD	12FPrate	13RelativeSD	14ResolutionSD	15LabelDensity(/100kb)	16resSD	17mres	18mresSD
unless($de_novo == 1)
{
    open (my $merged_error, "<", $merged_error_file) or die "Can't open $merged_error_file!\n";
    while (<$merged_error>)
    {
        if (/^4\t/)
        {
            ($LabelDensity)=(split/\t/)[15]; # because the final label density is reported as 0
        }
        elsif (/^5\t/)
        {
            ($FP,$FN,$SiteSD_Kb,$ScalingSD_Kb_square)=(split/\t/)[1,2,3,4];
        }
    }
    print "Label Density for aligned molecule maps per 100 kb: $LabelDensity\n";
}
################################################################################
##############  Select optArguments.xml file based on genome size ##############
################################################################################
my $xml_infile;
my $iterations = 5;
if ( $genome < 100 )
{
    $xml_infile = "${dirname}/optArguments_small.xml";
}
elsif ( $genome < 1000 )
{
    $xml_infile = "${dirname}/optArguments_medium.xml";
}
else
{
    $xml_infile = "${dirname}/optArguments_human.xml";
    $iterations = 2; # Can lower the number of itereations for large genomes in future if needed

}
################################################################################
##############                 parse XML                      ##################
################################################################################
my %p_value = (
    'default_t_150' => "$T",
    'relaxed_t_150' => "$T_relaxed",
    'strict_t_150' => "$T_strict",
    'default_t_100' => "$T",
    'relaxed_t_100' => "$T_relaxed",
    'strict_t_100' => "$T_strict",
    'default_t_180' => "$T",
    'relaxed_t_180' => "$T_relaxed",
    'strict_t_180' => "$T_strict"
);
my @commands = qw/default_t_150 relaxed_t_150 strict_t_150 default_t_100 relaxed_t_100 strict_t_100 default_t_180 relaxed_t_180 strict_t_180/;
unless($de_novo == 1) # if the project is not de novo then make one assembly to test the effect of the default noise parameters
{
    $p_value{'default_t_default_noise'} = "$T";
    push(@commands, 'default_t_default_noise');
}
open (my $out_assemble, '>',"${assembly_directory}/assembly_commands.sh"); # for assembly commands
##################################################################
##############        Write bash scripts        ##################
##################################################################
print $out_assemble "#!/bin/bash\n";
print $out_assemble "##################################################################\n";
print $out_assemble "#####                  ASSEMBLY COMMANDS                     #####\n";
print $out_assemble "##################################################################\n";
for my $stringency (@commands)
{
    my $current_p_value = $p_value{$stringency};
    ##################################################################
    ##############     Create assembly directories  ##################
    ##################################################################
    my $out_dir = "${assembly_directory}/${stringency}";
    unless(mkdir $out_dir)
    {
		die "Exiting because unable to create $out_dir\n";
	}
    ##################################################################
    ##############        Set assembly parameters   ##################
    ##################################################################
    my $xml_final = "${assembly_directory}/${stringency}/${stringency}_final_optArguments.xml";
    my $min_length = 150;
    unless ($stringency eq 'default_t_default_noise')# skip adjusting molecule length parameter based on the assembly name for the default_noise assembly
    {
        $stringency =~ /.*_t_(.*)/;
        $min_length = $1;
    }
    open (my $optarg_final, '>', $xml_final) or die "Can't open $xml_final\n";
    open (my $optarg, '<', $xml_infile ) or die "Can't open $xml_infile\n";
    
    CUSTOMXML: while (<$optarg>)
    {
        if (/<flag attr=\"-T\".*group=\"Initial Assembly\"/)
        {
            s/(val0=\")(.*)(\"\s+display.*group=\"Initial Assembly\".*)/$1$p_value{$stringency}$3/;
            print $optarg_final "$_";
#            print "Yes#6\n";
            next CUSTOMXML;
        }
        elsif (/<flag attr=\"-T\".*group=\"Extension and Refinement\"/)
        {
            my $new_p=$p_value{$stringency}/10;
            s/(val0=\")(.*)(\"\s+display.*group=\"Extension and Refinement\".*)/$1${new_p}$3/;
            print $optarg_final "$_";
#            print "Yes#7\n";
            next CUSTOMXML;
        }
        elsif (/<flag attr=\"-T\".*group=\"Merge\"/)
        {
            my $final_p=$p_value{$stringency}/10000;
            s/(val0=\")(.*)(\"\s+display.*group=\"Merge\".*)/$1${final_p}$3/;
            print $optarg_final "$_";
#            print "Yes#8\n";
            next CUSTOMXML;
        }
        elsif (/<flag attr=\"-minlen\".*group=\"BNX Sort\"/)
        {
#            <flag attr="-minlen"      val0="150" display="Molecule Length Threshold (Kb)" group="BNX Sort" default0="150" description="Minimum length of molecules (kb) that are used in BNX sort. This will also be the minimum length used for all downstream Pipeline stages (entire assembly)." />
            s/(.*val0=\")(.*)(\"\s+display=\"Molecule Length Threshold.*)/$1${min_length}$3/;
            print $optarg_final "$_";
#            print "Yes#1\n";
            next CUSTOMXML;
        }
        elsif ($stringency ne 'default_t_default_noise')# skip adjusting molecule length and noise parameters for the default_noise assembly or any de novo assembly
        {
            if ($de_novo == 0)
            {

                if (/<flag attr=\"-FP\".*group=\"DeNovo Assembly Noise\"/)
                {
                    s/(<flag attr=\"-FP\" val0=\")(.*)(\"\s+display.*)/$1${FP}$3/;
                    print $optarg_final "$_";
#                    print "Yes#2\n";
                    next CUSTOMXML;
                }
                elsif (/<flag attr=\"-FN\".*group=\"DeNovo Assembly Noise\"/)
                {
                    s/(<flag attr=\"-FN\" val0=\")(.*)(\"\s+display.*)/$1${FN}$3/;
                    print $optarg_final "$_";
#                    print "Yes#3\n";
                    next CUSTOMXML;
                }
                elsif (/<flag attr=\"-sd\".*group=\"DeNovo Assembly Noise\"/)
                {
                    s/(val0=\")(.*)(\"\s+display.*)/$1${ScalingSD_Kb_square}$3/;
                    print $optarg_final "$_";
#                    print "Yes#4\n";
                    next CUSTOMXML;
                }
                elsif (/<flag attr=\"-sf\".*group=\"DeNovo Assembly Noise\"/)
                {
                    s/(val0=\")(.*)(\"\s+display.*)/$1${SiteSD_Kb}$3/;
                    print $optarg_final "$_";
#                    print "Yes#5\n";
                    next CUSTOMXML;
                }
            }
        }
        print $optarg_final "$_"; # print any unchanged line
    }
    ##################################################################
    ##############        Write assembly command    ##################
    ##################################################################
    print $out_assemble "##################################################################\n";
    print $out_assemble "#####             ASSEMBLY: ${stringency}                \n";
    print $out_assemble "##################################################################\n";
#    /home/mic_common/scripts_fresh/pipelineCL.py -y -d -U -T 240 -N 6 -j 240 -i 5 -l /home/irys/data/human_100x_test/output/ -t /usr/src/genome_grid/configurations/Human_hg19/tools -C /home/irys/data/human_100x_test/clusterArguments.xml -b /home/irys/data/human_100x_test/input.bnx -r /home/irys/data/human_100x_test/ref.cmap -a /home/irys/data/human_100x_test/optArguments.xml
    if ($min_length != 150)
    {
        print $out_assemble "#"; #start with default min length assemblies by commenting other assemblies
    }
    if ($de_novo == 1)
    {
    		print $out_assemble "python2 $pipelineCL -T 15 -j 15 -N 6 -i $iterations -a $xml_final -w -t $tools -l $out_dir -b ${assembly_directory}/all_flowcells/bnx_merged.bnx -V 1 -e ${project}_${stringency} -p 0 -U\n"; # GST edited! removed " -C ${dirname}/clusterArguments.xml", and change threads Raw is below:
        #print $out_assemble "python2 $pipelineCL -T 240 -j 240 -N 6 -i $iterations -a $xml_final -w -t $tools -l $out_dir -b ${assembly_directory}/all_flowcells/bnx_merged.bnx -V 1 -e ${project}_${stringency} -p 0 -U -C ${dirname}/clusterArguments.xml\n";
    }
    else
    {		
    		print $out_assemble "python2 $pipelineCL -T 15 -j 15 -N 6 -i $iterations -a $xml_final -w -t $tools -l $out_dir -b ${assembly_directory}/all_flowcells/bnx_merged_adj_rescaled.bnx -V 1 -e ${project}_${stringency} -p 0 -r $ref -U\n";  # GST edited! removed " -C ${dirname}/clusterArguments.xml", and change threads. Raw is below:
        #print $out_assemble "python2 $pipelineCL -T 240 -j 240 -N 6 -i $iterations -a $xml_final -w -t $tools -l $out_dir -b ${assembly_directory}/all_flowcells/bnx_merged_adj_rescaled.bnx -V 1 -e ${project}_${stringency} -p 0 -r $ref -U -C ${dirname}/clusterArguments.xml\n";
    }
    if ($min_length != 150)
    {
        print $out_assemble "#"; #start with default min length assemblies by commenting other assemblies
    }
    print $out_assemble "bash ${dirname}/rm_intermediate_files.sh ${assembly_directory} ${stringency} ${project}\n";
}

print "Done writing assembly scripts.\n";

```
#### 1.3.2 Add your own Enzyme

##### `nick_density.pl`

`vim $KSU/map_tools/nick_density.pl` :

```
#line 57
my @enzymes = qw/BspQI BbvCI BsmI BsrDI bseCI BssSI/; #BssSI是新加的
```

##### `fa2cmap_multi.pl`
`vim $KSU/assemble_XeonPhi/third-party/fa2cmap_multi.pl`:

```
# start from line 47 
my %enzyme = (
	"BspQI" => "GCTCTTC",
	"BbvCI" => "CCTCAGC",
	"BsmI"  => "GAATGC",
	"BsrDI" => "GCAATG",
	"bseCI" => "ATCGAT",
	"BssSI" => "CACGAG" #added by GST, 名字要与nick_density.pl中的更改一致
	# You can add more enzymes here ...
	
);
```

##### `sewing_machine.pl`

`vim $KSU/stitch/sewing_machine.pl`:
```
#line 163
unless($enzyme =~ /(BspQI|BbvCI|BsrDI|bseCI|BsmI|BssSI)/) #gst added |BssSI 与前两个更改一致
```

## 2. 流程操作

### 2.1 Hybrid Scaffold 流程

具体流程解释见[GitHub](https://github.com/i5K-KINBRE-script-share/Irys-scaffolding/blob/master/KSU_bioinfo_lab/stitch/sewing_machine_LAB.md)

需要的文件:

- 参考基因组Scaffold的fasta序列: `ref.fasta`
- `ref.fasta`用对应酶模拟酶切的cmap文件: `ref.cmap`
- Bionano组装结果cmap文件:`REFINEFINAL1.cmap`

**STEP 1. Compare your assembled genome maps to your reference in silico maps with sewing machine** 

```
perl $KSU/stitch/sewing_machine.pl -help #查看具体参数
```
基本用法:

```
perl $KSU/stitch/sewing_machine.pl -o [输出文件夹] -g [Bionano组装结果cmap文件.cmap] -p [项目名称] -e [酶] -f [ref.fasta] -r [ref.cmp]
```

**STEP 2. Choose your best alignment parameters and explore your results**


第一步中的[输出文件夹]下`.csv`包含组装参数,选择你认为最好的参数,用`write_report.pl`生成最终结果:
(以 默认参数为例)

```
perl $KSU/assemble_XeonPhi/write_report.pl -o [输出文件夹] -g [Bionano组装结果cmap文件.cmap] -p [项目名称] -e [酶] -f [ref.fasta] -r [ref.cmp] --alignment_parameters default_alignment
```

**STEP 3. Explore your results in IrysView**

在[输出文件夹]下有
- report.txt 文件
- [项目名称] 文件夹
- 项目名称.tar.gz 压缩包

可根据[README.PDF](https://github.com/i5K-KINBRE-script-share/Irys-scaffolding/blob/master/KSU_bioinfo_lab/assemble_XeonPhi/README.pdf)
在windows上用IrysView查看结果

