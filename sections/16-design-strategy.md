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
## Control Systems

### Robot Code

Well-structured code is a critical competitive advantage. Code is written for human readability and maintainability. To boost understandability and prevent confusion, avoid silly names without descriptive meaning and intentional misspellings (e.g., *bobot*, *dwive*). Game pieces and field elements must follow official FRC names (e.g., *coral*). Focus on complex problems that directly boost performance on the field, and "stand on the shoulders of giants" by using tested community solutions over starting from scratch.

Use Command-Based WPILib programming. Follow [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html) conventions and enforce code formatting via Spotless. Robot code is managed on GitHub. New code is placed on a branch with a descriptive name (`name/task`) and merged to `main` only after code review, automated status checks, and physical testing on a robot or test board.

Offload tasks to smart hardware (coprocessors and motor controllers) to optimize performance. Use closed-loop control for motors and consider motion profiling for position control. Use LEDs to communicate status to drivers, operators, human players, and programmers.

To maintain clean architecture:

* Use WPILib Java Units to increase clarity and eliminate unit errors.
* Avoid dynamic or on-device configuration in favor of source-controlled configurations.
* Log data using Telemetry, Epilogue, WPILib DataLog, or CTRE SignalLogger.
* Use the Elastic dashboard for the drive team.

While AI can read and generate poorly structured code, prioritize human readability and maintainability. FRC is an educational environment where writing clean code enables an understanding of software design and team collaboration. Conduct meaningful peer reviews rather than relying on AI to interpret logic. In the pits, turnaround is fast, online AI access and Wi-Fi are unreliable, and quick debugging under pressure requires an immediate understanding and trust of what is on the screen. AI is an extremely valuable tool, but people are ultimately accountable for the code deployed to the robot.

Team laptops are dedicated assets that must remain at school unless approved by a coach. Laptops should be shut down daily, updated, rebooted, and never put away with a dead battery. Before events, the `main` branch must contain fully tested competition code. Pack two Driver Station laptops (primary and backup) that are updated, charged, have Windows updates paused, and have the latest code and programming tools.

Untested code will produce errors. The appetite for change decreases as competition approaches. Only critical, fully tested changes will happen at competition. No untested changes are deployed prior to non-practice matches. Issues identified during practice are debugged immediately to prevent match failures.

### Electrical

Batteries must be protected, easily accessible, and horizontally mounted when practical. Battery connectors are always zip-tied together on the field, and all battery contacts/lugs are soldered. All competition batteries are tested after kickoff but before competition. All competition batteries are retired after two seasons.

Secure wire connections are critical. Minimize splices and unions in wire runs by making complete custom-length runs whenever possible. Use soldered, screw-terminal, or locking connectors when available. Only use quick connectors like Anderson Powerpoles and Wagos when necessary, or for quick repairs when time is more critical than durability.

Give every connection a smart tug check, and re-secure any loose connections. Use zip-ties for clean cable management, taking care not to overtighten them so mechanisms can flex freely without tugging on wires. Always allow for proper strain relief at all connection points — do not pull wires taut, and properly secure any slack or service loops.
