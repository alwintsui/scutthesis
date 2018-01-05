## To make front page ##
1. open thesis_cover.doc
2. fill the information as intended
3. save as pdf
4. open the scutthesis.tex using tex editor, then compile using xelatex

## To make pseudo code algorithm ##
1. add \usepackage{algorithmic}

2. write the algorithm as follows

2.1.       \begin{algorithm}[htb]。
2.2.       \caption{the title of algorithm}。
2.3.       \label{alg:nice}。
2.4.       \begin{algorithmic}[1]
2.5.       ......
2.6.       \end{algorithmic}
2.7.       \end{algorithm}
