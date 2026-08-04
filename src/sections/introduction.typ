= Introduction

Anxiety is an internal emotional state that is difficult to observe reliably through casual 
observation, largely because individuals can consciously suppress or mask outward expressions 
of how they feel. Yet the true emotional state often leaks through in brief, subtle facial changes 
known as emotional leakage @ekman2009telling. This phenomenon suggests that micro expressions can 
serve as a behaviorally relevant indicator for uncovering latent emotional states that are 
otherwise difficult to conceal deliberately @keshari2023facial. The relevance of this line of 
research has grown considerably across evaluative settings such as job interviews, presentations, 
and question and answer sessions. In the context of the transition into professional life, anxiety 
commonly arises from uncertainty about one's career future @elfina2023career, @bayram2025mediating. 
Situational pressure during communication has likewise been shown to trigger anxiety responses 
that influence an individual's behavior throughout an interaction @putri2024speaking.

By definition, micro expressions are extremely brief, typically lasting between 0.04 and 0.3 
seconds and are characterized by low-intensity, spatially localized facial movement @li2024could. 
These characteristics make micro expressions difficult to observe consistently, even for trained 
human observers. Consequently, a substantial body of research has turned to computer based 
approaches for detecting facial changes objectively and automatically. Among the available 
techniques, optical-flow-based motion representation has emerged as one of the most widely 
adopted approaches, owing to its ability to effectively capture both the direction and magnitude 
of facial movement between frames @almalki2022analysis. In addition, constraining analysis to active 
Regions of Interest (ROI) such as the eyebrows, eyes, and mouth has been shown to simultaneously 
increase detection sensitivity and reduce computational complexity @rosiani2021micro, @zhang2024micro.

As micro-expression research has matured, a range of approaches based on optical flow, 
expression-phase detection, and deep learning have been developed to capture subtle facial motion 
and automatically recognize expression patterns @tran2020micro, @he2022micro, @yu2024micro. However, 
the majority of existing work remains confined to recognizing basic emotions under controlled 
laboratory conditions and is processed offline. What remains conspicuously underexplored is the 
use of micro-expressions to validate anxiety states under genuinely real-time conditions and, 
more specifically, the integration of apex spotting, motion representation, and temporal 
classification into a single, efficient, end-to-end pipeline capable of operating live. This gap 
is precisely where the present work is positioned, not merely as an incremental improvement to any 
one component, but as a demonstration that these components can be unified into a coherent 
real-time system without sacrificing either detection accuracy or responsiveness.

To address this gap, we propose an anxiety recognition framework built on facial micro expressions 
that combines TV-L1 optical-flow motion representation, spatial constraint via facial ROIs, 
prominence based micro expression phase detection with a dynamic threshold, and classification 
through a purpose-built Temporal CNN. TV-L1 optical flow was selected for its capacity to maintain 
stable motion estimation under low-amplitude facial changes and its robustness to noise, 
illumination variation, and outlier data @wedel2009improved, @zach2007duality, which are properties that 
are essential when the signal of interest is, by definition, faint and fleeting.

The main contributions of this study are as follows: (1) an efficient, ROI-based motion 
representation designed explicitly for real-time micro-expression analysis, (2) a fully automatic 
apex-phase spotting method, evaluated on the CASME II and SAMM benchmark datasets, that removes the 
need for manual annotation at inference time, (3) a comparative evaluation of several temporal deep 
learning architectures for anxiety classification, including a cross domain generalization test that 
is rarely reported in prior real-time micro expression work, and (4) the implementation and 
empirical evaluation of a complete end-to-end pipeline that recognizes anxiety in real time. 
Taken together, these contributions position the proposed system as one of the few reported 
pipelines that jointly achieve automatic apex spotting, anxiety specific classification, and sub 
100 millisecond end-to-end latency within a single deployable architecture, the core novelty 
this paper puts forward for real-time micro-expression recognition.
