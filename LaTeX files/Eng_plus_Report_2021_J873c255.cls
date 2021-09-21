\documentclass{article}

\title{ENG + Final Report}
\date{2021-20-09}
\author{Hasan Qamber (WSUID:J8732c55)}
\usepackage{hyperref}
\usepackage{graphicx}


\begin{document}


\maketitle
\pagenumbering{gobble}
\newpage
\pagenumbering{arabic}

\section{Introduction}

The objective of this research is to show that we can use information from a drone simulation to improve drone autonomy. Robot simulators can help us better detect anomalies and shows great potential at recognizing false alarms. Having the ability to create infinite runs and talking the data from these runs and compare them to each other helps us iron out the root of those anomalies.

\section{Background}
\subsection{Gazebo}

Gazebo is an open-source project used for 3D robotic simulation. Gazebo has the ability to realistically render environments including shadows, lighting, and textures. Gazebo can also simulate sensors that can sense the simulated environment. As I was not familiar with the Gazebo program, I had to utilize kanishkegb GitHub repository "Python - Gazebo Simulation Environment for a UAV with Geometric Control". This repository goes step by step on how to set up Gazebo and what dependencies that you need to have. As this is the first time I worked with ROS and Ubuntu, I spent a good chunk of my time to get Gazebo running. First, I had to download Virtual box before installing Ubuntu and it respected Ros. I used a tutorial from YouTube [2] to help me with the set up. I finished setting up the newest Ubuntu and its ROS. After that, I continued with the tutorial by setting up the repository and the Gazebo plugin. However, to my surprise, Gazebo was not running. We I reread the GitHub repository, I noticed that the Gazebo plugin only works on Ubuntu 18.04 and ROS melodic. Thus, after resetting everything up with Ubuntu 18.04 and ROS melodic, I tried running Gazebo again; It worked. Thus, I tried to execute a simple command to take off, but nothing happened. For some reason Gazebo was not responding to the code that I was writing. After watching multiple YouTube videos and searching google for hours, I couldn’t figure out the problem, so I had to switch to a different simulator.

\subsection{PX4 MAVROS}



PX4 is an open-source autopilot system used usually for cheap autonomous aircraft. Mavros is an ROS package that allows MAVLink extendable communication between computers running ROS. Thus, Mavros is the bridge between ROS and MAVLink protocol [6]. After installing Ubuntu and ROS, I followed the instruction on the docs.px4.io [6]. First, I used sudo apt to intall ros kinetic mavros. Then, I installed GeographicLib. After that, I installed MAVROS and MAVLink. Finally, I created the workspace, Installed GeographicLib datasets, and built the source.

\subsubsection{Running PX4 Mavros}

To start running PX4, open up a terminal, make sure you are inside Firmware and write "make px4 sitl default jmavsim" This will open up the jMAVsim.

 \includegraphics[width=\linewidth]{running1.png}

After that, open up another terminal and connect your ROS to the simulator using MAVROS. You can do that by sing the URL [7]

\includegraphics[width=\linewidth]{url.png}

As ROS is now connected, you can perform simple commands like commander takeoff and commander land.

 \includegraphics[width=\linewidth]{running2.png}


\subsection{Monitering}

Monitoring is the most important part to us and PX4 Mavros does not under deliver in that section. If we open a new terminal, write rqt, and go to the topic monitor section, we can monitor everything we can imagine; From altitude to global position. Thankfully, that gives us a way to detect if there are any anomalies during multiple runs.


 \includegraphics[width=\linewidth]{topic monitor.png}

 \includegraphics[width=\linewidth]{topic monitor 2.png}
\newpage

Another monitoring program we can use is QGroundControl. QGroundControl provides full flight control and vehicle setup for PX4 or ArduPilot powered vehicles [8]. QGroundControl has Flight map display showing vehicle position, flight track, waypoints and vehicle instruments [8]. It also has video streaming. QGC also has the ability to save the log of each flight preformed. One problem that I faced was that the new version does not work with Ubuntu 18; I found that QGC v4.0.11 works for Ubuntu 18.

 \includegraphics[width=\linewidth]{QGC.png}

\section{Lessons Learned}

I learned many new things during my research into this topic. I got familiar
with using ubuntu and Linux. This was my first-time using Linux, so it was
quit the learning curve. I was a little interested in robot autonomy, so I was
happy that I got the chance to learn the basics of robot autonomy. However,
the most useful skill that I learned is how to problem solve om the fly. The
number of problems that I faced during this research was tremendous. It felt
like every time a moved forward something happens to set me back two steps.
For example, when I installed Ubuntu 20.04 and then I found out that Gazebo
does not work on it, so I installed Ubuntu 18.04 and then found out that Gazebo
is not responding to the code I am writing. Finishing this research gave me the
confidence that I can solve any road block I may face in my future projects. I
feel like if I ran into a problem in the future, I wouldn’t get demoralized because
of it.
\newpage

\section{References}

[1]kanishkegb (2021) Python - Gazebo Simulation Environment for a UAV with Geometric Control 
\url {https://github.com/fdcl-gwu/uav_simulator}

[2]“How to Install Ubuntu 20.04 LTS on VirtualBox in Windows 10.” YouTube, 24 Apr. 2020, \url {youtu.be/x5MhydijWmc.} 

[3]“PX4 MAVROS Python Tutorial (Part 1).” YouTube, 24 Nov. 2020, 
\url{youtu.be/jBTikChu02E. }

[4]“PX4 MAVROS Python Tutorial (Part 2).” YouTube, 3 Jan. 2021, 
\url{youtu.be/rxt0aBnBeJI. }

[5]“Complete Guide - PX4 SITL - Gazebo - QGroundControl Installation.” YouTube, 27 Nov. 2019, \url{youtu.be/-zEddRFbMvQ. }

[6]“ ROS with Mavros Installation Guide.” ROS with MAVROS Installation Guide | PX4 User Guide, \url{docs.px4.io/master/en/ros/mavros_installation.html. }

[7]“ROS with Gazebo Simulation.” ROS with Gazebo Simulation | PX4 User Guide, \url{docs.px4.io/master/en/simulation/ros_interface.html. }

[8]“Overview.” Overview · QGroundControl User Guide, \url{docs.qgroundcontrol.com/master/en/index.html. }

\end{document}