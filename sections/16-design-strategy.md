# 7028 Design Strategy

## On Convenience
Of course we all like things that are convenient, but we need to be careful about how we weight that convenience in our decision making process. Never settle for an alternate, less effective solution just because it is convenient. "I'm doing this because it is convenient" and "I'm doing this because I ran out of time and this is faster" can be the most detrimental lines of thought to an FRC season. The convenience of a less effective solution is paid for in future failures.

Take for example 3d printed parts; incredibly convenient to produce but lack the strength of other building materials like aluminum or polycarbonate. Just because they are convenient doesn't mean that we should never use them. There are plenty of totally valid use cases for 3d printed parts, but they should never be a substitute for a part that *should* have been manufactured from a stronger material. If you are okay with the part breaking, then go ahead and 3d print it.

7028 used to lump battery access and replacement into this same cateogry of convenience. When the student changing the battery would complain about how difficult and time consuming changing the battery was, design students and mentors would reply with something like "Convenience of changing the battery doesn't effect our performance, get used to it". We have learned the hard way that long and convoluted battery changes lead to compounding time loss throughout the season. How many batteries do we change in a season? A five minute battery change time eats an hour of time after just 12 battery changes. 

## Prototyping
For some members, prototyping is the most fun and exciting few weeks of their robotics season. Trying new ideas, seeing mechanisms work for the first time, experiencing unexpected results, and rapidly iterating is truly some of the most exciting work to be done in FRC- and also the most important.

Prototyping defines the pace of the entire build season. Spending too much time chasing a wild idea, or skipping vital tests for a subsystem has the potential cause cascading missed deadlines and failures. For this reason, prototyping on 7028 needs to be purposeful and effective. The hardest parts of this equation are deciding on *what* needs to be prototyped, and *when* those prototype cycles are finished.

Every prototype must answer the question, *"Why are we doing this?"* before it earns resources. Prototypes exist to home in on the most effective geometry and structure, and their most valuable output is specific relationships and values: compression, spacing, durometer, power/reduction, etc. Although this testing may lead to a *"This doesn't work"* moment, there is often no single *"This does work"* moment that definitively ends the prototype cycle. Each iteration refines the design further with diminishing returns, so the decision to stop is not always clear. This timing is crucial for an effective prototype cycle.

## "Kill Your Darlings"
No design is exempt from the data. The time, cost, or *cleverness* behind a prototype does not earn it a place in the final system; only its performance does. Personal attachment to a design is a bias, and it slows every decision that follows. When testing shows a competing concept performs better, the best practice is to abandon the original without hesitation. A discarded prototype is not wasted effort- simply knowing that it's not the right choice has value. Dropped ideas are not erased, they are crossed out.

## Design
Our competition robots will be fully designed in CAD in inches to 0.001" tolerance. Regional Competition week does not drive the initial scope of the robot- we will bring full scope robots to early season events. Robot designs are not static and should be iterated on throughout the season.

The archetypes we prefer are those with less moving parts, simpler solutions, and *robust* architecture. Robust doesn't just mean strong and resistant to breaking- it means performing the same way every match, regardless of field conditions, defense, or wear. Every added part is another point of failure, and every mechanism that depends on precise tuning, perfect alignment, or ideal game-piece placement is a liability. Ideally, the robots we make are boring to watch because they never do anything unexpected or off-script- they always do their job. This isn't the case to lower the bar, it's a challenge to design simple while also competing at the highest level.

Our robots will strive for:

* Indescriminant game piece acquisition
* Large game piece acquisition zones
* Low center of mass
* Hard contact with soft game pieces
* Soft contact with hard game pieces
* Non-reliance on perfect tuning
* Non-reliance on human player skill
* Low bumper change time

## Manufacturing & Assembly
Every part that we have the ability to manufacture in-house will be made in house. Parts that cannot be manufactured in house should be redesigned if possible. Typical instances of this include parts that have complex bends, fine geometry, or multi-axis milling requirements. Exceptions to this are things like custom sector gears that need to be waterjet cut and other parts that have no other reasonable substituion.

All threaded fasteners must have threadlock applied. When assembling COTS systems, follow manufacturer instructions. Aluminum rivets are our primary fastener type for connecting sheets/tubes. Snap rings are our primary retention method for shafts. Button head #10 cap screws are our primary threaded fastener.

Every hole, cut, and bend on our robot will be made with a computer controlled machine.

## Control Systems
### Robot Code
Well-structured code is a critical competitive advantage. Code is written for human readability and maintainability. To boost understandability and prevent confusion, avoid silly names without descriptive meaning and intentional misspellings (e.g., *bobot*, *dwive*). Game pieces and field elements must follow official FRC names (e.g., *coral*). Focus on complex problems that directly boost performance on the field, and "stand on the shoulders of giants" by using tested community solutions over starting from scratch.

Use Command-Based WPILib programming. Follow [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html) conventions and enforce code formatting via Spotless. Robot code is managed on GitHub. New code is placed on a branch with a descriptive name (`name/task`) and merged to `main` only after code review, automated status checks, and physical testing on a robot or test board.

Offload tasks to smart hardware (coprocessors and motor controllers) to optimize performance. Use closed-loop control for motors and consider motion profiling for position control. Use LEDs to communicate status to drivers, operators, human players, and programmers.

Use WPILib Java Units to increase clarity and eliminate unit errors. Avoid dynamic or on-device configuration in favor of source-controlled configurations. Log data using Telemetry, Epilogue, WPILib DataLog, or CTRE SignalLogger, and use the Elastic dashboard for the drive team.

While AI can read and generate poorly structured code, prioritize human readability and maintainability. FRC is an educational environment where writing clean code enables an understanding of software design and team collaboration. Conduct meaningful peer reviews rather than relying on AI to interpret logic. In the pits, turnaround is fast, online AI access and Wi-Fi are unreliable, and quick debugging under pressure requires an immediate understanding and trust of what is on the screen. AI is an extremely valuable tool, but people are ultimately accountable for the code deployed to the robot.

Team laptops are dedicated assets that must remain at school unless approved by a coach. Laptops should be shut down daily, updated, rebooted, and never put away with a dead battery. Before events, the `main` branch must contain fully tested competition code. Pack two Driver Station laptops (primary and backup) that are updated, charged, have Windows updates paused, and have the latest code and programming tools.

Untested code will produce errors. The appetite for change decreases as competition approaches. Only critical, fully tested changes will happen at competition. No untested changes are deployed prior to non-practice matches. Issues identified during practice are debugged immediately to prevent match failures.

### Electrical
Batteries must be protected, easily accessible, and horizontally mounted when practical. Battery connectors are always zip-tied together on the field, and all battery contacts/lugs are soldered. All competition batteries are tested after kickoff but before competition. All competition batteries are retired after two seasons.

Secure wire connections are critical. Minimize splices and unions in wire runs by making complete custom-length runs whenever possible. Use soldered, screw-terminal, or locking connectors when available. Only use quick connectors like Anderson Powerpoles and Wagos when necessary, or for quick repairs when time is more critical than durability.

Give every connection a smart tug check, and re-secure any loose connections. Use zip-ties for clean cable management, taking care not to overtighten them so mechanisms can flex freely without tugging on wires. Always allow for proper strain relief at all connection points — do not pull wires taut, and properly secure any slack or service loops.

## Asthetic Design
7028 takes the visual appearance of our robots seriously. It is very important to us that our robots visually represent the time and effort our members put into them. When sponsors, school administrators, and other FRC teams see our robot, we want them to see a product that impresses and represents our brand well.

The color scheme is as follows:

* Primary: PSB-10376 "Flat Dumbell Blue"
* Secondary: PSS-11181 "Super Durable Matte Black"
* Tertiary: PSB-8038 "Snow Buster"
* Accent: RAL 1021 Matte

Yellow and white parts should only ever be in contact with blue parts.

The rules below are a starting point and may be broken to maintain the spirit of the 7028 theme.

Blue:

* Plates
* Non-drivetrain tubes

Black:

* Belly/ brain pan
* Motor plates
* Gearbox plates
* Drivetrain tubes

White:

* Gussets

Yellow:

* Select accent parts
