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
