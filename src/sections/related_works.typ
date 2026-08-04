= Related Works

Micro expression detection remains a substantially difficult task, and reliably identifying the 
onset, apex, and offset phases is a prerequisite for any downstream analysis. A number of studies 
have developed spotting methods that exploit facial motion information to localize the onset of 
an expression change. Optical flow based approaches are commonly used because they can represent 
subtle motion that unfolds over an extremely short duration @he2022micro, @yu2024micro. Beyond 
improving the accuracy of phase detection, recent work has also placed growing emphasis on 
computational efficiency to support real-time deployment. In this context, methods based on apex 
frames, feature tracking, and phase representation have demonstrated the ability to reduce 
computational complexity without materially sacrificing detection performance @choirina2025improved, 
@fang2023rmes.

Recent studies have likewise increasingly relied on deep learning architectures capable of extracting 
information from micro-expressions effectively. Lightweight CNN architectures are widely used to 
strike a balance between accuracy and computational efficiency for real-time applications 
@belaiche2020cost, @lai2023real. Other work leverages attention mechanisms, hierarchical representations, 
and spatio-temporal feature-fusion strategies to improve a model's ability to recognize micro 
expressions from subtle motion representations @zhou2023dual, @wang2024htnet. More recent trends 
also point toward Transformer based architectures and the integration of large language models to 
capture more complex temporal relationships and to improve the interpretation of an individual's 
emotional state @romero2025micro, @salagean2025seeing. Notably, few of these efforts have been 
validated end-to-end under live, real-time operating conditions, a gap the present study 
directly targets.
