= Conclusion and Discussion

The results show that a TV-L1 optical flow based motion representation, combined with Region of 
Interest (ROI) constraints, is able to capture the low amplitude facial changes that characterize micro 
expressions. Restricting the analysis to the eyebrow, eye, and lip regions helps concentrate the 
analysis on the most informative areas of the face while simultaneously reducing computational 
complexity, which in turn supports real-time deployment.

On the phase detection front, the prominence based apex spotting method exhibits reasonably 
strong consistency on both the CASME II and SAMM datasets. Although the resulting MAE has not 
yet fully reached an ideal target, the evaluation shows that the majority of predictions land close 
to the true apex position. This finding indicates that the optical flow magnitude signal can serve 
as an effective indicator for automatically localizing the micro expression phase, an outcome that 
directly supports the feasibility of fully automatic, annotation free apex spotting as a building 
block for real-time systems.

At the classification stage, the Temporal CNN yields the highest validation accuracy, while the 
Transformer demonstrates stronger cross domain generalization. This contrast suggests that CNN 
based models are more effective at learning dataset specific patterns in the training data, whereas 
the Transformer is better able to sustain performance when confronted with variation across 
different subjects. Taken together with the latency results—an average end-to-end processing 
time of 65.67 ms—these findings substantiate the paper's central contribution: a complete, 
automatic, and genuinely real-time micro expression pipeline for anxiety recognition is achievable 
on ordinary web infrastructure, closing a gap that most prior offline, laboratory bound micro 
expression research has left open. Future work will focus on narrowing the validation to test 
generalization gap, most likely through larger and more diverse subject pools, domain adaptation 
techniques, and hybrid CNN-Transformer architectures, while preserving the real-time latency 
budget established in this study.
