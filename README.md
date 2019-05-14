

# A Pseudo-Blind Convolutional Neural Network for the Removal of Artifacts in Compressed Image and Video
<img src = "/Figures/caps_ARCNN.bmp" width="430"> <img src = "/Figures/caps_IACNNE.bmp" width="430"> 

Conventional method (ARCNN) / Proposed
# Abstract
This paper presents methods based on convolutional neural networks (CNNs) for removing compression artifacts. We modify the Inception module for the image restoration problem and use it as a building block for constructing blind and non-blind artifact removal networks. It is known that a CNN trained in a non-blind scenario (known compression quality factor) performs better than one trained in a blind scenario (unknown factor), and our network is not an exception. However, the blind system is more practical because the compression quality factor is not always available or does not reflect the actual quality when the image is a transcoded or requantized image. Hence, in this paper, we also propose a pseudo-blind system that estimates the quality factor for a given compressed image and then applies a network that is trained with a similar quality factor. For this purpose, we propose a CNN that estimates the compression quality factor and prepare several non-blind artifact removal networks that are trained for some specific compression quality factors. We train the networks and conduct experiments on widely used compression standards, such as JPEG, MPEG-2, H.264, and HEVC. In addition, we conduct experiments for dynamically changing and transcoded videos to demonstrate the effectiveness of the quality estimation method. The experimental results show that the proposed pseudo-blind network performs better than the blind one for the various cases stated above and requires fewer computations. 

# Test Code
The code is implemented with caffe + matlab

Trained download: [[link]](http://ispl.synology.me:8480/sharing/csGfNlzmu)
# Network Architecture



## Video Comparison
  * Video Comparison: [Youtube Link] (Re-compressed by Youtube)
  * Video YUV Download: [Link] (900M)
  * YUV player: [Link] (50M)




# Experimental Results
**Results of the average PSNR (dB) and SSIM for the testset**
<img src = "/Tables/PSNR.PNG" width="900">

**JPEG Detail Results
**MPEG Detail Results
**AVC Detail Results
**HEVC Detail Results

## Image Comparison
<img src = "/Figures/avc.PNG" width="900">

## Related Work
### JPEG Artifact Reduction
#### [AR-CNN] Deep Convolution Networks for Compression Artifacts Reduction <paper-button> <a href="http://mmlab.ie.cuhk.edu.hk/projects/ARCNN.html">Link</a> </paper-button>
### HEVC Intra
#### [VRCNN] A Convolutional Neural Network Approach for Post-Processing in HEVC Intra Coding <paper-button> <a href="https://arxiv.org/pdf/1608.06690.pdf"> Link</a> </paper-button>
### CNN-based HEVC In-loop filter
#### [IFCNN] CNN-based in-loop filtering for coding efficiency improvement <paper-button> <a href="http://ieeexplore.ieee.org/document/7528223/"> Link</a> </paper-button>
