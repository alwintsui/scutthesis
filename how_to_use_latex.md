## To make front page ##
1. open thesis_cover.doc
2. fill the information as intended
3. save as pdf
4. open the scutthesis.tex using tex editor, then compile using xelatex

## To make Equation ##
1.       \begin{equation}
2.       \label{eq:split} 
3.       \begin{split}
4.       y&=mx+c\\        & \quad(n+o)x+c\\        &=1
5.       \end{split}
6.       \end{equation}

## To make equation gathered
1.       \begin{gather}
2.       y=mx+c \label{eq:eq1}\\ 
3.       x=(n-2)+d \label{eq:eq2}
4.       \end{gather}

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
