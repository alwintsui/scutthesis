## To make front page ##
1. open thesis_cover.doc
2. fill the information as intended
3. save as pdf
4. open the scutthesis.tex using tex editor, then compile using xelatex

## To make pseudo code algorithm ##
A. add \usepackage{algorithmic}

B. write the algorithm as follows

1.       \begin{algorithm}[htb]。
2.       \caption{the title of algorithm}。
3.       \label{alg:nice}。
4.       \begin{algorithmic}[1]
5.       ......
6.       \end{algorithmic}
7.       \end{algorithm}
