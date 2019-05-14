

# A Pseudo-Blind Convolutional Neural Network for the Removal of Artifacts in Compressed Image and Video (CSVT 2019)
<img src = "/Figures/real_comp.png" width="430"> <img src = "/Figures/real_processed.png" width="430"> 
Left: a frame from an input sequence that is captured by a smartphone with AVC and then transcoded to MPEG, Right: the result of processing the frame by our IACNN-E

# Abstract
This paper presents methods based on convolutional neural networks (CNNs) for removing compression artifacts. We modify the Inception module for the image restoration problem and use it as a building block for constructing blind and non-blind artifact removal networks. It is known that a CNN trained in a non-blind scenario (known compression quality factor) performs better than one trained in a blind scenario (unknown factor), and our network is not an exception. However, the blind system is more practical because the compression quality factor is not always available or does not reflect the actual quality when the image is a transcoded or requantized image. Hence, in this paper, we also propose a pseudo-blind system that estimates the quality factor for a given compressed image and then applies a network that is trained with a similar quality factor. For this purpose, we propose a CNN that estimates the compression quality factor and prepare several non-blind artifact removal networks that are trained for some specific compression quality factors. We train the networks and conduct experiments on widely used compression standards, such as JPEG, MPEG-2, H.264, and HEVC. In addition, we conduct experiments for dynamically changing and transcoded videos to demonstrate the effectiveness of the quality estimation method. The experimental results show that the proposed pseudo-blind network performs better than the blind one for the various cases stated above and requires fewer computations. 

# Test Code
The code is implemented with caffe + matlab

Trained download: [[link]](http://ispl.synology.me:8480/sharing/csGfNlzmu)
# Network Architecture
<img src = "/Figures/network1.png" width="900">
The process of the pseudo-blind compression artifact removal scheme. The consecutive frames from the input video are used for the QP estimation, and the network trained with a similar QP is applied to the whole frame. That is, the artifact removal is not performed patch by patch for efficiency.


## Video Comparison
  * Video Comparison: [Youtube Link] (Re-compressed by Youtube)
  * Video YUV Download: [Link] (900M)
  * YUV player: [Link] (50M)




# Experimental Results
## Standard Compression
### Quantitative Comparison
<img src = "/Figures/table.PNG" width="900">

### Visual Comparison
<img src = "/Figures/avc.PNG" width="900">

## Dynamic Compression
<img src = "/Figures/fig15.PNG" width="800">
The GT and results of QP estimation where sequences are synthetically generated from ReadySteadyGo.
<img src = "/Figures/fig16.PNG" width="600">
The sequence of PSNR before/after applying our IACNN-E, and the actual QP and estimated QP.

## Related Work
### JPEG Artifact Reduction
#### [AR-CNN] Deep Convolution Networks for Compression Artifacts Reduction <paper-button> <a href="http://mmlab.ie.cuhk.edu.hk/projects/ARCNN.html">Link</a> </paper-button>
### HEVC Intra
#### [VRCNN] A Convolutional Neural Network Approach for Post-Processing in HEVC Intra Coding <paper-button> <a href="https://arxiv.org/pdf/1608.06690.pdf"> Link</a> </paper-button>
### CNN-based HEVC In-loop filter
#### [IFCNN] CNN-based in-loop filtering for coding efficiency improvement <paper-button> <a href="http://ieeexplore.ieee.org/document/7528223/"> Link</a> </paper-button>

# Citation
```
@article{kim2019pseudo,
  title={A Pseudo-Blind Convolutional Neural Network for the Reduction of Compression Artifacts},
  author={Kim, Yoonsik and Soh, Jae Woong and Park, Jaewoo and Ahn, Byeongyong and Lee, Hyun-Seung and Moon, Young-Su and Cho, Nam Ik},
  journal={IEEE Transactions on Circuits and Systems for Video Technology},
  year={2019},
  publisher={IEEE}
}
```
