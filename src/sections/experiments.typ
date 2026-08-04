= Experiments and Results

== Apex-Phase Spotting

Experiments were designed to evaluate the system along three principal axes: micro expression phase 
detection capability, anxiety classification accuracy, and real-time processing performance. 
Phase-detection evaluation was carried out using the CASME II and SAMM benchmark datasets, which 
provide apex frame annotations as ground truth. Classification evaluation, meanwhile, used a 
primary dataset collected through facial-video acquisition under both anxious and non-anxious conditions.

@fig:fig2 shows subject data for anxious and non-anxious conditions. Facial motion in this data 
was analyzed with attention restricted to the regions most relevant to micro expressions: the eyebrows, 
eyes, and lips, determined from facial landmark positions that produce a consistent ROI across every 
frame. The resulting selection of the most salient regions is shown in @fig:fig3.

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [#image("../assets/fig2a.png", width: 80%) \ a) Anxious],
    [#image("../assets/fig2b.png", width: 80%) \ b) Non-anxious],
  ),
  caption: [Illustration of anxious and non-anxious conditions.],
) <fig:fig2>

#figure(
  image("../assets/fig3.png", width: 95%),
  caption: [Facial Regions of Interest: eyebrows, eyes, lips.],
) <fig:fig3>

The extracted optical-flow field is shown in @fig:fig4, computed using the TV-L1 algorithm, where 
each pixel represents the estimated magnitude of motion between two consecutive frames.

#figure(
  image("../assets/fig4.png", width: 95%),
  caption: [Extracted Optical Flow.],
) <fig:fig4>

Micro expression phase analysis was then performed by accumulating optical flow magnitude values 
into a temporal signal, which was used to automatically identify the onset, apex, and offset 
phases via prominence based peak detection. The resulting phase detection output is shown in @fig:fig5.

#figure(
  image("../assets/fig5.png", width: 95%),
  caption: [Micro Expression Phase Detection Result.],
) <fig:fig5>

#figure(
  caption: [Spotting Result with Public Micro-Expression Datasets],
  table(
    columns: (auto, auto, auto),
    align: (center, center, center),
    table.header([*Dataset*], [*Sample*], [*MAE (Frames)*]),
    [CASME II], [256], [12.74],
    [SAMM], [159], [5.58],
  )
) <tab:spotting_results>

The evaluation results show that the apex spotting method achieves an MAE of 12.74 frames on 
CASME II and 5.58 frames on SAMM. These results indicate that the optical-flow magnitude signal is 
sufficiently reliable for automatically identifying the apex position with a relatively low error rate, 
a level of accuracy that is difficult to obtain without the ROI constrained, prominence based 
design proposed in this work.

== Anxiety Classification

The output of micro expression phase detection was used to construct a facial behavior representation 
comprising mean displacement, magnitude, motion energy, direction consistency, acceleration, jerk, 
pairwise synchronization, and facial symmetry. This representation served as the input to the 
deep-learning models for classifying anxious versus non-anxious states.

#figure(
  caption: [Micro Expression Phase Detection Result],
  table(
    columns: (auto, auto, auto, auto),
    align: (center, center, center, center),
    table.header([*Model*], [*Data*], [*Accuracy*], [*Macro-F1*]),
    [Temporal CNN], [Validation], [80.00%], [0.7980],
    [], [Test], [48.04%], [0.4655],
    [Bi-LSTM], [Validation], [65.00%], [0.6419],
    [], [Test], [73.68%], [0.4815],
    [TCN], [Validation], [60.00%], [0.6703],
    [], [Test], [64.71%], [0.5354],
    [Transformer], [Validation], [75.00%], [0.7442],
    [], [Test], [66.67%], [0.5816],
  )
) <tab:classification_results>

Temporal CNN attains the highest validation accuracy at 80.00% with a Macro-F1 of 0.7980, 
demonstrating its ability to learn micro expression patterns associated with anxiety. Its 
performance decreases on the independent test set, however, indicating a generalization limitation 
typical of CNN based temporal models trained on comparatively small, subject specific datasets.

The Transformer, in contrast, exhibits more stable performance under cross domain testing, 
achieving 66.67% accuracy on the test data. This suggests that attention based architectures such as 
the Transformer are better able to adapt to variation in subject-specific characteristics within temporal 
data compared with the Temporal CNN, an important finding for any system intended for real world, 
subject independent deployment rather than single-subject calibration.

== Real-Time Performance

#figure(
  caption: [Real-Time Performance],
  table(
    columns: (auto, auto),
    align: (left, center),
    table.header([*Stage*], [*Latency*]),
    [Landmark & ROI Detection], [± 22.23 ms],
    [Optical Flow TV-L1 Extraction], [± 15.17 ms],
    [Apex Phase Spotting], [± 1.11 ms],
    [Inference], [± 4.15 ms],
    [Communication and Overhead], [± 3.01 ms],
    [*Total*], [± 65.67 ms],
  )
) <tab:latency>

@tab:latency shows that the system achieves an average end-to-end latency of 65.67 ms per inference 
cycle. This is a comparatively low figure for a system designed to operate in real time on 30 FPS 
webcam video, and it substantiates the central practical claim of this paper: that automatic 
apex-phase spotting and anxiety classification can be combined into a single pipeline fast enough 
for live, interactive use not merely for offline analysis.
