#let abstract_text = [
  Real-time micro-expression analysis remains challenging due to the subtle intensity and 
  extremely short duration of facial movements, making accurate spotting and recognition 
  difficult. Recent studies have explored optical flow, Region of Interest (ROI)-based 
  analysis, and deep learning for micro-expression recognition. However, most existing 
  approaches primarily focus on offline emotion recognition and rarely integrate automatic 
  apex spotting with real-time anxiety recognition in a unified and computationally 
  efficient pipeline. This study proposes an end-to-end web-based framework for real-time 
  anxiety recognition using facial micro-expressions. The proposed framework combines 
  WebRTC-based video acquisition, ROI-constrained TV-L1 optical flow for motion 
  representation, automatic apex spotting using prominence-based peak detection, and 
  temporal deep learning models for anxiety classification. Four architectures, namely 
  Temporal CNN, BiLSTM, Temporal Convolutional Network (TCN), and Transformer, were 
  evaluated. Experimental results show that the proposed apex spotting method achieved 
  Mean Absolute Error (MAE) values of 12.74 and 5.58 frames on the CASME II and SAMM 
  datasets, respectively. Among the evaluated models, CNN Temporal achieved the highest 
  validation accuracy of 80.00%, while the Transformer demonstrated the best 
  cross-domain generalization with 66.67% accuracy on an independent test set. 
  Furthermore, the complete pipeline achieved an end-to-end latency of 65.67 ms, 
  demonstrating its feasibility for real-time anxiety recognition through a web-based platform.
]

#let keywords = (
  "Micro-expression Recognition",
  "Anxiety Recognition",
  "Optical Flow",
  "Apex Phase Spotting",
  "Real-Time Processing",
)
