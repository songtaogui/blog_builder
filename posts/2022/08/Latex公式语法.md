+++
title = "Latex公式语法"
# tags = [ "programming","bioinformatics","genetics","paper","work","daily","random","insight", ... ]
tags = ["latex","math","markdown"]
showall = true
summary = """
  Useful latex markdown gramma.
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
hascomment = true

pubdate = Date("2022-08-14")
+++

{{page_tags}}

\toc

## (1) 保留字符

| 序号 | 符号         | LaTex        |
| ---- | ------------ | ------------ |
| 1    | $\#$         | `\#`         |
| 2    | $\%$         | `\%`         |
| 3    | $^\wedge$    | `\^`         |
| 4    | $\&$         | `\&`         |
| 5    | $\_$         | `\_`         |
| 6    | $\{\}$       | `\{\}`       |
| 7    | $\sim$       | `\sim`       |
| 8    | $\backslash$ | `\backslash` |
|      |              |              |

## (2) 希腊字母

| Ord |    Char    |   LaTeX    |   Upper    |   LaTeX    |          Var           |         LaTex          |  Phonetic   |
| :-: | :--------: | :--------: | :--------: | :--------: | :--------------------: | :--------------------: | :---------: |
|  1  |  $\alpha$  |  `\alpha`  |  $\Alpha$  |  `\Alpha`  |                        |                        |   /ˈælfə/   |
|  2  |  $\beta$   |  `\beta`   |  $\Beta$   |  `\Beta`   |                        |                        |  /ˈbeɪtə/   |
|  3  |  $\gamma$  |  `\gamma`  |  $\Gamma$  |  `\Gamma`  |      $\varGamma$       |      `\varGamma`       |   /ˈɡæmə/   |
|  4  |  $\delta$  |  `\delta`  |  $\Delta$  |  `\Delta`  |      $\varDelta$       |      `\varDelta`       |  /ˈdɛltə/   |
|  5  | $\epsilon$ | `\epsilon` | $\Epsilon$ | `\Epsilon` |     $\varepsilon$      |     `\varepsilon`      | /ˈɛpsɪlɒn/  |
|  6  |  $\zeta$   |  `\zeta`   |  $\Zeta$   |  `\Zeta`   |                        |                        |  /ˈzeɪtə/   |
|  7  |   $\eta$   |   `\eta`   |   $\Eta$   |   `\Eta`   |                        |                        |   /ˈeɪtə/   |
|  8  |  $\theta$  |  `\theta`  |  $\Theta$  |  `\Theta`  | $\varTheta, \vartheta$ | `\varTheta, \vartheta` |  /ˈθiːtə/   |
|  9  |  $\iota$   |  `\iota`   |  $\Iota$   |  `\Iota`   |                        |                        |  /aɪˈoʊtə/  |
| 10  |  $\kappa$  |  `\kappa`  |  $\Kappa$  |  `\Kappa`  |      $\varkappa$       |      `\varkappa`       |   /ˈkæpə/   |
| 11  | $\lambda$  | `\lambda`  | $\Lambda$  | `\Lambda`  |      $\varLambda$      |      `\varLambda`      |  /ˈlæmdə/   |
| 12  |   $\mu$    |   `\mu`    |   $\Mu$    |   `\Mu`    |                        |                        |   /mjuː/    |
| 13  |   $\nu$    |   `\nu`    |   $\Nu$    |    `Nu`    |                        |                        |   /njuː/    |
| 14  |   $\xi$    |   `\xi`    |   $\xi$    |   `\Xi`    |        $\varXi$        |        `\varXi`        | /zaɪ, ksaɪ/ |
| 15  |    $o$     |    `o`     |    $O$     |    `O`     |                        |                        | /ˈɒmɪkrɒn/  |
| 16  |   $\pi$    |   `\pi`    |   $\Pi$    |   `\Pi`    |    $\varpi, \varPi$    |    `\varpi, \varPi`    |    /paɪ/    |
| 17  |   $\rho$   |   `\rho`   |   $\Rho$   |   `\Rho`   |       $\varrho$        |       `\varrho`        |    /roʊ/    |
| 18  |  $\sigma$  |  `\sigma`  |  $\Sigma$  |  `\Sigma`  | $\varsigma, \varSigma$ | `\varsigma, \varSigma` |  /ˈsɪɡmə/   |
| 19  |   $\tau$   |   `\tau`   |   $\Tau$   |   `\Tau`   |                        |                        | /taʊ, tɔː/  |
| 20  | $\upsilon$ | `\upsilon` | $\Upsilon$ | `\Upsilon` |     $\varUpsilon$      |     `\varUpsilon`      | /ˈʌpsɪlɒn/  |
| 21  |   $\phi$   |   `\phi`   |   $\Phi$   |   `\Phi`   |   $\varphi,\varPhi$    |   `\varphi, \varPhi`   |    /faɪ/    |
| 22  |   $\chi$   |   `\chi`   |   $\Chi$   |   `\Chi`   |                        |                        |    /kaɪ/    |
| 23  |   $\psi$   |   `\psi`   |   $\Psi$   |   `\Psi`   |       $\varPsi$        |       `\varPsi`        |   /psaɪ/    |
| 24  |  $\omega$  |  `\omega`  |  $\Omega$  |  `\Omega`  |      $\varOmega$       |      `\varOmega`       | /oʊˈmeɪɡə/  |
| 25  | $\digamma$ | `\digamma` |            |            |                        |                        | /daɪ'gæmə/  |


## (3) 希伯来字母

| 序号 | 符号     | LaTeX    | 英文  | 序号 | 符号      | LaTeX     | 英文   |
| :--- | :------- | :------- | :---- | :--- | :-------- | :-------- | :----- |
| 1    | $\aleph$ | `\aleph` | aleph | 3    | $\gimel$  | `\gimel`  | gimel  |
| 2    | $\beth$  | `\beth`  | beth  | 4    | $\daleth$ | `\daleth` | daleth |

## (4) 二元运算

| 序号 | 符号             | LaTeX            | 序号 | 符号               | LaTeX              |
| :--- | :--------------- | :--------------- | :--- | :----------------- | :----------------- |
| 1    | $+$              | `+`              | 20   | $\bullet$          | `\bullet`          |
| 2    | $-$              | `-`              | 21   | $\oplus$           | `\oplus`           |
| 3    | $\times$         | `\times`         | 22   | $\ominus$          | `\ominus`          |
| 4    | $\div$           | `\div`           | 23   | $\odot$            | `\odot`            |
| 5    | $\pm$            | `\pm`            | 24   | $\oslash$          | `\oslash`          |
| 6    | $\mp$            | `\mp`            | 25   | $\otimes$          | `\otimes`          |
| 7    | $\triangleleft$  | `\triangleleft`  | 26   | $\bigcirc$         | `\bigcirc`         |
| 8    | $\triangleright$ | `\triangleright` | 27   | $\diamond$         | `\diamond`         |
| 9    | $\cdot$          | `\cdot`          | 28   | $\uplus$           | `\uplus`           |
| 10   | $\setminus$      | `\setminus`      | 29   | $\bigtriangleup$   | `\bigtriangleup`   |
| 11   | $\star$          | `\star`          | 30   | $\bigtriangledown$ | `\bigtriangledown` |
| 12   | $\ast$           | `\ast`           | 31   | $\lhd$             | `\lhd`             |
| 13   | $\cup$           | `\cup`           | 32   | $\rhd$             | `\rhd`             |
| 14   | $\cap$           | `\cap`           | 33   | $\unlhd$           | `\unlhd`           |
| 15   | $\sqcup$         | `\sqcup`         | 34   | $\unrhd$           | `\unrhd`           |
| 16   | $\sqcap$         | `\sqcap`         | 35   | $\amalg$           | `\amalg`           |
| 17   | $\vee$           | `\vee`           | 36   | $\wr$              | `\wr`              |
| 18   | $\wedge$         | `\wedge`         | 37   | $\dagger$          | `\dagger`          |
| 19   | $\circ$          | `\circ`          | 38   | $\ddagger$         | `\ddagger`         |


## (5) 二元关系符

| 序号 | 符号                                     | LaTeX                                    | 序号 | 符号           | LaTeX          |
| :--- | ---------------------------------------- | :--------------------------------------- | :--- | -------------- | :------------- |
| 1    | $=$                                      | `=`                                      | 49   | $\gneq$        | `\gneq`        |
| 2    | $\ne$                                    | `\ne`                                    | 50   | $\geqq$        | `\geqq`        |
| 3    | $\neq$                                   | `\neq`                                   | 51   | $\ngeq$        | `\ngeq`        |
| 4    | $\equiv$                                 | `\equiv`                                 | 52   | $\ngeqq$       | `\ngeqq`       |
| 5    | $\not\equiv$                             | `\not\equiv`                             | 53   | $\gneqq$       | `\gneqq`       |
| 6    | $\doteq$                                 | `\doteq`                                 | 54   | $\gvertneqq$   | `\gvertneqq`   |
| 7    | $\doteqdot$                              | `\doteqdot`                              | 55   | $\lessgtr$     | `\lessgtr`     |
| 8    | $\overset{\underset{\mathrm{def}}{}}{=}$ | `\overset{\underset{\mathrm{def}}{}}{=}` | 56   | $\lesseqgtr$   | `\lesseqgtr`   |
| 9    | $:=$                                     | `:=`                                     | 57   | $\lesseqqgtr$  | `\lesseqqgtr`  |
| 10   | $\sim$                                   | `\sim`                                   | 58   | $\gtrless$     | `\gtrless`     |
| 11   | $\nsim$                                  | `\nsim`                                  | 59   | $\gtreqless$   | `\gtreqless`   |
| 12   | $\backsim$                               | `\backsim`                               | 60   | $\gtreqqless$  | `\gtreqqless`  |
| 13   | $\thicksim$                              | `\thicksim`                              | 61   | $\leqslant$    | `\leqslant`    |
| 14   | $\simeq$                                 | `\simeq`                                 | 62   | $\nleqslant$   | `\nleqslant`   |
| 15   | $\backsimeq$                             | `\backsimeq`                             | 63   | $\eqslantless$ | `\eqslantless` |
| 16   | $\eqsim$                                 | `\eqsim`                                 | 64   | $\geqslant$    | `\geqslant`    |
| 17   | $\cong$                                  | `\cong`                                  | 65   | $\ngeqslant$   | `\ngeqslant`   |
| 18   | $\ncong$                                 | `\ncong`                                 | 66   | $\eqslantgtr$  | `\eqslantgtr`  |
| 19   | $\approx$                                | `\approx`                                | 67   | $\lesssim$     | `\lesssim`     |
| 20   | $\thickapprox$                           | `\thickapprox`                           | 68   | $\lnsim$       | `\lnsim`       |
| 21   | $\approxeq$                              | `\approxeq`                              | 69   | $\lessapprox$  | `\lessapprox`  |
| 22   | $\asymp$                                 | `\asymp`                                 | 70   | $\lnapprox$    | `\lnapprox`    |
| 23   | $\propto$                                | `\propto`                                | 71   | $\gtrsim$      | `\gtrsim`      |
| 24   | $\varpropto$                             | `\varpropto`                             | 72   | $\gnsim$       | `\gnsim`       |
| 25   | $<$                                      | `<`                                      | 73   | $\gtrapprox$   | `\gtrapprox`   |
| 26   | $\nless$                                 | `\nless`                                 | 74   | $\gnapprox$    | `\gnapprox`    |
| 27   | $\ll$                                    | `\ll`                                    | 75   | $\prec$        | `\prec`        |
| 28   | $\not\ll$                                | `\not\ll`                                | 76   | $\nprec$       | `\nprec`       |
| 29   | $\lll$                                   | `\lll`                                   | 77   | $\preceq$      | `\preceq`      |
| 30   | $\not\lll$                               | `\not\lll`                               | 78   | $\npreceq$     | `\npreceq`     |
| 31   | $\lessdot$                               | `\lessdot`                               | 79   | $\precneqq$    | `\precneqq`    |
| 32   | $>$                                      | `>`                                      | 80   | $\succ$        | `\succ`        |
| 33   | $\ngtr$                                  | `\ngtr`                                  | 81   | $\nsucc$       | `\nsucc`       |
| 34   | $\gg$                                    | `\gg`                                    | 82   | $\succeq$      | `\succeq`      |
| 35   | $\not\gg$                                | `\not\gg`                                | 83   | $\nsucceq$     | `\nsucceq`     |
| 36   | $\ggg$                                   | `\ggg`                                   | 84   | $\succneqq$    | `\succneqq`    |
| 37   | $\not\ggg$                               | `\not\ggg`                               | 85   | $\preccurlyeq$ | `\preccurlyeq` |
| 38   | $\gtrdot$                                | `\gtrdot`                                | 86   | $\curlyeqprec$ | `\curlyeqprec` |
| 39   | $\le$                                    | `\le`                                    | 87   | $\succcurlyeq$ | `\succcurlyeq` |
| 40   | $\leq$                                   | `\leq`                                   | 88   | $\curlyeqsucc$ | `\curlyeqsucc` |
| 41   | $\lneq$                                  | `\lneq`                                  | 89   | $\precsim$     | `\precsim`     |
| 42   | $\leqq$                                  | `\leqq`                                  | 90   | $\precnsim$    | `\precnsim`    |
| 43   | $\nleq$                                  | `\nleq`                                  | 91   | $\precapprox$  | `\precapprox`  |
| 44   | $\nleqq$                                 | `\nleqq`                                 | 92   | $\precnapprox$ | `\precnapprox` |
| 45   | $\lneqq$                                 | `\lneqq`                                 | 93   | $\succsim$     | `\succsim`     |
| 46   | $\lvertneqq$                             | `\lvertneqq`                             | 94   | $\succnsim$    | `\succnsim`    |
| 47   | $\ge$                                    | `\ge`                                    | 95   | $\succapprox$  | `\succapprox`  |
| 48   | $\geq$                                   | `\geq`                                   | 96   | $\succnapprox$ | `\succnapprox` |


## (6) 几何符号

| 序号 | 符号                | LaTeX               | 序号 | 符号                  | LaTeX                 |
| :--- | :------------------ | :------------------ | :--- | :-------------------- | :-------------------- |
| 1    | $\parallel$         | `\parallel`         | 14   | $\lozenge$            | `\lozenge`            |
| 2    | $\nparallel$        | `\nparallel`        | 15   | $\blacklozenge$       | `\blacklozenge`       |
| 3    | $\shortparallel$    | `\shortparallel`    | 16   | $\bigstar$            | `\bigstar`            |
| 4    | $\nshortparallel$   | `\nshortparallel`   | 17   | $\bigcirc$            | `\bigcirc`            |
| 5    | $\perp$             | `\perp`             | 18   | $\triangle$           | `\triangle`           |
| 6    | $\angle$            | `\angle`            | 19   | $\bigtriangleup$      | `\bigtriangleup`      |
| 7    | $\sphericalangle$   | `\sphericalangle`   | 20   | $\bigtriangledown$    | `\bigtriangledown`    |
| 8    | $\measuredangle$    | `\measuredangle`    | 21   | $\vartriangle$        | `\vartriangle`        |
| 9    | $45^\circ$          | `45^\circ`          | 22   | $\triangledown$       | `\triangledown`       |
| 10   | $\Box$              | `\Box`              | 23   | $\blacktriangle$      | `\blacktriangle`      |
| 11   | $\blacksquare$      | `\blacksquare`      | 24   | $\blacktriangledown$  | `\blacktriangledown`  |
| 12   | $\diamond$          | `\diamond`          | 25   | $\blacktriangleleft$  | `\blacktriangleleft`  |
| 13   | $\Diamond \lozenge$ | `\Diamond \lozenge` | 26   | $\blacktriangleright$ | `\blacktriangleright` |

## (7) 逻辑符号

| 序号 | 符号             | LaTeX            | 序号 | 符号                   | LaTeX                  |
| :--- | :--------------- | :--------------- | :--- | :--------------------- | :--------------------- |
| 1    | $\forall$        | `\forall`        | 20   | $\neg$                 | `\neg`                 |
| 2    | $\exists$        | `\exists`        | 21   | $\not\operatorname{R}$ | `\not\operatorname{R}` |
| 3    | $\nexists$       | `\nexists`       | 22   | $\bot$                 | `\bot`                 |
| 4    | $\therefore$     | `\therefore`     | 23   | $\top$                 | `\top`                 |
| 5    | $\because$       | `\because`       | 24   | $\vdash$               | `\vdash`               |
| 6    | $\And$           | `\And`           | 25   | $\dashv$               | `\dashv`               |
| 7    | $\lor$           | `\lor`           | 26   | $\vDash$               | `\vDash`               |
| 8    | $\vee$           | `\vee`           | 27   | $\Vdash$               | `\Vdash`               |
| 9    | $\curlyvee$      | `\curlyvee`      | 28   | $\models$              | `\models`              |
| 10   | $\bigvee$        | `\bigvee`        | 29   | $\Vvdash$              | `\Vvdash`              |
| 11   | $\land$          | `\land`          | 30   | $\nvdash$              | `\nvdash`              |
| 12   | $\wedge$         | `\wedge`         | 31   | $\nVdash$              | `\nVdash`              |
| 13   | $\curlywedge$    | `\curlywedge`    | 32   | $\nvDash$              | `\nvDash`              |
| 14   | $\bigwedge$      | `\bigwedge`      | 33   | $\nVDash$              | `\nVDash`              |
| 15   | $\bar{q}$        | `\bar{q}`        | 34   | $\ulcorner$            | `\ulcorner`            |
| 16   | $\bar{abc}$      | `\bar{abc}`      | 35   | $\urcorner$            | `\urcorner`            |
| 17   | $\overline{q}$   | `\overline{q}`   | 36   | $\llcorner$            | `\llcorner`            |
| 18   | $\overline{abc}$ | `\overline{abc}` | 37   | $\lrcorner$            | `\lrcorner`            |
| 19   | $\lnot$          | `\lnot`          |      |                        |                        |

## (8) 集合符号

| 序号 | 符号             | LaTeX            | 序号 | 符号             | LaTeX            |
| :--- | :--------------- | :--------------- | :--- | :--------------- | :--------------- |
| 1    | $\{ \}$          | `\{ \}`          | 23   | $\sqsubset$      | `\sqsubset`      |
| 2    | $\emptyset$      | `\emptyset`      | 24   | $\supset$        | `\supset`        |
| 3    | $\varnothing$    | `\varnothing`    | 25   | $\Supset$        | `\Supset`        |
| 4    | $\in$            | `\in`            | 26   | $\sqsupset$      | `\sqsupset`      |
| 5    | $\notin$         | `\notin`         | 27   | $\subseteq$      | `\subseteq`      |
| 6    | $\ni$            | `\ni`            | 28   | $\nsubseteq$     | `\nsubseteq`     |
| 7    | $\cap$           | `\cap`           | 29   | $\subsetneq$     | `\subsetneq`     |
| 8    | $\Cap$           | `\Cap`           | 30   | $\varsubsetneq$  | `\varsubsetneq`  |
| 9    | $\sqcap$         | `\sqcap`         | 31   | $\sqsubseteq$    | `\sqsubseteq`    |
| 10   | $\bigcap$        | `\bigcap`        | 32   | $\supseteq$      | `\supseteq`      |
| 11   | $\cup$           | `\cup`           | 33   | $\nsupseteq$     | `\nsupseteq`     |
| 12   | $\Cup$           | `\Cup`           | 34   | $\supsetneq$     | `\supsetneq`     |
| 13   | $\sqcup$         | `\sqcup`         | 35   | $\varsupsetneq$  | `\varsupsetneq`  |
| 14   | $\bigcup$        | `\bigcup`        | 36   | $\sqsupseteq$    | `\sqsupseteq`    |
| 15   | $\bigsqcup$      | `\bigsqcup`      | 37   | $\subseteqq$     | `\subseteqq`     |
| 16   | $\uplus$         | `\uplus`         | 38   | $\nsubseteqq$    | `\nsubseteqq`    |
| 17   | $\biguplus$      | `\biguplus`      | 39   | $\subsetneqq$    | `\subsetneqq`    |
| 18   | $\setminus$      | `\setminus`      | 40   | $\varsubsetneqq$ | `\varsubsetneqq` |
| 19   | $\smallsetminus$ | `\smallsetminus` | 41   | $\supseteqq$     | `\supseteqq`     |
| 20   | $\times$         | `\times`         | 42   | $\nsupseteqq$    | `\nsupseteqq`    |
| 21   | $\subset$        | `\subset`        | 43   | $\supsetneqq$    | `\supsetneqq`    |
| 22   | $\Subset$        | `\Subset`        | 44   | $\varsupsetneqq$ | `\varsupsetneqq` |

## (9) 箭头符号

| 序号 | 符号                  | LaTeX                 | 序号 | 符号                   | LaTeX                  |
| :--- | :-------------------- | :-------------------- | :--- | :--------------------- | :--------------------- |
| 1    | $\Rrightarrow$        | `\Rrightarrow`        | 36   | $\longmapsto$          | `\longmapsto`          |
| 2    | $\Lleftarrow$         | `\Lleftarrow`         | 37   | $\rightharpoonup$      | `\rightharpoonup`      |
| 3    | $\Rightarrow$         | `\Rightarrow`         | 38   | $\rightharpoondown$    | `\rightharpoondown`    |
| 4    | $\nRightarrow$        | `\nRightarrow`        | 39   | $\leftharpoonup$       | `\leftharpoonup`       |
| 5    | $\Longrightarrow$     | `\Longrightarrow`     | 40   | $\leftharpoondown$     | `\leftharpoondown`     |
| 6    | $\implies$            | `\implies`            | 41   | $\upharpoonleft$       | `\upharpoonleft`       |
| 7    | $\Leftarrow$          | `\Leftarrow`          | 42   | $\upharpoonright$      | `\upharpoonright`      |
| 8    | $\nLeftarrow$         | `\nLeftarrow`         | 43   | $\downharpoonleft$     | `\downharpoonleft`     |
| 9    | $\Longleftarrow$      | `\Longleftarrow`      | 44   | $\downharpoonright$    | `\downharpoonright`    |
| 10   | $\Leftrightarrow$     | `\Leftrightarrow`     | 45   | $\rightleftharpoons$   | `\rightleftharpoons`   |
| 11   | $\nLeftrightarrow$    | `\nLeftrightarrow`    | 46   | $\leftrightharpoons$   | `\leftrightharpoons`   |
| 12   | $\Longleftrightarrow$ | `\Longleftrightarrow` | 47   | $\curvearrowleft$      | `\curvearrowleft`      |
| 13   | $\iff$                | `\iff`                | 48   | $\circlearrowleft$     | `\circlearrowleft`     |
| 14   | $\Uparrow$            | `\Uparrow`            | 49   | $\Lsh$                 | `\Lsh`                 |
| 15   | $\Downarrow$          | `\Downarrow`          | 50   | $\upuparrows$          | `\upuparrows`          |
| 16   | $\Updownarrow$        | `\Updownarrow`        | 51   | $\rightrightarrows$    | `\rightrightarrows`    |
| 17   | $\rightarrow$         | `\rightarrow`         | 52   | $\rightleftarrows$     | `\rightleftarrows`     |
| 18   | $\to$                 | `\to`                 | 53   | $\rightarrowtail$      | `\rightarrowtail`      |
| 19   | $\nrightarrow$        | `\nrightarrow`        | 54   | $\looparrowright$      | `\looparrowright`      |
| 20   | $\longrightarrow$     | `\longrightarrow`     | 55   | $\curvearrowright$     | `\curvearrowright`     |
| 21   | $\leftarrow$          | `\leftarrow`          | 56   | $\circlearrowright$    | `\circlearrowright`    |
| 22   | $\gets$               | `\gets`               | 57   | $\Rsh$                 | `\Rsh`                 |
| 23   | $\nleftarrow$         | `\nleftarrow`         | 58   | $\downdownarrows$      | `\downdownarrows`      |
| 24   | $\longleftarrow$      | `\longleftarrow`      | 59   | $\leftleftarrows$      | `\leftleftarrows`      |
| 25   | $\leftrightarrow$     | `\leftrightarrow`     | 60   | $\leftrightarrows$     | `\leftrightarrows`     |
| 26   | $\nleftrightarrow$    | `\nleftrightarrow`    | 61   | $\leftarrowtail$       | `\leftarrowtail`       |
| 27   | $\longleftrightarrow$ | `\longleftrightarrow` | 62   | $\looparrowleft$       | `\looparrowleft`       |
| 28   | $\uparrow$            | `\uparrow`            | 63   | $\hookrightarrow$      | `\hookrightarrow`      |
| 29   | $\downarrow$          | `\downarrow`          | 64   | $\hookleftarrow$       | `\hookleftarrow`       |
| 30   | $\updownarrow$        | `\updownarrow`        | 65   | $\multimap$            | `\multimap`            |
| 31   | $\nearrow$            | `\nearrow`            | 66   | $\leftrightsquigarrow$ | `\leftrightsquigarrow` |
| 32   | $\swarrow$            | `\swarrow`            | 67   | $\rightsquigarrow$     | `\rightsquigarrow`     |
| 33   | $\nwarrow$            | `\nwarrow`            | 68   | $\twoheadrightarrow$   | `\twoheadrightarrow`   |
| 34   | $\searrow$            | `\searrow`            | 69   | $\twoheadleftarrow$    | `\twoheadleftarrow`    |
| 35   | $\mapsto$             | `\mapsto`             |      |                        |                        |

## (10) 特殊符号

| 序号 | 符号             | LaTeX            | 序号 | 符号                | LaTeX               |
| :--- | :--------------- | :--------------- | :--- | :------------------ | :------------------ |
| 1    | $\infty$         | `\infty`         | 33   | $\flat$             | `\flat`             |
| 2    | $\aleph$         | `\aleph`         | 34   | $\natural$          | `\natural`          |
| 3    | $\complement$    | `\complement`    | 35   | $\sharp$            | `\sharp`            |
| 4    | $\backepsilon$   | `\backepsilon`   | 36   | $\diagup$           | `\diagup`           |
| 5    | $\eth$           | `\eth`           | 37   | $\diagdown$         | `\diagdown`         |
| 6    | $\Finv$          | `\Finv`          | 38   | $\centerdot$        | `\centerdot`        |
| 7    | $\hbar$          | `\hbar`          | 39   | $\ltimes$           | `\ltimes`           |
| 8    | $\Im$            | `\Im`            | 40   | $\rtimes$           | `\rtimes`           |
| 9    | $\imath$         | `\imath`         | 41   | $\leftthreetimes$   | `\leftthreetimes`   |
| 10   | $\jmath$         | `\jmath`         | 42   | $\rightthreetimes$  | `\rightthreetimes`  |
| 11   | $\Bbbk$          | `\Bbbk`          | 43   | $\eqcirc$           | `\eqcirc`           |
| 12   | $\ell$           | `\ell`           | 44   | $\circeq$           | `\circeq`           |
| 13   | $\mho$           | `\mho`           | 45   | $\triangleq$        | `\triangleq`        |
| 14   | $\wp$            | `\wp`            | 46   | $\bumpeq$           | `\bumpeq`           |
| 15   | $\Re$            | `\Re`            | 47   | $\Bumpeq$           | `\Bumpeq`           |
| 16   | $\circledS$      | `\circledS`      | 48   | $\doteqdot$         | `\doteqdot`         |
| 17   | $\amalg$         | `\amalg`         | 49   | $\risingdotseq$     | `\risingdotseq`     |
| 18   | $\%$             | `\%`             | 50   | $\fallingdotseq$    | `\fallingdotseq`    |
| 19   | $\dagger$        | `\dagger`        | 51   | $\intercal$         | `\intercal`         |
| 20   | $\ddagger$       | `\ddagger`       | 52   | $\barwedge$         | `\barwedge`         |
| 21   | $\ldots$         | `\ldots`         | 53   | $\veebar$           | `\veebar`           |
| 22   | $\cdots$         | `\cdots`         | 54   | $\doublebarwedge$   | `\doublebarwedge`   |
| 23   | $\smile$         | `\smile`         | 55   | $\between$          | `\between`          |
| 24   | $\frown$         | `\frown`         | 56   | $\pitchfork$        | `\pitchfork`        |
| 25   | $\wr$            | `\wr`            | 57   | $\vartriangleleft$  | `\vartriangleleft`  |
| 26   | $\triangleleft$  | `\triangleleft`  | 58   | $\ntriangleleft$    | `\ntriangleleft`    |
| 27   | $\triangleright$ | `\triangleright` | 59   | $\vartriangleright$ | `\vartriangleright` |
| 28   | $\diamondsuit$   | `\diamondsuit`   | 60   | $\ntriangleright$   | `\ntriangleright`   |
| 29   | $\heartsuit$     | `\heartsuit`     | 61   | $\trianglelefteq$   | `\trianglelefteq`   |
| 30   | $\clubsuit$      | `\clubsuit`      | 62   | $\ntrianglelefteq$  | `\ntrianglelefteq`  |
| 31   | $\spadesuit$     | `\spadesuit`     | 63   | $\trianglerighteq$  | `\trianglerighteq`  |
| 32   | $\Game$          | `\Game`          | 64   | $\ntrianglerighteq$ | `\ntrianglerighteq` |



## (11) 分数

| 类型               | 符号                                                                       | LaTeX                                                                      |
| :----------------- | -------------------------------------------------------------------------- | :------------------------------------------------------------------------- |
| 分数               | $\frac{2}{4}x=0.5x or {2 \over 4}x=0.5x$                                   | `\frac{2}{4}x=0.5x or {2 \over 4}x=0.5x`                                   |
| 小型分数           | $\tfrac{2}{4}x = 0.5x$                                                     | `\tfrac{2}{4}x = 0.5x`                                                     |
| 大型分数（不嵌套） | $\dfrac{2}{4} = 0.5 \qquad \dfrac{2}{c + \dfrac{2}{d + \dfrac{2}{4}}} = a$ | `\dfrac{2}{4} = 0.5 \qquad \dfrac{2}{c + \dfrac{2}{d + \dfrac{2}{4}}} = a` |
| 大型分数（嵌套）   | $\cfrac{2}{c + \cfrac{2}{d + \cfrac{2}{4}}} = a$                           | `\cfrac{2}{c + \cfrac{2}{d + \cfrac{2}{4}}} = a`                           |

## (12) 数值函数

| 符号                                                                               | LaTeX                                                                              |
| ---------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------- |
| $\exp_a b = a^b, \exp b = e^b, 10^m$                                               | `\exp_a b = a^b, \exp b = e^b, 10^m`                                               |
| $\ln c, \lg d = \log e, \log_{10} f$                                               | `\ln c, \lg d = \log e, \log_{10} f`                                               |
| $\sin a, \cos b, \tan c, \cot d, \sec e, \csc f$                                   | `\sin a, \cos b, \tan c, \cot d, \sec e, \csc f`                                   |
| $\arcsin a, \arccos b, \arctan c$                                                  | `\arcsin a, \arccos b, \arctan c`                                                  |
| $\operatorname{arccot} d, \operatorname{arcsec} e, \operatorname{arccsc} f$        | `\operatorname{arccot} d, \operatorname{arcsec} e, \operatorname{arccsc} f`        |
| $\sinh a, \cosh b, \tanh c, \coth d$                                               | `\sinh a, \cosh b, \tanh c, \coth d`                                               |
| $\operatorname{sh}k, \operatorname{ch}l, \operatorname{th}m, \operatorname{coth}n$ | `\operatorname{sh}k, \operatorname{ch}l, \operatorname{th}m, \operatorname{coth}n` |
| $\operatorname{argsh}o, \operatorname{argch}p, \operatorname{argth}q$              | `\operatorname{argsh}o, \operatorname{argch}p, \operatorname{argth}q`              |
| $\operatorname{sgn}r, \left\vert s \right\vert$                                    | `\operatorname{sgn}r, \left\vert s \right\vert`                                    |
| $\min(x,y), \max(x,y)$                                                             | `\min(x,y), \max(x,y)`             


如果需要使用特殊的函数符号，那么可以采用 `\operatorname{}` 命令进行自定义：

| 符号                       | LaTeX                      |
| :------------------------- | :------------------------- |
| $\operatorname{mydefine}x$ | `\operatorname{mydefine}x` |


## (13) 根式

| 符号         | LaTeX        | 符号                           | LaTeX                          |
| :----------- | :----------- | :----------------------------- | :----------------------------- |
| $\surd$      | `\surd`      | $\sqrt[n]{\pi}$                | `\sqrt[n]{\pi}`                |
| $\sqrt{\pi}$ | `\sqrt{\pi}` | $\sqrt[3]{\frac{x^3+y^3}{2}}*$ | `\sqrt[3]{\frac{x^3+y^3}{2}}*` |


## (14) 微积分,导数,模,极限,范围

| 符号                                                                                                                           | LaTeX                                                                                                                          |
| ------------------------------------------------------------------------------------------------------------------------------ | :----------------------------------------------------------------------------------------------------------------------------- |
| $dt, \mathrm{d}t, \partial t, \nabla\psi$                                                                                      | `dt, \mathrm{d}t, \partial t, \nabla\psi`                                                                                      |
| $dy/dx, \mathrm{d}y/\mathrm{d}x, \frac{dy}{dx}, \frac{\mathrm{d}y}{\mathrm{d}x}, \frac{\partial^2}{\partial x_1\partial x_2}y$ | `dy/dx, \mathrm{d}y/\mathrm{d}x, \frac{dy}{dx}, \frac{\mathrm{d}y}{\mathrm{d}x}, \frac{\partial^2}{\partial x_1\partial x_2}y` |
| $\prime, \backprime, f^\prime, f', f'', f^{(3)}, \dot y, \ddot y$                                                              | `\prime, \backprime, f^\prime, f', f'', f^{(3)}, \dot y, \ddot y`                                                              |
| $s_k \equiv 0 \pmod{m}$                                                                                                        | `s_k \equiv 0 \pmod{m}`                                                                                                        |
| $a \bmod b$                                                                                                                    | `a \bmod b`                                                                                                                    |
| $\gcd(m, n), \operatorname{lcm}(m, n)$                                                                                         | `\gcd(m, n), \operatorname{lcm}(m, n)`                                                                                         |
| $\mid, \nmid, \shortmid, \nshortmid$                                                                                           | `\mid, \nmid, \shortmid, \nshortmid`                                                                                           |
| $\lim_{n \to \infty}x_n$                                                                                                       | `\lim_{n \to \infty}x_n`                                                                                                       |
| $\textstyle \lim_{n \to \infty}x_n$                                                                                            | `\textstyle \lim_{n \to \infty}x_n`                                                                                            |
| $\min x, \max y, \inf s, \sup t$                                                                                               | `\min x, \max y, \inf s, \sup t`                                                                                               |
| $\lim u, \liminf v, \limsup w$                                                                                                 | `\lim u, \liminf v, \limsup w`                                                                                                 |
| $\dim p, \deg q, \det m, \ker\phi$                                                                                             | `\dim p, \deg q, \det m, \ker\phi`                                                                                             |
| $\Pr j, \hom l, \lVert z \rVert, \arg z$                                                                                       | `\Pr j, \hom l, \lVert z \rVert, \arg z`                                                                                       |
| $\int\limits_{1}^{3}\frac{e^3/x}{x^2}\, dx$                                                                                    | `\int\limits_{1}^{3}\frac{e^3/x}{x^2}\, dx`                                                                                    |
| $\int_{1}^{3}\frac{e^3/x}{x^2}\, dx$                                                                                           | `\int_{1}^{3}\frac{e^3/x}{x^2}\, dx`                                                                                           |
| $\textstyle \int\limits_{-N}^{N} e^x dx$                                                                                       | `\textstyle \int\limits_{-N}^{N} e^x dx`                                                                                       |
| $\textstyle \int_{-N}^{N} e^x dx$                                                                                              | `\textstyle \int_{-N}^{N} e^x dx`                                                                                              |
| $\iint\limits_D dx\,dy$                                                                                                        | `\iint\limits_D dx\,dy`                                                                                                        |
| $\iiint\limits_E dx\,dy\,dz$                                                                                                   | `\iiint\limits_E dx\,dy\,dz`                                                                                                   |
| $\int_{(x,y)\in C} x^3\, dx + 4y^2\, dy$                                                                                       | `\int_{(x,y)\in C} x^3\, dx + 4y^2\, dy`                                                                                       |
| $\oint_{(x,y)\in C} x^3\, dx + 4y^2\, dy$                                                                                      | `\oint_{(x,y)\in C} x^3\, dx + 4y^2\, dy`                                                                                      |

> 注意：积分符号采用 `\int\_{}^{}` 命令调用，双重积分符号采用 `\iint\_{}^{}`，以此类推，最高可以支持四重积分 (我测试的是三重啊?)。

## (15) 大型运算符

| 分类   | 符号                | LaTeX               | 符号                           | LaTeX                          |
| :----- | :------------------ | :------------------ | :----------------------------- | :----------------------------- |
| 求和   | $\sum_{a}^{b}$      | `\sum_{a}^{b}`      | $\textstyle \sum_{a}^{b}$      | `\textstyle \sum_{a}^{b}`      |
| 连乘积 | $\prod_{a}^{b}$     | `\prod_{a}^{b}`     | $\textstyle \prod_{a}^{b}$     | `\textstyle \prod_{a}^{b}`     |
| 余积   | $\coprod_{a}^{b}$   | `\coprod_{a}^{b}`   | $\textstyle \coprod_{a}^{b}$   | `\textstyle \coprod_{a}^{b}`   |
| 并集   | $\bigcup_{a}^{b}$   | `\bigcup_{a}^{b}`   | $\textstyle \bigcup_{a}^{b}$   | `\textstyle \bigcup_{a}^{b}`   |
| 交集   | $\bigcap_{a}^{b}$   | `\bigcap_{a}^{b}`   | $\textstyle \bigcap_{a}^{b}$   | `\textstyle \bigcap_{a}^{b}`   |
| 析取   | $\bigvee_{a}^{b}$   | `\bigvee_{a}^{b}`   | $\textstyle \bigvee_{a}^{b}$   | `\textstyle \bigvee_{a}^{b}`   |
| 合取   | $\bigwedge_{a}^{b}$ | `\bigwedge_{a}^{b}` | $\textstyle \bigwedge_{a}^{b}$ | `\textstyle \bigwedge_{a}^{b}` |


## (16) 上下标

| 类型                 | 符号                                                                                                                                   | LaTeX                                                                                                                                        |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| 上标                 | $a^2$~~~<br>~~~$a^{x+3}$                                                                                                                     | `a^2`~~~<br>~~~`a^{x+3}`                                                                                                                           |
| 下标                 | $a_2$                                                                                                                                  | `a_2`                                                                                                                                        |
| 组合                 | $10^{30} a^{2+2}$~~~<br>~~~$a_{i,j} b_{f'}$                                                                                                  | `10^{30} a^{2+2}`~~~<br>~~~`a_{i,j} b_{f'}`                                                                                                        |
| 上下标               | $x_2^3$ ~~~<br>~~~ ${x_2}^3$                                                                                                                 | `x_2^3` ~~~<br>~~~ `{x_2}^3`                                                                                                                       |
| 上标的上标           | $10^{10^{8}}$                                                                                                                          | `10^{10^{8}}`                                                                                                                                |
| 混合标识             | ${}_1^2!\Omega_3^4$                                                                                                                    | `{}_1^2!\Omega_3^4`                                                                                                                          |
| 顶标底标             | $\overset{\alpha}{\omega}$,$\underset{\alpha}{\omega}$,$\overset{\alpha}{\underset{\gamma}{\omega}}$,$\stackrel{\alpha}{\omega}$       | `\overset{\alpha}{\omega}`,~~~<br>~~~`\underset{\alpha}{\omega}`,~~~<br>~~~`\overset{\alpha}{\underset{\gamma}{\omega}}`,~~~<br>~~~`\stackrel{\alpha}{\omega}` |
| 导数                 | $x', y'', f', f'' x^\prime, y^{\prime\prime}$                                                                                          | `x', y'', f', f'' x^\prime, y^{\prime\prime}`                                                                                                |
| 导数点               | $\dot{x}, \ddot{x}$                                                                                                                    | `\dot{x}, \ddot{x}`                                                                                                                          |
| 上下划线与向量       | $\hat a \ \bar b \ \vec c$~~~<br>~~~$\overrightarrow{a b} \ \overleftarrow{c d} \ \widehat{d e f}$~~~<br>~~~$\overline{g h i} \ \underline{j k l}$ | `\hat a \ \bar b \ \vec c`~~~<br>~~~`\overrightarrow{a b} \ \overleftarrow{c d} \ \widehat{d e f}`~~~<br>~~~`\overline{g h i} \ \underline{j k l}`       |
| 弧度                 | $\overset{\frown} {AB}$                                                                                                                | `\overset{\frown} {AB}`                                                                                                                      |
| 箭头                 | $A \xleftarrow{n+\mu-1} B \xrightarrow[T]{n\pm i-1} C$                                                                                 | `A \xleftarrow{n+\mu-1} B \xrightarrow[T]{n\pm i-1} C`                                                                                       |
| 大括号               | $\overbrace{ 1+2+\cdots+100 }^{5050}$                                                                                                  | `\overbrace{ 1+2+\cdots+100 }^{5050}`                                                                                                        |
| 底部大括号           | $\underbrace{ a+b+\cdots+z }_{26}$                                                                                                     | `\underbrace{ a+b+\cdots+z }_{26}`                                                                                                           |
| 求和运算             | $\sum_{k=1}^N k^2$                                                                                                                     | `\sum_{k=1}^N k^2`                                                                                                                           |
| 文本模式下的求和运算 | $\textstyle \sum_{k=1}^N k^2$                                                                                                          | `\textstyle \sum_{k=1}^N k^2`                                                                                                                |
| 分式中的求和运算     | $\frac{\sum_{k=1}^N k^2}{a}$                                                                                                           | `\frac{\sum_{k=1}^N k^2}{a}`                                                                                                                 |
| 分式中的求和运算     | $\frac{\displaystyle \sum_{k=1}^N k^2}{a}$                                                                                             | `\frac{\displaystyle \sum_{k=1}^N k^2}{a}`                                                                                                   |
| 分式中的求和运算     | $\frac{\sum\limits^{^N}_{k=1} k^2}{a}$                                                                                                 | `\frac{\sum\limits^{^N}_{k=1} k^2}{a}`                                                                                                       |
| 乘积运算             | $\prod_{i=1}^N x_i$                                                                                                                    | `\prod_{i=1}^N x_i`                                                                                                                          |
| 乘积运算             | $\textstyle \prod_{i=1}^N x_i$                                                                                                         | `\textstyle \prod_{i=1}^N x_i`                                                                                                               |
| 副乘运算             | $\coprod_{i=1}^N x_i$                                                                                                                  | `\coprod_{i=1}^N x_i`                                                                                                                        |
| 副乘运算             | $\textstyle \coprod_{i=1}^N x_i$                                                                                                       | `\textstyle \coprod_{i=1}^N x_i`                                                                                                             |
| 极限                 | $\lim_{n \to \infty}x_n$                                                                                                               | `\lim_{n \to \infty}x_n`                                                                                                                     |
| 极限                 | $\textstyle \lim_{n \to \infty}x_n$                                                                                                    | `\textstyle \lim_{n \to \infty}x_n`                                                                                                          |
| 积分                 | $\int\limits_{1}^{3}\frac{e^3/x}{x^2}\, dx$                                                                                            | `\int\limits_{1}^{3}\frac{e^3/x}{x^2}\, dx`                                                                                                  |
| 积分                 | $\int_{1}^{3}\frac{e^3/x}{x^2}\, dx$                                                                                                   | `\int_{1}^{3}\frac{e^3/x}{x^2}\, dx`                                                                                                         |
| 积分                 | $\textstyle \int\limits_{-N}^{N} e^x dx$                                                                                               | `\textstyle \int\limits_{-N}^{N} e^x dx`                                                                                                     |
| 积分                 | $\textstyle \int_{-N}^{N} e^x dx$                                                                                                      | `\textstyle \int_{-N}^{N} e^x dx`                                                                                                            |
| 双重积分             | $\iint\limits_D dx\,dy$                                                                                                                | `\iint\limits_D dx\,dy`                                                                                                                      |
| 三重积分             | $\iiint\limits_E dx\,dy\,dz$                                                                                                           | `\iiint\limits_E dx\,dy\,dz`                                                                                                                 |
| 四重积分             | Vscode中好像不支持四重                                                                                                                 | `\iiiint\limits_F dx\,dy\,dz\,dt`                                                                                                            |
| 路径积分             | $\int_{(x,y)\in C} x^3\, dx + 4y^2\, dy$                                                                                               | `\int_{(x,y)\in C} x^3\, dx + 4y^2\, dy`                                                                                                     |
| 环路积分             | $\oint_{(x,y)\in C} x^3\, dx + 4y^2\, dy$                                                                                              | `\oint_{(x,y)\in C} x^3\, dx + 4y^2\, dy`                                                                                                    |
| 交集                 | $\bigcap_{i=1}^n E_i$                                                                                                                  | `\bigcap_{i=1}^n E_i`                                                                                                                        |
| 并集                 | $\bigcup_{i=1}^n E_i$                                                                                                                  | `\bigcup_{i=1}^n E_i`                                                                                                                        |


## (17) 二项式系数

| 类型           | 符号            | LaTeX           |
| :------------- | :-------------- | :-------------- |
| 二项式系数     | $\binom{n}{k}$ | `\binom{n}{k}` |
| 小型二项式系数 | $\tbinom{n}{k}$ | `\tbinom{n}{k}` |
| 大型二项式系数 | $\dbinom{n}{k}$ | `\dbinom{n}{k}` |


## (18) 矩阵

~~~

<table>
    <tbody>
    <tr>
        <th>&#x7B26;&#x53F7;</th>
        <th>LaTeX</th>
    </tr>
    <tr>
        <td>
        <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                    xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                    <semantics>
                    <mtable rowspacing="0.16em" columnalign="center center" columnspacing="1em">
                        <mtr>
                        <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                            <mi>x</mi>
                            </mstyle>
                        </mtd>
                        <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                            <mi>y</mi>
                            </mstyle>
                        </mtd>
                        </mtr>
                        <mtr>
                        <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                            <mi>z</mi>
                            </mstyle>
                        </mtd>
                        <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                            <mi>v</mi>
                            </mstyle>
                        </mtd>
                        </mtr>
                    </mtable>
                    <annotation encoding="application/x-tex">\begin{matrix}
                        x &amp; y \\
                        z &amp; v
                        \end{matrix}
                    </annotation>
                    </semantics>
                </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                    style="height:2.4em;vertical-align:-0.95em;"></span><span class="mord"><span
                        class="mtable"><span class="col-align-c"><span class="vlist-t vlist-t2"><span
                            class="vlist-r"><span class="vlist" style="height:1.45em;"><span
                                style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal">x</span></span></span><span
                                style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal"
                                    style="margin-right:0.04398em;">z</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span><span
                        class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep"
                        style="width:0.5em;"></span><span class="col-align-c"><span class="vlist-t vlist-t2"><span
                            class="vlist-r"><span class="vlist" style="height:1.45em;"><span
                                style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal"
                                    style="margin-right:0.03588em;">y</span></span></span><span
                                style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal"
                                    style="margin-right:0.03588em;">v</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span></span></span></span></span></span></span>
        </p>
        </td>
        <td>
        <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-matrix">matrix</span><span class="token punctuation">}</span>
x <span class="token punctuation">&amp;</span> y <span class="token function selector">\\</span>
z <span class="token punctuation">&amp;</span> v
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-matrix">matrix</span><span class="token punctuation">}</span>
</pre>
        </td>
    </tr>
    <tr>
        <td>
        <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                    xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                    <semantics>
                    <mrow>
                        <mo fence="true">&#x2223;</mo>
                        <mtable rowspacing="0.16em" columnalign="center center" columnspacing="1em">
                        <mtr>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>x</mi>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>y</mi>
                            </mstyle>
                            </mtd>
                        </mtr>
                        <mtr>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>z</mi>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>v</mi>
                            </mstyle>
                            </mtd>
                        </mtr>
                        </mtable>
                        <mo fence="true">&#x2223;</mo>
                    </mrow>
                    <annotation encoding="application/x-tex">\begin{vmatrix}
                        x &amp; y \\
                        z &amp; v
                        \end{vmatrix}
                    </annotation>
                    </semantics>
                </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                    style="height:2.412em;vertical-align:-0.95em;"></span><span class="minner"><span
                        class="mopen"><span class="delimsizing mult"><span class="vlist-t vlist-t2"><span
                            class="vlist-r"><span class="vlist" style="height:1.462em;"><span
                                style="top:-2.266em;"><span class="pstrut" style="height:3.216em;"></span><span
                                    class="delimsizinginner delim-size1"><span>&#x2223;</span></span></span><span
                                style="top:-2.864em;"><span class="pstrut" style="height:3.216em;"></span><span
                                    style="height:1.216em;width:0.3333em;"><svg xmlns="http://www.w3.org/2000/svg"
                                    width="0.3333em" height="1.216em" style="width:0.3333em"
                                    viewBox="0 0 333.33000000000004 1216" preserveAspectRatio="xMinYMin">
                                    <path d="M145 0 H188 V1216 H145z M145 0 H188 V1216 H145z" />
                                    </svg></span></span><span style="top:-4.072em;"><span class="pstrut"
                                    style="height:3.216em;"></span><span
                                    class="delimsizinginner delim-size1"><span>&#x2223;</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span></span><span
                        class="mord"><span class="mtable"><span class="col-align-c"><span
                            class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                                style="height:1.45em;"><span style="top:-3.61em;"><span class="pstrut"
                                    style="height:3em;"></span><span class="mord"><span
                                        class="mord mathnormal">x</span></span></span><span style="top:-2.41em;"><span
                                    class="pstrut" style="height:3em;"></span><span class="mord"><span
                                        class="mord mathnormal"
                                        style="margin-right:0.04398em;">z</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span><span
                            class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep"
                            style="width:0.5em;"></span><span class="col-align-c"><span class="vlist-t vlist-t2"><span
                                class="vlist-r"><span class="vlist" style="height:1.45em;"><span
                                    style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal"
                                        style="margin-right:0.03588em;">y</span></span></span><span
                                    style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal"
                                        style="margin-right:0.03588em;">v</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span></span></span><span
                        class="mclose"><span class="delimsizing mult"><span class="vlist-t vlist-t2"><span
                            class="vlist-r"><span class="vlist" style="height:1.462em;"><span
                                style="top:-2.266em;"><span class="pstrut" style="height:3.216em;"></span><span
                                    class="delimsizinginner delim-size1"><span>&#x2223;</span></span></span><span
                                style="top:-2.864em;"><span class="pstrut" style="height:3.216em;"></span><span
                                    style="height:1.216em;width:0.3333em;"><svg xmlns="http://www.w3.org/2000/svg"
                                    width="0.3333em" height="1.216em" style="width:0.3333em"
                                    viewBox="0 0 333.33000000000004 1216" preserveAspectRatio="xMinYMin">
                                    <path d="M145 0 H188 V1216 H145z M145 0 H188 V1216 H145z" />
                                    </svg></span></span><span style="top:-4.072em;"><span class="pstrut"
                                    style="height:3.216em;"></span><span
                                    class="delimsizinginner delim-size1"><span>&#x2223;</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span></span></span></span></span></span></span>
        </p>
        </td>
        <td>
        <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-vmatrix">vmatrix</span><span class="token punctuation">}</span>
x <span class="token punctuation">&amp;</span> y <span class="token function selector">\\</span>
z <span class="token punctuation">&amp;</span> v
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-vmatrix">vmatrix</span><span class="token punctuation">}</span>
</pre>
        </td>
    </tr>
    <tr>
        <td>
        <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                    xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                    <semantics>
                    <mrow>
                        <mo fence="true">&#x2225;</mo>
                        <mtable rowspacing="0.16em" columnalign="center center" columnspacing="1em">
                        <mtr>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>x</mi>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>y</mi>
                            </mstyle>
                            </mtd>
                        </mtr>
                        <mtr>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>z</mi>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>v</mi>
                            </mstyle>
                            </mtd>
                        </mtr>
                        </mtable>
                        <mo fence="true">&#x2225;</mo>
                    </mrow>
                    <annotation encoding="application/x-tex">\begin{Vmatrix}
                        x &amp; y \\
                        z &amp; v
                        \end{Vmatrix}
                    </annotation>
                    </semantics>
                </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                    style="height:2.412em;vertical-align:-0.95em;"></span><span class="minner"><span
                        class="mopen"><span class="delimsizing mult"><span class="vlist-t vlist-t2"><span
                            class="vlist-r"><span class="vlist" style="height:1.462em;"><span
                                style="top:-2.266em;"><span class="pstrut" style="height:3.216em;"></span><span
                                    class="delimsizinginner delim-size1"><span>&#x2225;</span></span></span><span
                                style="top:-2.864em;"><span class="pstrut" style="height:3.216em;"></span><span
                                    style="height:1.216em;width:0.5556em;"><svg xmlns="http://www.w3.org/2000/svg"
                                    width="0.5556em" height="1.216em" style="width:0.5556em"
                                    viewBox="0 0 555.5600000000001 1216" preserveAspectRatio="xMinYMin">
                                    <path
                                        d="M145 0 H188 V1216 H145z M145 0 H188 V1216 H145zM367 0 H410 V1216 H367z M367 0 H410 V1216 H367z" />
                                    </svg></span></span><span style="top:-4.072em;"><span class="pstrut"
                                    style="height:3.216em;"></span><span
                                    class="delimsizinginner delim-size1"><span>&#x2225;</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span></span><span
                        class="mord"><span class="mtable"><span class="col-align-c"><span
                            class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                                style="height:1.45em;"><span style="top:-3.61em;"><span class="pstrut"
                                    style="height:3em;"></span><span class="mord"><span
                                        class="mord mathnormal">x</span></span></span><span style="top:-2.41em;"><span
                                    class="pstrut" style="height:3em;"></span><span class="mord"><span
                                        class="mord mathnormal"
                                        style="margin-right:0.04398em;">z</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span><span
                            class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep"
                            style="width:0.5em;"></span><span class="col-align-c"><span class="vlist-t vlist-t2"><span
                                class="vlist-r"><span class="vlist" style="height:1.45em;"><span
                                    style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal"
                                        style="margin-right:0.03588em;">y</span></span></span><span
                                    style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal"
                                        style="margin-right:0.03588em;">v</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span></span></span><span
                        class="mclose"><span class="delimsizing mult"><span class="vlist-t vlist-t2"><span
                            class="vlist-r"><span class="vlist" style="height:1.462em;"><span
                                style="top:-2.266em;"><span class="pstrut" style="height:3.216em;"></span><span
                                    class="delimsizinginner delim-size1"><span>&#x2225;</span></span></span><span
                                style="top:-2.864em;"><span class="pstrut" style="height:3.216em;"></span><span
                                    style="height:1.216em;width:0.5556em;"><svg xmlns="http://www.w3.org/2000/svg"
                                    width="0.5556em" height="1.216em" style="width:0.5556em"
                                    viewBox="0 0 555.5600000000001 1216" preserveAspectRatio="xMinYMin">
                                    <path
                                        d="M145 0 H188 V1216 H145z M145 0 H188 V1216 H145zM367 0 H410 V1216 H367z M367 0 H410 V1216 H367z" />
                                    </svg></span></span><span style="top:-4.072em;"><span class="pstrut"
                                    style="height:3.216em;"></span><span
                                    class="delimsizinginner delim-size1"><span>&#x2225;</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span></span></span></span></span></span></span>
        </p>
        </td>
        <td>
        <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-Vmatrix">Vmatrix</span><span class="token punctuation">}</span>
x <span class="token punctuation">&amp;</span> y <span class="token function selector">\\</span>
z <span class="token punctuation">&amp;</span> v
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-Vmatrix">Vmatrix</span><span class="token punctuation">}</span>
</pre>
        </td>
    </tr>
    <tr>
        <td>
        <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                    xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                    <semantics>
                    <mrow>
                        <mo fence="true">[</mo>
                        <mtable rowspacing="0.16em" columnalign="center center center" columnspacing="1em">
                        <mtr>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mn>0</mn>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mo lspace="0em" rspace="0em">&#x22EF;</mo>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mn>0</mn>
                            </mstyle>
                            </mtd>
                        </mtr>
                        <mtr>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>
                                <mi mathvariant="normal">&#x22EE;</mi>
                                <mpadded height="0em" voffset="0em">
                                    <mspace mathbackground="black" width="0em" height="1.5em"></mspace>
                                </mpadded>
                                </mi>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mo lspace="0em" rspace="0em">&#x22F1;</mo>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>
                                <mi mathvariant="normal">&#x22EE;</mi>
                                <mpadded height="0em" voffset="0em">
                                    <mspace mathbackground="black" width="0em" height="1.5em"></mspace>
                                </mpadded>
                                </mi>
                            </mstyle>
                            </mtd>
                        </mtr>
                        <mtr>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mn>0</mn>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mo lspace="0em" rspace="0em">&#x22EF;</mo>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mn>0</mn>
                            </mstyle>
                            </mtd>
                        </mtr>
                        </mtable>
                        <mo fence="true">]</mo>
                    </mrow>
                    <annotation encoding="application/x-tex">\begin{bmatrix}
                        0 &amp; \cdots &amp; 0 \\
                        \vdots &amp; \ddots &amp; \vdots \\
                        0 &amp; \cdots &amp; 0
                        \end{bmatrix}
                    </annotation>
                    </semantics>
                </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                    style="height:4.26em;vertical-align:-1.88em;"></span><span class="minner"><span
                        class="mopen"><span class="delimsizing mult"><span class="vlist-t vlist-t2"><span
                            class="vlist-r"><span class="vlist" style="height:2.35em;"><span
                                style="top:-1.95em;"><span class="pstrut" style="height:3.155em;"></span><span
                                    class="delimsizinginner delim-size4"><span>&#x23A3;</span></span></span><span
                                style="top:-3.097em;"><span class="pstrut" style="height:3.155em;"></span><span
                                    style="height:0.616em;width:0.6667em;"><svg xmlns="http://www.w3.org/2000/svg"
                                    width="0.6667em" height="0.616em" style="width:0.6667em"
                                    viewBox="0 0 666.67 616" preserveAspectRatio="xMinYMin">
                                    <path d="M319 0 H403 V616 H319z M319 0 H403 V616 H319z" />
                                    </svg></span></span><span style="top:-4.35em;"><span class="pstrut"
                                    style="height:3.155em;"></span><span
                                    class="delimsizinginner delim-size4"><span>&#x23A1;</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:1.85em;"><span></span></span></span></span></span></span><span
                        class="mord"><span class="mtable"><span class="col-align-c"><span
                            class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                                style="height:2.38em;"><span style="top:-5.2275em;"><span class="pstrut"
                                    style="height:3.6875em;"></span><span class="mord"><span
                                        class="mord">0</span></span></span><span style="top:-3.3675em;"><span
                                    class="pstrut" style="height:3.6875em;"></span><span class="mord"><span
                                        class="mord"><span class="mord">&#x22EE;</span><span class="mord rule"
                                        style="border-right-width:0em;border-top-width:1.5em;bottom:0em;"></span></span></span></span><span
                                    style="top:-2.1675em;"><span class="pstrut" style="height:3.6875em;"></span><span
                                    class="mord"><span class="mord">0</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:1.88em;"><span></span></span></span></span></span><span
                            class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep"
                            style="width:0.5em;"></span><span class="col-align-c"><span class="vlist-t vlist-t2"><span
                                class="vlist-r"><span class="vlist" style="height:2.38em;"><span
                                    style="top:-5.04em;"><span class="pstrut" style="height:3.5em;"></span><span
                                    class="mord"><span class="minner">&#x22EF;</span></span></span><span
                                    style="top:-3.18em;"><span class="pstrut" style="height:3.5em;"></span><span
                                    class="mord"><span class="minner">&#x22F1;</span></span></span><span
                                    style="top:-1.98em;"><span class="pstrut" style="height:3.5em;"></span><span
                                    class="mord"><span class="minner">&#x22EF;</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:1.88em;"><span></span></span></span></span></span><span
                            class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep"
                            style="width:0.5em;"></span><span class="col-align-c"><span class="vlist-t vlist-t2"><span
                                class="vlist-r"><span class="vlist" style="height:2.38em;"><span
                                    style="top:-5.2275em;"><span class="pstrut" style="height:3.6875em;"></span><span
                                    class="mord"><span class="mord">0</span></span></span><span
                                    style="top:-3.3675em;"><span class="pstrut" style="height:3.6875em;"></span><span
                                    class="mord"><span class="mord"><span class="mord">&#x22EE;</span><span
                                        class="mord rule"
                                        style="border-right-width:0em;border-top-width:1.5em;bottom:0em;"></span></span></span></span><span
                                    style="top:-2.1675em;"><span class="pstrut" style="height:3.6875em;"></span><span
                                    class="mord"><span class="mord">0</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:1.88em;"><span></span></span></span></span></span></span></span><span
                        class="mclose"><span class="delimsizing mult"><span class="vlist-t vlist-t2"><span
                            class="vlist-r"><span class="vlist" style="height:2.35em;"><span
                                style="top:-1.95em;"><span class="pstrut" style="height:3.155em;"></span><span
                                    class="delimsizinginner delim-size4"><span>&#x23A6;</span></span></span><span
                                style="top:-3.097em;"><span class="pstrut" style="height:3.155em;"></span><span
                                    style="height:0.616em;width:0.6667em;"><svg xmlns="http://www.w3.org/2000/svg"
                                    width="0.6667em" height="0.616em" style="width:0.6667em"
                                    viewBox="0 0 666.67 616" preserveAspectRatio="xMinYMin">
                                    <path d="M263 0 H347 V616 H263z M263 0 H347 V616 H263z" />
                                    </svg></span></span><span style="top:-4.35em;"><span class="pstrut"
                                    style="height:3.155em;"></span><span
                                    class="delimsizinginner delim-size4"><span>&#x23A4;</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:1.85em;"><span></span></span></span></span></span></span></span></span></span></span></span>
        </p>
        </td>
        <td>
        <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-bmatrix">bmatrix</span><span class="token punctuation">}</span>
0 <span class="token punctuation">&amp;</span> <span class="token function selector">\cdots</span> <span class="token punctuation">&amp;</span> 0 <span class="token function selector">\\</span>
<span class="token function selector">\vdots</span> <span class="token punctuation">&amp;</span> <span class="token function selector">\ddots</span> <span class="token punctuation">&amp;</span> <span class="token function selector">\vdots</span> <span class="token function selector">\\</span>
0 <span class="token punctuation">&amp;</span> <span class="token function selector">\cdots</span> <span class="token punctuation">&amp;</span> 0
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-bmatrix">bmatrix</span><span class="token punctuation">}</span>
</pre>
        </td>
    </tr>
    <tr>
        <td>
        <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                    xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                    <semantics>
                    <mrow>
                        <mo fence="true">{</mo>
                        <mtable rowspacing="0.16em" columnalign="center center" columnspacing="1em">
                        <mtr>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>x</mi>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>y</mi>
                            </mstyle>
                            </mtd>
                        </mtr>
                        <mtr>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>z</mi>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>v</mi>
                            </mstyle>
                            </mtd>
                        </mtr>
                        </mtable>
                        <mo fence="true">}</mo>
                    </mrow>
                    <annotation encoding="application/x-tex">\begin{Bmatrix}
                        x &amp; y \\
                        z &amp; v
                        \end{Bmatrix}
                    </annotation>
                    </semantics>
                </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                    style="height:2.4em;vertical-align:-0.95em;"></span><span class="minner"><span
                        class="mopen delimcenter" style="top:0em;"><span
                        class="delimsizing size3">{</span></span><span class="mord"><span class="mtable"><span
                            class="col-align-c"><span class="vlist-t vlist-t2"><span class="vlist-r"><span
                                class="vlist" style="height:1.45em;"><span style="top:-3.61em;"><span class="pstrut"
                                    style="height:3em;"></span><span class="mord"><span
                                        class="mord mathnormal">x</span></span></span><span style="top:-2.41em;"><span
                                    class="pstrut" style="height:3em;"></span><span class="mord"><span
                                        class="mord mathnormal"
                                        style="margin-right:0.04398em;">z</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span><span
                            class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep"
                            style="width:0.5em;"></span><span class="col-align-c"><span class="vlist-t vlist-t2"><span
                                class="vlist-r"><span class="vlist" style="height:1.45em;"><span
                                    style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal"
                                        style="margin-right:0.03588em;">y</span></span></span><span
                                    style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal"
                                        style="margin-right:0.03588em;">v</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span></span></span><span
                        class="mclose delimcenter" style="top:0em;"><span
                        class="delimsizing size3">}</span></span></span></span></span></span></span></p>
        </td>
        <td>
        <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-Bmatrix">Bmatrix</span><span class="token punctuation">}</span>
x <span class="token punctuation">&amp;</span> y <span class="token function selector">\\</span>
z <span class="token punctuation">&amp;</span> v
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-Bmatrix">Bmatrix</span><span class="token punctuation">}</span>
</pre>
        </td>
    </tr>
    <tr>
        <td>
        <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                    xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                    <semantics>
                    <mrow>
                        <mo fence="true">&#x2225;</mo>
                        <mtable rowspacing="0.16em" columnalign="center center" columnspacing="1em">
                        <mtr>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>x</mi>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>y</mi>
                            </mstyle>
                            </mtd>
                        </mtr>
                        <mtr>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>z</mi>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>v</mi>
                            </mstyle>
                            </mtd>
                        </mtr>
                        </mtable>
                        <mo fence="true">&#x2225;</mo>
                    </mrow>
                    <annotation encoding="application/x-tex">\begin{Vmatrix}
                        x &amp; y \\
                        z &amp; v
                        \end{Vmatrix}
                    </annotation>
                    </semantics>
                </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                    style="height:2.412em;vertical-align:-0.95em;"></span><span class="minner"><span
                        class="mopen"><span class="delimsizing mult"><span class="vlist-t vlist-t2"><span
                            class="vlist-r"><span class="vlist" style="height:1.462em;"><span
                                style="top:-2.266em;"><span class="pstrut" style="height:3.216em;"></span><span
                                    class="delimsizinginner delim-size1"><span>&#x2225;</span></span></span><span
                                style="top:-2.864em;"><span class="pstrut" style="height:3.216em;"></span><span
                                    style="height:1.216em;width:0.5556em;"><svg xmlns="http://www.w3.org/2000/svg"
                                    width="0.5556em" height="1.216em" style="width:0.5556em"
                                    viewBox="0 0 555.5600000000001 1216" preserveAspectRatio="xMinYMin">
                                    <path
                                        d="M145 0 H188 V1216 H145z M145 0 H188 V1216 H145zM367 0 H410 V1216 H367z M367 0 H410 V1216 H367z" />
                                    </svg></span></span><span style="top:-4.072em;"><span class="pstrut"
                                    style="height:3.216em;"></span><span
                                    class="delimsizinginner delim-size1"><span>&#x2225;</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span></span><span
                        class="mord"><span class="mtable"><span class="col-align-c"><span
                            class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                                style="height:1.45em;"><span style="top:-3.61em;"><span class="pstrut"
                                    style="height:3em;"></span><span class="mord"><span
                                        class="mord mathnormal">x</span></span></span><span style="top:-2.41em;"><span
                                    class="pstrut" style="height:3em;"></span><span class="mord"><span
                                        class="mord mathnormal"
                                        style="margin-right:0.04398em;">z</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span><span
                            class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep"
                            style="width:0.5em;"></span><span class="col-align-c"><span class="vlist-t vlist-t2"><span
                                class="vlist-r"><span class="vlist" style="height:1.45em;"><span
                                    style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal"
                                        style="margin-right:0.03588em;">y</span></span></span><span
                                    style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal"
                                        style="margin-right:0.03588em;">v</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span></span></span><span
                        class="mclose"><span class="delimsizing mult"><span class="vlist-t vlist-t2"><span
                            class="vlist-r"><span class="vlist" style="height:1.462em;"><span
                                style="top:-2.266em;"><span class="pstrut" style="height:3.216em;"></span><span
                                    class="delimsizinginner delim-size1"><span>&#x2225;</span></span></span><span
                                style="top:-2.864em;"><span class="pstrut" style="height:3.216em;"></span><span
                                    style="height:1.216em;width:0.5556em;"><svg xmlns="http://www.w3.org/2000/svg"
                                    width="0.5556em" height="1.216em" style="width:0.5556em"
                                    viewBox="0 0 555.5600000000001 1216" preserveAspectRatio="xMinYMin">
                                    <path
                                        d="M145 0 H188 V1216 H145z M145 0 H188 V1216 H145zM367 0 H410 V1216 H367z M367 0 H410 V1216 H367z" />
                                    </svg></span></span><span style="top:-4.072em;"><span class="pstrut"
                                    style="height:3.216em;"></span><span
                                    class="delimsizinginner delim-size1"><span>&#x2225;</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span></span></span></span></span></span></span>
        </p>
        </td>
        <td>
        <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-Vmatrix">Vmatrix</span><span class="token punctuation">}</span>
x <span class="token punctuation">&amp;</span> y <span class="token function selector">\\</span>
z <span class="token punctuation">&amp;</span> v
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-Vmatrix">Vmatrix</span><span class="token punctuation">}</span>
</pre>
        </td>
    </tr>
    <tr>
        <td>
        <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                    xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                    <semantics>
                    <mrow>
                        <mo fence="true">(</mo>
                        <mtable rowspacing="0.16em" columnalign="center center" columnspacing="1em">
                        <mtr>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>x</mi>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>y</mi>
                            </mstyle>
                            </mtd>
                        </mtr>
                        <mtr>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>z</mi>
                            </mstyle>
                            </mtd>
                            <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                                <mi>v</mi>
                            </mstyle>
                            </mtd>
                        </mtr>
                        </mtable>
                        <mo fence="true">)</mo>
                    </mrow>
                    <annotation encoding="application/x-tex">\begin{pmatrix}
                        x &amp; y \\
                        z &amp; v
                        \end{pmatrix}
                    </annotation>
                    </semantics>
                </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                    style="height:2.4em;vertical-align:-0.95em;"></span><span class="minner"><span
                        class="mopen delimcenter" style="top:0em;"><span
                        class="delimsizing size3">(</span></span><span class="mord"><span class="mtable"><span
                            class="col-align-c"><span class="vlist-t vlist-t2"><span class="vlist-r"><span
                                class="vlist" style="height:1.45em;"><span style="top:-3.61em;"><span class="pstrut"
                                    style="height:3em;"></span><span class="mord"><span
                                        class="mord mathnormal">x</span></span></span><span style="top:-2.41em;"><span
                                    class="pstrut" style="height:3em;"></span><span class="mord"><span
                                        class="mord mathnormal"
                                        style="margin-right:0.04398em;">z</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span><span
                            class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep"
                            style="width:0.5em;"></span><span class="col-align-c"><span class="vlist-t vlist-t2"><span
                                class="vlist-r"><span class="vlist" style="height:1.45em;"><span
                                    style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal"
                                        style="margin-right:0.03588em;">y</span></span></span><span
                                    style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span
                                    class="mord"><span class="mord mathnormal"
                                        style="margin-right:0.03588em;">v</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.95em;"><span></span></span></span></span></span></span></span><span
                        class="mclose delimcenter" style="top:0em;"><span
                        class="delimsizing size3">)</span></span></span></span></span></span></span></p>
        </td>
        <td>
        <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-pmatrix">pmatrix</span><span class="token punctuation">}</span>
x <span class="token punctuation">&amp;</span> y <span class="token function selector">\\</span>
z <span class="token punctuation">&amp;</span> v
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-pmatrix">pmatrix</span><span class="token punctuation">}</span>
</pre>
        </td>
    </tr>
    <tr>
        <td>
        <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                    xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                    <semantics>
                    <mrow>
                        <mo fence="true" stretchy="true" minsize="1.2em" maxsize="1.2em">(</mo>
                        <mstyle scriptlevel="1">
                        <mtable rowspacing="0.1em" columnspacing="0.2778em">
                            <mtr>
                            <mtd>
                                <mstyle scriptlevel="1" displaystyle="false">
                                <mi>a</mi>
                                </mstyle>
                            </mtd>
                            <mtd>
                                <mstyle scriptlevel="1" displaystyle="false">
                                <mi>b</mi>
                                </mstyle>
                            </mtd>
                            </mtr>
                            <mtr>
                            <mtd>
                                <mstyle scriptlevel="1" displaystyle="false">
                                <mi>c</mi>
                                </mstyle>
                            </mtd>
                            <mtd>
                                <mstyle scriptlevel="1" displaystyle="false">
                                <mi>d</mi>
                                </mstyle>
                            </mtd>
                            </mtr>
                        </mtable>
                        </mstyle>
                        <mo fence="true" stretchy="true" minsize="1.2em" maxsize="1.2em">)</mo>
                    </mrow>
                    <annotation encoding="application/x-tex">\bigl( \begin{smallmatrix}
                        a&amp;b\\
                        c&amp;d
                        \end{smallmatrix} \bigr)
                    </annotation>
                    </semantics>
                </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                    style="height:1.3322em;vertical-align:-0.4161em;"></span><span class="mopen"><span
                        class="delimsizing size1">(</span></span><span class="mord"><span class="mtable"><span
                        class="col-align-c"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                                style="height:0.9161em;"><span style="top:-3.13em;"><span class="pstrut"
                                    style="height:2.7em;"></span><span
                                    class="mord mtight sizing reset-size6 size3"><span
                                    class="mord mathnormal mtight">a</span></span></span><span
                                style="top:-2.4639em;"><span class="pstrut" style="height:2.7em;"></span><span
                                    class="mord mtight sizing reset-size6 size3"><span
                                    class="mord mathnormal mtight">c</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.4161em;"><span></span></span></span></span></span><span
                        class="arraycolsep" style="width:0.1945em;"></span><span class="arraycolsep"
                        style="width:0.1945em;"></span><span class="col-align-c"><span
                            class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                                style="height:0.9161em;"><span style="top:-3.13em;"><span class="pstrut"
                                    style="height:2.7em;"></span><span
                                    class="mord mtight sizing reset-size6 size3"><span
                                    class="mord mathnormal mtight">b</span></span></span><span
                                style="top:-2.4639em;"><span class="pstrut" style="height:2.7em;"></span><span
                                    class="mord mtight sizing reset-size6 size3"><span
                                    class="mord mathnormal mtight">d</span></span></span></span><span
                                class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                                style="height:0.4161em;"><span></span></span></span></span></span></span></span><span
                    class="mclose"><span class="delimsizing size1">)</span></span></span></span></span></span></p>
        </td>
        <td>
        <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\bigl</span>( <span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-smallmatrix">smallmatrix</span><span class="token punctuation">}</span>
a<span class="token punctuation">&amp;</span>b<span class="token function selector">\\</span>
c<span class="token punctuation">&amp;</span>d
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-smallmatrix">smallmatrix</span><span class="token punctuation">}</span> <span class="token function selector">\bigr</span>)
</pre>
        </td>
    </tr>
    </tbody>
</table>
~~~

## (19) 数组和方程组

~~~
<table>
<tbody>
  <tr>
    <th>&#x7B26;&#x53F7;</th>
    <th>LaTeX</th>
  </tr>
  <tr>
    <td>
      <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                <semantics>
                  <mrow>
                    <menclose notation="top bottom">
                      <mtable rowspacing="0.16em" columnalign="center center center" columnlines="solid solid"
                        columnspacing="1em" rowlines="solid none none none">
                        <mtr>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mi>a</mi>
                            </mstyle>
                          </mtd>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mi>b</mi>
                            </mstyle>
                          </mtd>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mi>S</mi>
                            </mstyle>
                          </mtd>
                        </mtr>
                        <mtr>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mn>0</mn>
                            </mstyle>
                          </mtd>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mn>0</mn>
                            </mstyle>
                          </mtd>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mn>1</mn>
                            </mstyle>
                          </mtd>
                        </mtr>
                        <mtr>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mn>0</mn>
                            </mstyle>
                          </mtd>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mn>1</mn>
                            </mstyle>
                          </mtd>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mn>1</mn>
                            </mstyle>
                          </mtd>
                        </mtr>
                        <mtr>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mn>1</mn>
                            </mstyle>
                          </mtd>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mn>0</mn>
                            </mstyle>
                          </mtd>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mn>1</mn>
                            </mstyle>
                          </mtd>
                        </mtr>
                        <mtr>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mn>1</mn>
                            </mstyle>
                          </mtd>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mn>1</mn>
                            </mstyle>
                          </mtd>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mn>0</mn>
                            </mstyle>
                          </mtd>
                        </mtr>
                      </mtable>
                    </menclose>
                  </mrow>
                  <annotation encoding="application/x-tex">\begin{array}{ | c | c | c | }
                    a &amp; b &amp; S \\
                    \hline
                    0 &amp; 0 &amp; 1 \\
                    0 &amp; 1 &amp; 1 \\
                    1 &amp; 0 &amp; 1 \\
                    1 &amp; 1 &amp; 0
                    \end{array}

                  </annotation>
                </semantics>
              </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                  style="height:6em;vertical-align:-2.75em;"></span><span class="mord"><span
                    class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                        style="height:3.25em;"><span style="top:-5.25em;"><span class="pstrut"
                            style="height:5.25em;"></span><span class="mtable"><span class="vertical-separator"
                              style="height:6em;border-right-width:0.04em;border-right-style:solid;margin:0 -0.02em;vertical-align:-2.75em;"></span><span
                              class="arraycolsep" style="width:0.5em;"></span><span class="col-align-c"><span
                                class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                                    style="height:3.25em;"><span style="top:-5.41em;"><span class="pstrut"
                                        style="height:3em;"></span><span class="mord"><span
                                          class="mord mathnormal">a</span></span></span><span
                                      style="top:-4.21em;"><span class="pstrut" style="height:3em;"></span><span
                                        class="mord"><span class="mord">0</span></span></span><span
                                      style="top:-3.01em;"><span class="pstrut" style="height:3em;"></span><span
                                        class="mord"><span class="mord">0</span></span></span><span
                                      style="top:-1.81em;"><span class="pstrut" style="height:3em;"></span><span
                                        class="mord"><span class="mord">1</span></span></span><span
                                      style="top:-0.61em;"><span class="pstrut" style="height:3em;"></span><span
                                        class="mord"><span class="mord">1</span></span></span></span><span
                                    class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span
                                    class="vlist"
                                    style="height:2.75em;"><span></span></span></span></span></span><span
                              class="arraycolsep" style="width:0.5em;"></span><span class="vertical-separator"
                              style="height:6em;border-right-width:0.04em;border-right-style:solid;margin:0 -0.02em;vertical-align:-2.75em;"></span><span
                              class="arraycolsep" style="width:0.5em;"></span><span class="col-align-c"><span
                                class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                                    style="height:3.25em;"><span style="top:-5.41em;"><span class="pstrut"
                                        style="height:3em;"></span><span class="mord"><span
                                          class="mord mathnormal">b</span></span></span><span
                                      style="top:-4.21em;"><span class="pstrut" style="height:3em;"></span><span
                                        class="mord"><span class="mord">0</span></span></span><span
                                      style="top:-3.01em;"><span class="pstrut" style="height:3em;"></span><span
                                        class="mord"><span class="mord">1</span></span></span><span
                                      style="top:-1.81em;"><span class="pstrut" style="height:3em;"></span><span
                                        class="mord"><span class="mord">0</span></span></span><span
                                      style="top:-0.61em;"><span class="pstrut" style="height:3em;"></span><span
                                        class="mord"><span class="mord">1</span></span></span></span><span
                                    class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span
                                    class="vlist"
                                    style="height:2.75em;"><span></span></span></span></span></span><span
                              class="arraycolsep" style="width:0.5em;"></span><span class="vertical-separator"
                              style="height:6em;border-right-width:0.04em;border-right-style:solid;margin:0 -0.02em;vertical-align:-2.75em;"></span><span
                              class="arraycolsep" style="width:0.5em;"></span><span class="col-align-c"><span
                                class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                                    style="height:3.25em;"><span style="top:-5.41em;"><span class="pstrut"
                                        style="height:3em;"></span><span class="mord"><span
                                          class="mord mathnormal"
                                          style="margin-right:0.05764em;">S</span></span></span><span
                                      style="top:-4.21em;"><span class="pstrut" style="height:3em;"></span><span
                                        class="mord"><span class="mord">1</span></span></span><span
                                      style="top:-3.01em;"><span class="pstrut" style="height:3em;"></span><span
                                        class="mord"><span class="mord">1</span></span></span><span
                                      style="top:-1.81em;"><span class="pstrut" style="height:3em;"></span><span
                                        class="mord"><span class="mord">1</span></span></span><span
                                      style="top:-0.61em;"><span class="pstrut" style="height:3em;"></span><span
                                        class="mord"><span class="mord">0</span></span></span></span><span
                                    class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span
                                    class="vlist"
                                    style="height:2.75em;"><span></span></span></span></span></span><span
                              class="arraycolsep" style="width:0.5em;"></span><span class="vertical-separator"
                              style="height:6em;border-right-width:0.04em;border-right-style:solid;margin:0 -0.02em;vertical-align:-2.75em;"></span></span></span><span
                          style="top:-7.3em;"><span class="pstrut" style="height:5.25em;"></span><span
                            class="hline" style="border-bottom-width:0.04em;"></span></span></span><span
                        class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                        style="height:2.75em;"><span></span></span></span></span></span></span></span></span></span>
      </p>
    </td>
    <td>
      <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-array">array</span><span class="token punctuation">}</span><span class="token punctuation">{</span> | c | c | c | <span class="token punctuation">}</span>
a <span class="token punctuation">&amp;</span> b <span class="token punctuation">&amp;</span> S <span class="token function selector">\\</span>
<span class="token function selector">\hline</span>
0 <span class="token punctuation">&amp;</span> 0 <span class="token punctuation">&amp;</span> 1 <span class="token function selector">\\</span>
0 <span class="token punctuation">&amp;</span> 1 <span class="token punctuation">&amp;</span> 1 <span class="token function selector">\\</span>
1 <span class="token punctuation">&amp;</span> 0 <span class="token punctuation">&amp;</span> 1 <span class="token function selector">\\</span>
1 <span class="token punctuation">&amp;</span> 1 <span class="token punctuation">&amp;</span> 0
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-array">array</span><span class="token punctuation">}</span>
</pre>
    </td>
  </tr>
  <tr>
    <td>
      <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                <semantics>
                  <mrow>
                    <mo fence="true">{</mo>
                    <mtable rowspacing="0.36em" columnalign="left left" columnspacing="1em">
                      <mtr>
                        <mtd>
                          <mstyle scriptlevel="0" displaystyle="false">
                            <mrow>
                              <mn>3</mn>
                              <mi>x</mi>
                              <mo>+</mo>
                              <mn>5</mn>
                              <mi>y</mi>
                              <mo>+</mo>
                              <mi>z</mi>
                            </mrow>
                          </mstyle>
                        </mtd>
                      </mtr>
                      <mtr>
                        <mtd>
                          <mstyle scriptlevel="0" displaystyle="false">
                            <mrow>
                              <mn>7</mn>
                              <mi>x</mi>
                              <mo>&#x2212;</mo>
                              <mn>2</mn>
                              <mi>y</mi>
                              <mo>+</mo>
                              <mn>4</mn>
                              <mi>z</mi>
                            </mrow>
                          </mstyle>
                        </mtd>
                      </mtr>
                      <mtr>
                        <mtd>
                          <mstyle scriptlevel="0" displaystyle="false">
                            <mrow>
                              <mo>&#x2212;</mo>
                              <mn>6</mn>
                              <mi>x</mi>
                              <mo>+</mo>
                              <mn>3</mn>
                              <mi>y</mi>
                              <mo>+</mo>
                              <mn>2</mn>
                              <mi>z</mi>
                            </mrow>
                          </mstyle>
                        </mtd>
                      </mtr>
                    </mtable>
                  </mrow>
                  <annotation encoding="application/x-tex">\begin{cases}
                    3x + 5y + z \\
                    7x - 2y + 4z \\
                    -6x + 3y + 2z
                    \end{cases}
                  </annotation>
                </semantics>
              </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                  style="height:4.32em;vertical-align:-1.91em;"></span><span class="minner"><span
                    class="mopen"><span class="delimsizing mult"><span class="vlist-t vlist-t2"><span
                          class="vlist-r"><span class="vlist" style="height:2.35em;"><span
                              style="top:-2.2em;"><span class="pstrut" style="height:3.15em;"></span><span
                                class="delimsizinginner delim-size4"><span>&#x23A9;</span></span></span><span
                              style="top:-2.192em;"><span class="pstrut" style="height:3.15em;"></span><span
                                style="height:0.316em;width:0.8889em;"><svg xmlns="http://www.w3.org/2000/svg"
                                  width="0.8889em" height="0.316em" style="width:0.8889em"
                                  viewBox="0 0 888.89 316" preserveAspectRatio="xMinYMin">
                                  <path d="M384 0 H504 V316 H384z M384 0 H504 V316 H384z" />
                                </svg></span></span><span style="top:-3.15em;"><span class="pstrut"
                                style="height:3.15em;"></span><span
                                class="delimsizinginner delim-size4"><span>&#x23A8;</span></span></span><span
                              style="top:-4.292em;"><span class="pstrut" style="height:3.15em;"></span><span
                                style="height:0.316em;width:0.8889em;"><svg xmlns="http://www.w3.org/2000/svg"
                                  width="0.8889em" height="0.316em" style="width:0.8889em"
                                  viewBox="0 0 888.89 316" preserveAspectRatio="xMinYMin">
                                  <path d="M384 0 H504 V316 H384z M384 0 H504 V316 H384z" />
                                </svg></span></span><span style="top:-4.6em;"><span class="pstrut"
                                style="height:3.15em;"></span><span
                                class="delimsizinginner delim-size4"><span>&#x23A7;</span></span></span></span><span
                            class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                            style="height:1.85em;"><span></span></span></span></span></span></span><span
                    class="mord"><span class="mtable"><span class="col-align-l"><span
                          class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                              style="height:2.41em;"><span style="top:-4.41em;"><span class="pstrut"
                                  style="height:3.008em;"></span><span class="mord"><span
                                    class="mord">3</span><span class="mord mathnormal">x</span><span
                                    class="mspace" style="margin-right:0.2222em;"></span><span
                                    class="mbin">+</span><span class="mspace"
                                    style="margin-right:0.2222em;"></span><span class="mord">5</span><span
                                    class="mord mathnormal" style="margin-right:0.03588em;">y</span><span
                                    class="mspace" style="margin-right:0.2222em;"></span><span
                                    class="mbin">+</span><span class="mspace"
                                    style="margin-right:0.2222em;"></span><span class="mord mathnormal"
                                    style="margin-right:0.04398em;">z</span></span></span><span
                                style="top:-2.97em;"><span class="pstrut" style="height:3.008em;"></span><span
                                  class="mord"><span class="mord">7</span><span
                                    class="mord mathnormal">x</span><span class="mspace"
                                    style="margin-right:0.2222em;"></span><span class="mbin">&#x2212;</span><span
                                    class="mspace" style="margin-right:0.2222em;"></span><span
                                    class="mord">2</span><span class="mord mathnormal"
                                    style="margin-right:0.03588em;">y</span><span class="mspace"
                                    style="margin-right:0.2222em;"></span><span class="mbin">+</span><span
                                    class="mspace" style="margin-right:0.2222em;"></span><span
                                    class="mord">4</span><span class="mord mathnormal"
                                    style="margin-right:0.04398em;">z</span></span></span><span
                                style="top:-1.53em;"><span class="pstrut" style="height:3.008em;"></span><span
                                  class="mord"><span class="mord">&#x2212;</span><span class="mord">6</span><span
                                    class="mord mathnormal">x</span><span class="mspace"
                                    style="margin-right:0.2222em;"></span><span class="mbin">+</span><span
                                    class="mspace" style="margin-right:0.2222em;"></span><span
                                    class="mord">3</span><span class="mord mathnormal"
                                    style="margin-right:0.03588em;">y</span><span class="mspace"
                                    style="margin-right:0.2222em;"></span><span class="mbin">+</span><span
                                    class="mspace" style="margin-right:0.2222em;"></span><span
                                    class="mord">2</span><span class="mord mathnormal"
                                    style="margin-right:0.04398em;">z</span></span></span></span><span
                              class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                              style="height:1.91em;"><span></span></span></span></span></span></span></span><span
                    class="mclose nulldelimiter"></span></span></span></span></span></span></p>
    </td>
    <td>
      <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-cases">cases</span><span class="token punctuation">}</span>
3x + 5y + z <span class="token function selector">\\</span>
7x - 2y + 4z <span class="token function selector">\\</span>
-6x + 3y + 2z
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-cases">cases</span><span class="token punctuation">}</span>
</pre>
    </td>
  </tr>
  <tr>
    <td>
      <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                <semantics>
                  <mrow>
                    <mi>f</mi>
                    <mo stretchy="false">(</mo>
                    <mi>n</mi>
                    <mo stretchy="false">)</mo>
                    <mo>=</mo>
                    <mrow>
                      <mo fence="true">{</mo>
                      <mtable rowspacing="0.36em" columnalign="left left" columnspacing="1em">
                        <mtr>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mrow>
                                <mi>n</mi>
                                <mi mathvariant="normal">/</mi>
                                <mn>2</mn>
                                <mo separator="true">,</mo>
                              </mrow>
                            </mstyle>
                          </mtd>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mrow>
                                <mtext>if&#xA0;</mtext>
                                <mi>n</mi>
                                <mtext>&#xA0;is&#xA0;even</mtext>
                              </mrow>
                            </mstyle>
                          </mtd>
                        </mtr>
                        <mtr>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mrow>
                                <mn>3</mn>
                                <mi>n</mi>
                                <mo>+</mo>
                                <mn>1</mn>
                                <mo separator="true">,</mo>
                              </mrow>
                            </mstyle>
                          </mtd>
                          <mtd>
                            <mstyle scriptlevel="0" displaystyle="false">
                              <mrow>
                                <mtext>if&#xA0;</mtext>
                                <mi>n</mi>
                                <mtext>&#xA0;is&#xA0;odd</mtext>
                              </mrow>
                            </mstyle>
                          </mtd>
                        </mtr>
                      </mtable>
                    </mrow>
                  </mrow>
                  <annotation encoding="application/x-tex">f(n) =
                    \begin{cases}
                    n/2, &amp; \text{if }n\text{ is even} \\
                    3n+1, &amp; \text{if }n\text{ is odd}
                    \end{cases}
                  </annotation>
                </semantics>
              </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                  style="height:1em;vertical-align:-0.25em;"></span><span class="mord mathnormal"
                  style="margin-right:0.10764em;">f</span><span class="mopen">(</span><span
                  class="mord mathnormal">n</span><span class="mclose">)</span><span class="mspace"
                  style="margin-right:0.2778em;"></span><span class="mrel">=</span><span class="mspace"
                  style="margin-right:0.2778em;"></span></span><span class="base"><span class="strut"
                  style="height:3em;vertical-align:-1.25em;"></span><span class="minner"><span
                    class="mopen delimcenter" style="top:0em;"><span
                      class="delimsizing size4">{</span></span><span class="mord"><span class="mtable"><span
                        class="col-align-l"><span class="vlist-t vlist-t2"><span class="vlist-r"><span
                              class="vlist" style="height:1.69em;"><span style="top:-3.69em;"><span class="pstrut"
                                  style="height:3.008em;"></span><span class="mord"><span
                                    class="mord mathnormal">n</span><span class="mord">/2</span><span
                                    class="mpunct">,</span></span></span><span style="top:-2.25em;"><span
                                  class="pstrut" style="height:3.008em;"></span><span class="mord"><span
                                    class="mord">3</span><span class="mord mathnormal">n</span><span
                                    class="mspace" style="margin-right:0.2222em;"></span><span
                                    class="mbin">+</span><span class="mspace"
                                    style="margin-right:0.2222em;"></span><span class="mord">1</span><span
                                    class="mpunct">,</span></span></span></span><span
                              class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                              style="height:1.19em;"><span></span></span></span></span></span><span
                        class="arraycolsep" style="width:1em;"></span><span class="col-align-l"><span
                          class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                              style="height:1.69em;"><span style="top:-3.69em;"><span class="pstrut"
                                  style="height:3.008em;"></span><span class="mord"><span class="mord text"><span
                                      class="mord">if&#xA0;</span></span><span
                                    class="mord mathnormal">n</span><span class="mord text"><span
                                      class="mord">&#xA0;is&#xA0;even</span></span></span></span><span
                                style="top:-2.25em;"><span class="pstrut" style="height:3.008em;"></span><span
                                  class="mord"><span class="mord text"><span
                                      class="mord">if&#xA0;</span></span><span
                                    class="mord mathnormal">n</span><span class="mord text"><span
                                      class="mord">&#xA0;is&#xA0;odd</span></span></span></span></span><span
                              class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                              style="height:1.19em;"><span></span></span></span></span></span></span></span><span
                    class="mclose nulldelimiter"></span></span></span></span></span></span></p>
    </td>
    <td>
      <pre data-role="codeBlock" data-info="LaTeX" class="language-latex">f(n) =
<span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-cases">cases</span><span class="token punctuation">}</span>
n/2, <span class="token punctuation">&amp;</span> <span class="token function selector">\text</span><span class="token punctuation">{</span>if <span class="token punctuation">}</span>n<span class="token function selector">\text</span><span class="token punctuation">{</span> is even<span class="token punctuation">}</span> <span class="token function selector">\\</span>
3n+1, <span class="token punctuation">&amp;</span> <span class="token function selector">\text</span><span class="token punctuation">{</span>if <span class="token punctuation">}</span>n<span class="token function selector">\text</span><span class="token punctuation">{</span> is odd<span class="token punctuation">}</span>
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-cases">cases</span><span class="token punctuation">}</span>
</pre>
    </td>
  </tr>
  <tr>
    <td>
      <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                <semantics>
                  <mtable rowspacing="0.25em" columnalign="right left" columnspacing="0em">
                    <mtr>
                      <mtd class="mtr-glue"></mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="true">
                          <mrow>
                            <mi>f</mi>
                            <mo stretchy="false">(</mo>
                            <mi>x</mi>
                            <mo stretchy="false">)</mo>
                          </mrow>
                        </mstyle>
                      </mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="true">
                          <mrow>
                            <mrow></mrow>
                            <mo>=</mo>
                            <mo stretchy="false">(</mo>
                            <mi>a</mi>
                            <mo>+</mo>
                            <mi>b</mi>
                            <msup>
                              <mo stretchy="false">)</mo>
                              <mn>2</mn>
                            </msup>
                          </mrow>
                        </mstyle>
                      </mtd>
                      <mtd class="mtr-glue"></mtd>
                      <mtd class="mml-eqn-num"></mtd>
                    </mtr>
                    <mtr>
                      <mtd class="mtr-glue"></mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="true">
                          <mrow></mrow>
                        </mstyle>
                      </mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="true">
                          <mrow>
                            <mrow></mrow>
                            <mo>=</mo>
                            <msup>
                              <mi>a</mi>
                              <mn>2</mn>
                            </msup>
                            <mo>+</mo>
                            <mn>2</mn>
                            <mi>a</mi>
                            <mi>b</mi>
                            <mo>+</mo>
                            <msup>
                              <mi>b</mi>
                              <mn>2</mn>
                            </msup>
                          </mrow>
                        </mstyle>
                      </mtd>
                      <mtd class="mtr-glue"></mtd>
                      <mtd class="mml-eqn-num"></mtd>
                    </mtr>
                  </mtable>
                  <annotation encoding="application/x-tex">\begin{align}
                    f(x) &amp; = (a+b)^2\\
                    &amp; = a^2+2ab+b^2
                    \end{align}
                  </annotation>
                </semantics>
              </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                  style="height:3.0482em;vertical-align:-1.2741em;"></span><span class="mtable"><span
                    class="col-align-r"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                          style="height:1.7741em;"><span style="top:-3.91em;"><span class="pstrut"
                              style="height:3em;"></span><span class="mord"><span class="mord mathnormal"
                                style="margin-right:0.10764em;">f</span><span class="mopen">(</span><span
                                class="mord mathnormal">x</span><span class="mclose">)</span></span></span><span
                            style="top:-2.3859em;"><span class="pstrut" style="height:3em;"></span><span
                              class="mord"></span></span></span><span class="vlist-s">&#x200B;</span></span><span
                        class="vlist-r"><span class="vlist"
                          style="height:1.2741em;"><span></span></span></span></span></span><span
                    class="col-align-l"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                          style="height:1.7741em;"><span style="top:-3.91em;"><span class="pstrut"
                              style="height:3em;"></span><span class="mord"><span class="mord"></span><span
                                class="mspace" style="margin-right:0.2778em;"></span><span
                                class="mrel">=</span><span class="mspace"
                                style="margin-right:0.2778em;"></span><span class="mopen">(</span><span
                                class="mord mathnormal">a</span><span class="mspace"
                                style="margin-right:0.2222em;"></span><span class="mbin">+</span><span
                                class="mspace" style="margin-right:0.2222em;"></span><span
                                class="mord mathnormal">b</span><span class="mclose"><span
                                  class="mclose">)</span><span class="msupsub"><span class="vlist-t"><span
                                      class="vlist-r"><span class="vlist" style="height:0.8641em;"><span
                                          style="top:-3.113em;margin-right:0.05em;"><span class="pstrut"
                                            style="height:2.7em;"></span><span
                                            class="sizing reset-size6 size3 mtight"><span
                                              class="mord mtight">2</span></span></span></span></span></span></span></span></span></span><span
                            style="top:-2.3859em;"><span class="pstrut" style="height:3em;"></span><span
                              class="mord"><span class="mord"></span><span class="mspace"
                                style="margin-right:0.2778em;"></span><span class="mrel">=</span><span
                                class="mspace" style="margin-right:0.2778em;"></span><span class="mord"><span
                                  class="mord mathnormal">a</span><span class="msupsub"><span
                                    class="vlist-t"><span class="vlist-r"><span class="vlist"
                                        style="height:0.8641em;"><span
                                          style="top:-3.113em;margin-right:0.05em;"><span class="pstrut"
                                            style="height:2.7em;"></span><span
                                            class="sizing reset-size6 size3 mtight"><span
                                              class="mord mtight">2</span></span></span></span></span></span></span></span><span
                                class="mspace" style="margin-right:0.2222em;"></span><span
                                class="mbin">+</span><span class="mspace"
                                style="margin-right:0.2222em;"></span><span class="mord">2</span><span
                                class="mord mathnormal">ab</span><span class="mspace"
                                style="margin-right:0.2222em;"></span><span class="mbin">+</span><span
                                class="mspace" style="margin-right:0.2222em;"></span><span class="mord"><span
                                  class="mord mathnormal">b</span><span class="msupsub"><span
                                    class="vlist-t"><span class="vlist-r"><span class="vlist"
                                        style="height:0.8641em;"><span
                                          style="top:-3.113em;margin-right:0.05em;"><span class="pstrut"
                                            style="height:2.7em;"></span><span
                                            class="sizing reset-size6 size3 mtight"><span
                                              class="mord mtight">2</span></span></span></span></span></span></span></span></span></span></span><span
                          class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                          style="height:1.2741em;"><span></span></span></span></span></span></span></span><span
                class="tag"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                      style="height:1.7741em;"><span style="top:-3.7741em;"><span class="pstrut"
                          style="height:2.8641em;"></span><span class="eqn-num"></span></span><span
                        style="top:-2.25em;"><span class="pstrut" style="height:2.8641em;"></span><span
                          class="eqn-num"></span></span></span><span class="vlist-s">&#x200B;</span></span><span
                    class="vlist-r"><span class="vlist"
                      style="height:1.2741em;"><span></span></span></span></span></span></span></span></span></p>
    </td>
    <td>
      <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-align">align</span><span class="token punctuation">}</span><span class="token equation string">
f(x) &amp; = (a+b)^2<span class="token equation-command regex">\\</span>
&amp; = a^2+2ab+b^2
</span><span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-align">align</span><span class="token punctuation">}</span>
</pre>
    </td>
  </tr>
  <tr>
    <td>
      <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                <semantics>
                  <mtable rowspacing="0.25em" columnalign="right left right left" columnspacing="0em">
                    <mtr>
                      <mtd class="mtr-glue"></mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="true">
                          <mrow>
                            <mi>f</mi>
                            <mo stretchy="false">(</mo>
                            <mi>x</mi>
                            <mo stretchy="false">)</mo>
                          </mrow>
                        </mstyle>
                      </mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="true">
                          <mrow>
                            <mrow></mrow>
                            <mo>=</mo>
                            <mo stretchy="false">(</mo>
                            <mi>a</mi>
                            <mo>&#x2212;</mo>
                            <mi>b</mi>
                            <msup>
                              <mo stretchy="false">)</mo>
                              <mn>2</mn>
                            </msup>
                          </mrow>
                        </mstyle>
                      </mtd>
                      <mtd class="mtr-glue"></mtd>
                      <mtd class="mml-eqn-num"></mtd>
                    </mtr>
                    <mtr>
                      <mtd class="mtr-glue"></mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="true">
                          <mrow></mrow>
                        </mstyle>
                      </mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="true">
                          <mrow>
                            <mrow></mrow>
                            <mo>=</mo>
                            <msup>
                              <mi>a</mi>
                              <mn>2</mn>
                            </msup>
                            <mo>&#x2212;</mo>
                            <mn>2</mn>
                            <mi>a</mi>
                            <mi>b</mi>
                            <mo>+</mo>
                            <msup>
                              <mi>b</mi>
                              <mn>2</mn>
                            </msup>
                          </mrow>
                        </mstyle>
                      </mtd>
                      <mtd class="mtr-glue"></mtd>
                      <mtd class="mml-eqn-num"></mtd>
                    </mtr>
                  </mtable>
                  <annotation encoding="application/x-tex">\begin{alignat}{2}
                    f(x) &amp; = (a-b)^2 \\
                    &amp; = a^2-2ab+b^2
                    \end{alignat}
                  </annotation>
                </semantics>
              </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                  style="height:3.0482em;vertical-align:-1.2741em;"></span><span class="mtable"><span
                    class="col-align-r"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                          style="height:1.7741em;"><span style="top:-3.91em;"><span class="pstrut"
                              style="height:3em;"></span><span class="mord"><span class="mord mathnormal"
                                style="margin-right:0.10764em;">f</span><span class="mopen">(</span><span
                                class="mord mathnormal">x</span><span class="mclose">)</span></span></span><span
                            style="top:-2.3859em;"><span class="pstrut" style="height:3em;"></span><span
                              class="mord"></span></span></span><span class="vlist-s">&#x200B;</span></span><span
                        class="vlist-r"><span class="vlist"
                          style="height:1.2741em;"><span></span></span></span></span></span><span
                    class="col-align-l"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                          style="height:1.7741em;"><span style="top:-3.91em;"><span class="pstrut"
                              style="height:3em;"></span><span class="mord"><span class="mord"></span><span
                                class="mspace" style="margin-right:0.2778em;"></span><span
                                class="mrel">=</span><span class="mspace"
                                style="margin-right:0.2778em;"></span><span class="mopen">(</span><span
                                class="mord mathnormal">a</span><span class="mspace"
                                style="margin-right:0.2222em;"></span><span class="mbin">&#x2212;</span><span
                                class="mspace" style="margin-right:0.2222em;"></span><span
                                class="mord mathnormal">b</span><span class="mclose"><span
                                  class="mclose">)</span><span class="msupsub"><span class="vlist-t"><span
                                      class="vlist-r"><span class="vlist" style="height:0.8641em;"><span
                                          style="top:-3.113em;margin-right:0.05em;"><span class="pstrut"
                                            style="height:2.7em;"></span><span
                                            class="sizing reset-size6 size3 mtight"><span
                                              class="mord mtight">2</span></span></span></span></span></span></span></span></span></span><span
                            style="top:-2.3859em;"><span class="pstrut" style="height:3em;"></span><span
                              class="mord"><span class="mord"></span><span class="mspace"
                                style="margin-right:0.2778em;"></span><span class="mrel">=</span><span
                                class="mspace" style="margin-right:0.2778em;"></span><span class="mord"><span
                                  class="mord mathnormal">a</span><span class="msupsub"><span
                                    class="vlist-t"><span class="vlist-r"><span class="vlist"
                                        style="height:0.8641em;"><span
                                          style="top:-3.113em;margin-right:0.05em;"><span class="pstrut"
                                            style="height:2.7em;"></span><span
                                            class="sizing reset-size6 size3 mtight"><span
                                              class="mord mtight">2</span></span></span></span></span></span></span></span><span
                                class="mspace" style="margin-right:0.2222em;"></span><span
                                class="mbin">&#x2212;</span><span class="mspace"
                                style="margin-right:0.2222em;"></span><span class="mord">2</span><span
                                class="mord mathnormal">ab</span><span class="mspace"
                                style="margin-right:0.2222em;"></span><span class="mbin">+</span><span
                                class="mspace" style="margin-right:0.2222em;"></span><span class="mord"><span
                                  class="mord mathnormal">b</span><span class="msupsub"><span
                                    class="vlist-t"><span class="vlist-r"><span class="vlist"
                                        style="height:0.8641em;"><span
                                          style="top:-3.113em;margin-right:0.05em;"><span class="pstrut"
                                            style="height:2.7em;"></span><span
                                            class="sizing reset-size6 size3 mtight"><span
                                              class="mord mtight">2</span></span></span></span></span></span></span></span></span></span></span><span
                          class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                          style="height:1.2741em;"><span></span></span></span></span></span></span></span><span
                class="tag"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                      style="height:1.7741em;"><span style="top:-3.7741em;"><span class="pstrut"
                          style="height:2.8641em;"></span><span class="eqn-num"></span></span><span
                        style="top:-2.25em;"><span class="pstrut" style="height:2.8641em;"></span><span
                          class="eqn-num"></span></span></span><span class="vlist-s">&#x200B;</span></span><span
                    class="vlist-r"><span class="vlist"
                      style="height:1.2741em;"><span></span></span></span></span></span></span></span></span></p>
    </td>
    <td>
      <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-alignat">alignat</span><span class="token punctuation">}</span><span class="token punctuation">{</span>2<span class="token punctuation">}</span>
f(x) <span class="token punctuation">&amp;</span> = (a-b)^2 <span class="token function selector">\\</span>
<span class="token punctuation">&amp;</span> = a^2-2ab+b^2
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-alignat">alignat</span><span class="token punctuation">}</span>
</pre>
    </td>
  </tr>
  <tr>
    <td>
      <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                <semantics>
                  <mtable rowspacing="0.16em" columnalign="left center left" columnspacing="1em">
                    <mtr>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="false">
                          <mi>z</mi>
                        </mstyle>
                      </mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="false">
                          <mo lspace="0em" rspace="0em">=</mo>
                        </mstyle>
                      </mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="false">
                          <mi>a</mi>
                        </mstyle>
                      </mtd>
                    </mtr>
                    <mtr>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="false">
                          <mrow>
                            <mi>f</mi>
                            <mo stretchy="false">(</mo>
                            <mi>x</mi>
                            <mo separator="true">,</mo>
                            <mi>y</mi>
                            <mo separator="true">,</mo>
                            <mi>z</mi>
                            <mo stretchy="false">)</mo>
                          </mrow>
                        </mstyle>
                      </mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="false">
                          <mo lspace="0em" rspace="0em">=</mo>
                        </mstyle>
                      </mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="false">
                          <mrow>
                            <mi>x</mi>
                            <mo>+</mo>
                            <mi>y</mi>
                            <mo>+</mo>
                            <mi>z</mi>
                          </mrow>
                        </mstyle>
                      </mtd>
                    </mtr>
                  </mtable>
                  <annotation encoding="application/x-tex">\begin{array}{lcl}
                    z &amp; = &amp; a \\
                    f(x,y,z) &amp; = &amp; x + y + z
                    \end{array}
                  </annotation>
                </semantics>
              </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                  style="height:2.4em;vertical-align:-0.95em;"></span><span class="mord"><span
                    class="mtable"><span class="arraycolsep" style="width:0.5em;"></span><span
                      class="col-align-l"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                            style="height:1.45em;"><span style="top:-3.61em;"><span class="pstrut"
                                style="height:3em;"></span><span class="mord"><span class="mord mathnormal"
                                  style="margin-right:0.04398em;">z</span></span></span><span
                              style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span
                                class="mord"><span class="mord mathnormal"
                                  style="margin-right:0.10764em;">f</span><span class="mopen">(</span><span
                                  class="mord mathnormal">x</span><span class="mpunct">,</span><span
                                  class="mspace" style="margin-right:0.1667em;"></span><span
                                  class="mord mathnormal" style="margin-right:0.03588em;">y</span><span
                                  class="mpunct">,</span><span class="mspace"
                                  style="margin-right:0.1667em;"></span><span class="mord mathnormal"
                                  style="margin-right:0.04398em;">z</span><span
                                  class="mclose">)</span></span></span></span><span
                            class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                            style="height:0.95em;"><span></span></span></span></span></span><span
                      class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep"
                      style="width:0.5em;"></span><span class="col-align-c"><span class="vlist-t vlist-t2"><span
                          class="vlist-r"><span class="vlist" style="height:1.45em;"><span
                              style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span
                                class="mord"><span class="mrel">=</span></span></span><span
                              style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span
                                class="mord"><span class="mrel">=</span></span></span></span><span
                            class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                            style="height:0.95em;"><span></span></span></span></span></span><span
                      class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep"
                      style="width:0.5em;"></span><span class="col-align-l"><span class="vlist-t vlist-t2"><span
                          class="vlist-r"><span class="vlist" style="height:1.45em;"><span
                              style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span
                                class="mord"><span class="mord mathnormal">a</span></span></span><span
                              style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span
                                class="mord"><span class="mord mathnormal">x</span><span class="mspace"
                                  style="margin-right:0.2222em;"></span><span class="mbin">+</span><span
                                  class="mspace" style="margin-right:0.2222em;"></span><span
                                  class="mord mathnormal" style="margin-right:0.03588em;">y</span><span
                                  class="mspace" style="margin-right:0.2222em;"></span><span
                                  class="mbin">+</span><span class="mspace"
                                  style="margin-right:0.2222em;"></span><span class="mord mathnormal"
                                  style="margin-right:0.04398em;">z</span></span></span></span><span
                            class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                            style="height:0.95em;"><span></span></span></span></span></span><span
                      class="arraycolsep" style="width:0.5em;"></span></span></span></span></span></span></span>
      </p>
    </td>
    <td>
      <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-array">array</span><span class="token punctuation">}</span><span class="token punctuation">{</span>lcl<span class="token punctuation">}</span>
z <span class="token punctuation">&amp;</span> = <span class="token punctuation">&amp;</span> a <span class="token function selector">\\</span>
f(x,y,z) <span class="token punctuation">&amp;</span> = <span class="token punctuation">&amp;</span> x + y + z
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-array">array</span><span class="token punctuation">}</span>
</pre>
    </td>
  </tr>
  <tr>
    <td>
      <p><span class="katex-display"><span class="katex"><span class="katex-mathml"><math
                xmlns="http://www.w3.org/1998/Math/MathML" display="block">
                <semantics>
                  <mtable rowspacing="0.16em" columnalign="left center right" columnspacing="1em">
                    <mtr>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="false">
                          <mi>z</mi>
                        </mstyle>
                      </mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="false">
                          <mo lspace="0em" rspace="0em">=</mo>
                        </mstyle>
                      </mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="false">
                          <mi>a</mi>
                        </mstyle>
                      </mtd>
                    </mtr>
                    <mtr>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="false">
                          <mrow>
                            <mi>f</mi>
                            <mo stretchy="false">(</mo>
                            <mi>x</mi>
                            <mo separator="true">,</mo>
                            <mi>y</mi>
                            <mo separator="true">,</mo>
                            <mi>z</mi>
                            <mo stretchy="false">)</mo>
                          </mrow>
                        </mstyle>
                      </mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="false">
                          <mo lspace="0em" rspace="0em">=</mo>
                        </mstyle>
                      </mtd>
                      <mtd>
                        <mstyle scriptlevel="0" displaystyle="false">
                          <mrow>
                            <mi>x</mi>
                            <mo>+</mo>
                            <mi>y</mi>
                            <mo>+</mo>
                            <mi>z</mi>
                          </mrow>
                        </mstyle>
                      </mtd>
                    </mtr>
                  </mtable>
                  <annotation encoding="application/x-tex">\begin{array}{lcr}
                    z &amp; = &amp; a \\
                    f(x,y,z) &amp; = &amp; x + y + z
                    \end{array}
                  </annotation>
                </semantics>
              </math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"
                  style="height:2.4em;vertical-align:-0.95em;"></span><span class="mord"><span
                    class="mtable"><span class="arraycolsep" style="width:0.5em;"></span><span
                      class="col-align-l"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"
                            style="height:1.45em;"><span style="top:-3.61em;"><span class="pstrut"
                                style="height:3em;"></span><span class="mord"><span class="mord mathnormal"
                                  style="margin-right:0.04398em;">z</span></span></span><span
                              style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span
                                class="mord"><span class="mord mathnormal"
                                  style="margin-right:0.10764em;">f</span><span class="mopen">(</span><span
                                  class="mord mathnormal">x</span><span class="mpunct">,</span><span
                                  class="mspace" style="margin-right:0.1667em;"></span><span
                                  class="mord mathnormal" style="margin-right:0.03588em;">y</span><span
                                  class="mpunct">,</span><span class="mspace"
                                  style="margin-right:0.1667em;"></span><span class="mord mathnormal"
                                  style="margin-right:0.04398em;">z</span><span
                                  class="mclose">)</span></span></span></span><span
                            class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                            style="height:0.95em;"><span></span></span></span></span></span><span
                      class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep"
                      style="width:0.5em;"></span><span class="col-align-c"><span class="vlist-t vlist-t2"><span
                          class="vlist-r"><span class="vlist" style="height:1.45em;"><span
                              style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span
                                class="mord"><span class="mrel">=</span></span></span><span
                              style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span
                                class="mord"><span class="mrel">=</span></span></span></span><span
                            class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                            style="height:0.95em;"><span></span></span></span></span></span><span
                      class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep"
                      style="width:0.5em;"></span><span class="col-align-r"><span class="vlist-t vlist-t2"><span
                          class="vlist-r"><span class="vlist" style="height:1.45em;"><span
                              style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span
                                class="mord"><span class="mord mathnormal">a</span></span></span><span
                              style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span
                                class="mord"><span class="mord mathnormal">x</span><span class="mspace"
                                  style="margin-right:0.2222em;"></span><span class="mbin">+</span><span
                                  class="mspace" style="margin-right:0.2222em;"></span><span
                                  class="mord mathnormal" style="margin-right:0.03588em;">y</span><span
                                  class="mspace" style="margin-right:0.2222em;"></span><span
                                  class="mbin">+</span><span class="mspace"
                                  style="margin-right:0.2222em;"></span><span class="mord mathnormal"
                                  style="margin-right:0.04398em;">z</span></span></span></span><span
                            class="vlist-s">&#x200B;</span></span><span class="vlist-r"><span class="vlist"
                            style="height:0.95em;"><span></span></span></span></span></span><span
                      class="arraycolsep" style="width:0.5em;"></span></span></span></span></span></span></span>
      </p>
    </td>
    <td>
      <pre data-role="codeBlock" data-info="LaTeX" class="language-latex"><span class="token function selector">\begin</span><span class="token punctuation">{</span><span class="token keyword keyword-array">array</span><span class="token punctuation">}</span><span class="token punctuation">{</span>lcr<span class="token punctuation">}</span>
z <span class="token punctuation">&amp;</span> = <span class="token punctuation">&amp;</span> a <span class="token function selector">\\</span>
f(x,y,z) <span class="token punctuation">&amp;</span> = <span class="token punctuation">&amp;</span> x + y + z
<span class="token function selector">\end</span><span class="token punctuation">{</span><span class="token keyword keyword-array">array</span><span class="token punctuation">}</span>
</pre>
    </td>
  </tr>
</tbody>
</table>
~~~

## (20) 括号

| 类型                                      | 符号                                                                                                                                                                 | LaTeX                                                                                                                                                                |
| :---------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 圆括号、小括号                            | $\left ( \frac{a}{b} \right )$                                                                                                                                       | `\left ( \frac{a}{b} \right )`                                                                                                                                       |
| 方括号、中括号                            | $\left [ \frac{a}{b} \right ]$~~~<br>~~~$\left \lbrack \frac{a}{b} \right \rbrack$                                                                                   | `\left [ \frac{a}{b} \right ]`~~~<br>~~~`\left \lbrack \frac{a}{b} \right \rbrack`                                                                                   |
| 花括号、大括号                            | $\left \{ \frac{a}{b} \right \}$~~~<br>~~~$\left \lbrace \frac{a}{b} \right \rbrace$                                                                                 | `\left \{ \frac{a}{b} \right \}`~~~<br>~~~`\left \lbrace \frac{a}{b} \right \rbrace`                                                                                 |
| 角括号                                    | $\left \langle \frac{a}{b} \right \rangle$                                                                                                                           | `\left \langle \frac{a}{b} \right \rangle`                                                                                                                           |
| 单竖线和双竖线                            | $\left \vert \frac{a}{b} \right \vert$~~~<br>~~~$\left \Vert \frac{c}{d} \right \Vert$                                                                               | `\left \vert \frac{a}{b} \right \vert`~~~<br>~~~`\left \Vert \frac{c}{d} \right \Vert`                                                                               |
| 取整函数与取顶函数                        | $\left \lfloor \frac{a}{b} \right \rfloor$~~~<br>~~~$\left \lceil \frac{c}{d} \right \rceil$                                                                         | `\left \lfloor \frac{a}{b} \right \rfloor`~~~<br>~~~`\left \lceil \frac{c}{d} \right \rceil`                                                                         |
| 斜线与反斜线                              | $\left / \frac{a}{b} \right \backslash$                                                                                                                              | `\left / \frac{a}{b} \right \backslash`                                                                                                                              |
| 上下箭头                                  | $\left \uparrow \frac{a}{b} \right \downarrow$~~~<br>~~~$\left \Uparrow \frac{a}{b} \right \Downarrow$~~~<br>~~~$\left \updownarrow \frac{a}{b} \right \Updownarrow$ | `\left \uparrow \frac{a}{b} \right \downarrow`~~~<br>~~~`\left \Uparrow \frac{a}{b} \right \Downarrow`~~~<br>~~~`\left \updownarrow \frac{a}{b} \right \Updownarrow` |
| 混合括号                                  | $\left [ 0,1 \right )$~~~<br>~~~$\left \langle \psi \right \vert$                                                                                                    | `\left [ 0,1 \right )`~~~<br>~~~`\left \langle \psi \right \vert`                                                                                                    |
| 使用`\left.`和`\right.`不显示某侧的括号； | $\left. \frac{A}{B} \right \} \to X$                                                                                                                                 | `\left. \frac{A}{B} \right \} \to X`                                                                                                                                 |


## (21) 括号尺寸

| 符号                                                                                                                                                                          | LaTeX                                                                                                                                                                         |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| $( \bigl( \Bigl( \biggl( \Biggl( \dots \Biggr] \biggr] \Bigr] \bigr] ]$                                                                                                       | `( \bigl( \Bigl( \biggl( \Biggl( \dots \Biggr] \biggr] \Bigr] \bigr] ]`                                                                                                       |
| $\{ \bigl \{ \Bigl \{ \biggl \{ \Biggl \{ \dots \Biggr\rangle \biggr\rangle \Bigr\rangle \bigr\rangle \rangle$                                                                | `\{ \bigl \{ \Bigl \{ \biggl \{ \Biggl \{ \dots \Biggr\rangle \biggr\rangle \Bigr\rangle \bigr\rangle \rangle`                                                                |
| $\vert \big \vert \Big \vert \bigg \vert \Bigg \vert \dots \Bigg \vert \bigg \vert \Big \vert \big \vert$                                                                     | `\vert \big \vert \Big \vert \bigg \vert \Bigg \vert \dots \Bigg \vert \bigg \vert \Big \vert \big \vert`                                                                     |
| $\lfloor \bigl\lfloor \Bigl\lfloor \biggl\lfloor \Biggl\lfloor \dots \Biggr\rceil \biggr\rceil \Bigr\rceil \bigr\rceil \rceil$                                                | `\lfloor \bigl\lfloor \Bigl\lfloor \biggl\lfloor \Biggl\lfloor \dots \Biggr\rceil \biggr\rceil \Bigr\rceil \bigr\rceil \rceil`                                                |
| $\uparrow \big\uparrow \Big\uparrow \bigg\uparrow \Bigg\uparrow \dots \Bigg\Downarrow \bigg\Downarrow \Big\Downarrow \big\Downarrow \Downarrow$                               | `\uparrow \big\uparrow \Big\uparrow \bigg\uparrow \Bigg\uparrow \dots \Bigg\Downarrow \bigg\Downarrow \Big\Downarrow \big\Downarrow \Downarrow`                               |
| $\updownarrow \big\updownarrow \Big\updownarrow \bigg\updownarrow \Bigg\updownarrow \dots \Bigg\Updownarrow \bigg\Updownarrow \Big\Updownarrow \big\Updownarrow \Updownarrow$ | `\updownarrow \big\updownarrow \Big\updownarrow \bigg\updownarrow \Bigg\updownarrow \dots \Bigg\Updownarrow \bigg\Updownarrow \Big\Updownarrow \big\Updownarrow \Updownarrow` |
| $/ \big/ \Big/ \bigg/ \Bigg/ \dots \Bigg\backslash \bigg\backslash \Big\backslash \big\backslash \backslash$                                                                  | `/ \big/ \Big/ \bigg/ \Bigg/ \dots \Bigg\backslash \bigg\backslash \Big\backslash \big\backslash \backslash`                                                                  |


## (22) 空格换行

| 序号                         | 符号           | LaTeX          |
| :--------------------------- | :------------- | :------------- |
| 双空格                       | $a \qquad b$ | `a \qquad b` |
| 单空格                       | $a \quad b$ | `a \quad b` |
| 字符空格                     | $a\ b$ | `a\ b` |
| 文本模式中的字符空格         | $a \text{ } b$ | `a \text{ } b` |
| 大空格                       | $a\;b$ | `a\;b` |
| 小空格                       | $a\,b$ | `a\,b` |
| 极小空格                     | $ab$ | `ab` |
| 极小空格（用于区分语法）     | $a b$ | `a b` |
| 无空格（用于区分多字母变量） | $\mathit{ab}$ | `\mathit{ab}` |







