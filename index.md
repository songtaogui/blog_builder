+++
title = "tag"
showall = true
hasplotly = false
hasmermaid = false
hascomment = false
+++

@def title = "Songtao Gui's Academic Blog"

<!-- -----------------
     BIOGRAPHY SECTION
     ----------------- -->

\begin{section}{name="about"}

<!-- LEFT COLUMN -->
@@col-12,col-lg-4,profile

\img{"/assets/img/person.jpg", class="avatar avatar-circle", alt="Songtao Gui"}
\portrait{
  name="Songtao Gui",
  job="Researcher & Developer",
  motto="Being different at all cost.",
  location="Wuhan, China, 430070",
  github="https://github.com/songtaogui",
  gscholar="https://scholar.google.co.uk/citations?user=1LAvdloAAAAJ",
  twitter="https://twitter.com/GuiSongtao",
  blog="https://songtaogui.github.io/",
  orcid="http://orcid.org/0000-0001-6718-982X"
}
@@ <!-- end of column -->

<!-- RIGHT COLUMN -->
@@col-12,col-lg-8

\begin{biography}{resume="/cv"}
<!-- \begin{biography}{resume=""} -->
  Hi there, I am a postdoc of crop genetics and breeding at the National Key Laboratory
of Crop Genetic Improvement, Huazhong Agricultural University. My research interests includes:
- Population genomics and genetics
- Graphic genomics
- Multi-omics integration
I am also co-maintaining the [ZEAMAP](www.zeamap.com) database, which collected multi-omics data in *Zea* populations.
\end{biography}

\shortcv{
  interests=["Population genetics", "Graph genomics", "Cool codes in julia", "Ping-Pong", "Cat"],
  education=[
    ("PostDoc in Crop Breeding, 2018-Now", "Huazhong Agricultural University"),
    ("PhD in Genetics, 2012-2017", "Wuhan University"),
    ("BSc in Biological Science, 2008-2012", "Shandong Normal University")]
}

@@ <!-- end of column -->
\end{section}

<!-- --------------
     SKILLS SECTION
     -------------- -->

---

\begin{section}{name="skills", class="wg-featurette", rowclass="featurette"}

\sectionheading{"Skills", class="col-md-12"}

\skill{"Linux/Bash", "90%", img="/assets/img/bash.svg"}
\skill{"Perl", "80%", img="/assets/img/perl.svg"}
\skill{"R", "80%", img="assets/img/r.svg"}
\skill{"Julia", "70%", img="/assets/img/juliarocker.gif"}
\skill{"BioMath", "10%", img="/assets/img/mathematics.svg"}
\skill{"BioStatistic", "20%", img="assets/img/statistic.svg"}
<!-- \skill{"Ping-Pong", "10%", img="assets/img/ping-pong.svg"} -->

\end{section}

---

<!-- ------------------
     EXPERIENCE SECTION
     ------------------ -->

\begin{section}{name="experience"}

\sectionheading{"Experience", class="col-12 col-lg-4"}

@@col-12,col-lg-8

\experience{
  title="PostDoc",
  company="HZAU",
  descr="""
    Responsibilities include:
    * Study the genomics and genetic variations in *Zea*
    * Study the pan-genomics of *Zea*
    * Construct and maintain the *Zea* multi-omics database [Zeamap](www.zeamap.com)
    """,
  from="Jan 2018",
  to="Present",
  location="Wuhan",
  active=true
  }
\experience{
  title="Developer",
  company="BGI",
  descr="""
  Cooperate with/Lead a development team of 5 members to develop the multi-omics database ZEAMAP.
  """,
  from="Dec 2018",
  to="Dec 2019",
  location="Shenzhen",
  active=false
}
\experience{
  title="PhD candidate",
  company="WHU",
  from="Sep 2012",
  to="Dec 2017",
  last=true,
  location="Wuhan",
  descr="""
    Responsibilities include:
    - Construct the genetic linkage map of *Nelumbo nucifera*
    - Study the organelle genomes of *Nelumbo nucifera*
    - Study the CenH3 and centromere of *Nelumbo nucifera*
    - Identify DNA fingerprints for Rice germplasms
    """
  }

@@

\end{section}

~~~<hr>~~~

<!-- -----------------------
     ACCOMPLISHMENTS SECTION
     ----------------------- -->
<!-- 
\begin{section}{name="accomplishments"}

\sectionheading{"Accomplish­ments", class="col-12 col-lg-4"}

@@col-12,col-lg-8

\certificate{
  title="Neural Networks and Deep Learning",
  meta="Coursera",
  metalink="https://www.coursera.org",
  date="Oct 2018",
  certlink="https://www.coursera.org"
  }
\certificate{
  title="Blockchain Fundamentals",
  descr="Formulated informed **blockchain** models, hypotheses, and use cases.",
  meta="Coursera",
  metalink="https://www.edx.org",
  date="Mar 2018",
  certlink="https://www.edx.org"
  }
\certificate{
  title="Object-Oriented Programming in R: S3 and R6 Course",
  meta="DataCamp",
  metalink="https://www.datacamp.com",
  date="Jul 2017 – Dec 2017",
  certlink="https://www.datacamp.com"
}

@@

\end{section}
 -->

<!-- --------------------
     RECENT POSTS SECTION
     -------------------- -->

\begin{section}{name="posts", class="wg-pages"}

\sectionheading{"Recent Posts", class="col-12 col-lg-4"}

@@col-12,col-lg-8

{{recentposts 3}}

@@

\end{section}

~~~<hr>~~~

<!-- -----------------
     PORTFOLIO SECTION XXX
     ----------------- -->

<!-- -------------
     TALKS SECTION XXX
     ------------- -->

<!-- --------------------
     FEATURED PUB SECTION XXX
     -------------------- -->

<!-- ---------------------------
     RECENT PUBLICATIONS SECTION XXX
     --------------------------- -->
