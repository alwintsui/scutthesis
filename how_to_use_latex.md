## To make front page ##
1. open thesis_cover.doc
2. fill the information as intended
3. save as pdf
4. open the scutthesis.tex using tex editor, then compile using xelatex

## To make pseudo code algorithm ##
1. add \usepackage{algorithmic}
2. write the algorithm as follows
2.1       \begin{algorithm}[htb]
          \caption{the title of algorithm}
          \label{alg:nice}
          \begin{algorithmic}[1]
          ......
          \end{algorithmic}
          \end{algorithm}


1.       采用RequirePackage指令导入longtable包，并修正“研究成果”节表格无法自动分页的错误。
2.       修正chapterx指令奇偶页眉互换错误，影响“参考文献”、“攻读＊＊＊的研究成果”和“致谢”节的页眉切换。
3.       修正在最新tex发行版下xeCJK包的CJKnumber选项deprecated的错误，额外引入新包CJKnumb。
