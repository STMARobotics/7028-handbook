# 7028 Design Strategy

\begin{tcolorbox}[strategybox]
{\large\color{BattalionBlue}\bfseries Design}

\vspace{6pt}
\textit{Required}

\noindent\rule{\linewidth}{0.4pt}

\begin{itemize}\tightlist
  \item Robot fully designed in CAD
  \item Structurally stable and durable
  \item Designed in inches to the 0.000
  \item Full scope robot for regional 1
  \item Nothing as an "afterthought"
  \item Lighten the load for automation
\end{itemize}

\vspace{8pt}

\begin{tabular}{p{0.45\linewidth} | p{0.45\linewidth}}
\textit{Favor} & \textit{Avoid} \\
\hline
Simple and robust & Actuating claws/grabbers \\
Proven designs & Relying on human player skill \\
Low center of mass & Game piece dead zones \\
Large acquisition zone & Tight margins on perimeter and weight \\
Hard contact with soft game pieces & Pneumatics \\
Soft contact with hard game pieces & Over-complexity \\
Easy maintenance & Moving parts that share space \\
\end{tabular}

\end{tcolorbox}

\begin{tcolorbox}[strategybox]
{\large\color{BattalionBlue}\bfseries Build \& Manufacturing}

\vspace{6pt}
\textit{Required}

\noindent\rule{\linewidth}{0.4pt}

\begin{itemize}\tightlist
  \item Backup parts
  \item Locktite on all threaded fasteners
  \item Follow manufacturer instructions for assembling COTS parts
  \item Bumpers changeable in under 2 minutes
\end{itemize}

\vspace{8pt}

\begin{tabular}{p{0.45\linewidth} | p{0.45\linewidth}}
\textit{Favor} & \textit{Avoid} \\
\hline
Rivets for connecting thin material & Hand cut/drilled holes \\
Snap rings for retaining shafts & 1/8" aluminum \\
Button head cap screws & \\
Consistent hardware types & \\
\end{tabular}

\end{tcolorbox}

\begin{tcolorbox}[strategybox]
{\large\color{BattalionBlue}\bfseries Control Systems}

\vspace{6pt}
\textit{Required}

\noindent\rule{\linewidth}{0.4pt}

\begin{itemize}\tightlist
  \item Recently tested, "MK" brand batteries $<$2 years old
  \item Soldered battery connectors
  \item Zip-tied battery connectors
  \item Anderson connectors for motors
  \item Wagos for all CAN and small gauge
  \item Ferrules for all push button connectors
  \item Mini power modules for branch circuits
  \item Smart tug all wires
  \item Motion profiling for position
  \item Closed loop for rotation
  \item LEDs to communicate robot state
\end{itemize}

\vspace{8pt}

\begin{tabular}{p{0.45\linewidth} | p{0.45\linewidth}}
\textit{Favor} & \textit{Avoid} \\
\hline
Practical automation & Non-locking connectors \\
Encoders for things that move & Exposed/vulnerable wires \\
Limit switches and hard stops for limited range of motion & \\
Horizontally mounted battery & \\
\end{tabular}

\end{tcolorbox}
