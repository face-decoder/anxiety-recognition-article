= Methodology

== Overview

This study develops a facial-micro-expression based anxiety-recognition system that operates in 
real time through a web platform. The system pipeline consists of five main stages: facial video 
acquisition, motion extraction via TV-L1 optical flow, micro-expression phase detection, feature 
representation construction, and classification using a deep-learning model. The entire process runs 
end-to-end on the server, so that analysis results can be returned to the user immediately.

== Data Acquisition and Preprocessing

Facial video is captured from the user's webcam through the web client. Each video clip is processed 
by detecting the face and extracting facial landmarks. The resulting landmarks are also used to 
perform face alignment, minimizing head pose variation so that the analysis remains focused on 
expression changes rather than head movement. Following alignment, several Regions of Interest (ROI) 
that play a central role in micro expression formation are selected: the eyebrow, eye, and lip regions.

Inter frame facial motion is represented using TV-L1 optical flow. This method was chosen because it 
produces stable motion estimates under low-amplitude facial changes and is more robust to noise and 
illumination variation than conventional optical-flow approaches, which is a property that is decisive when the 
target signal is a brief, low-amplitude micro-expression rather than an exaggerated macro-expression 
@wedel2009improved, @zach2007duality.

== Apex-Phase Spotting

Micro-expression detection is performed by analyzing the optical flow magnitude signal computed 
across all ROIs. Motion magnitude is accumulated into a temporal signal that describes the 
intensity of facial change throughout the video. Candidate apex frames are identified using a 
prominence based peak detection method, so that only genuinely significant motion peaks are retained.

Once the apex frame has been identified, the onset and offset phases are determined using a 
dynamic threshold computed from the local characteristics of the signal. This design allows the 
system to generate a complete onset-apex-offset phase representation automatically, without 
requiring manual annotation, an essential property for any system intended to operate in real time 
rather than in an offline, annotation-assisted setting.

== Pipeline and Evaluation

The frame range obtained from the apex spotting process is used to form a single micro expression 
episode. From each ROI, a set of optical flow derived behavioral descriptors is extracted, as 
summarized in @tab:behavioral_features.

#figure(
  caption: [Description of Behavioral Feature Representation],
  table(
    columns: (auto, 1fr),
    align: (left, left),
    table.header([*Feature Matrix*], [*Description*]),
    [Mean $d x$ and $d y$], [Average horizontal and vertical displacement of a facial region],
    [Magnitude and Motion Energy], [Intensity of facial movement],
    [Direction Consistency], [Consistency of facial motion intensity],
    [Acceleration and Jerk], [Temporal dynamics of motion change],
    [Pairwise Synchronization], [Degree of synchronization between facial regions],
    [Facial Symmetry], [Balance between the left and right sides of the face],
  )
) <tab:behavioral_features>

The combination of features produces a representation that captures not only the magnitude of 
facial movement, but also inter-region coordination, temporal dynamics, and the balance of 
activity that emerges during an expression.

The classification stage uses a CNN model designed to capture spatial and temporal patterns 
simultaneously. The model architecture is illustrated in @fig:fig1.

#figure(
  image("../assets/fig1.png", width: 90%),
  caption: [Temporal CNN-based classification architecture.],
) <fig:fig1>

In addition to the primary model, this study also conducts a comparative evaluation against several 
temporal models, namely BiLSTM, Temporal Convolutional Network (TCN), and Transformer, to analyze how 
different temporal-modeling strategies affect classification performance.

We also evaluate along two principal axes: micro expression phase detection and anxiety state 
classification. Apex spotting performance is evaluated using Mean Absolute Error (MAE) between the 
predicted and ground-truth apex frames on the CASME II and SAMM datasets. Classification 
performance, in turn, is evaluated using accuracy, precision, recall, F1-score, and balanced 
accuracy. Beyond accuracy metrics, the system is also tested under real-time conditions by 
measuring end-to-end latency, confirming that the entire pipeline can run continuously in a live 
production environment rather than only in a controlled, offline benchmark.
