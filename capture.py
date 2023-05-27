# import the necessary packages
from deffcode import FFdecoder


# initialize and formulate the decoder with "0" index source for BGR24 output

ffparams = {
    "-vcodec": "h264_cuvid",  # use H.264 CUVID Video-decoder
    "-enforce_cv_patch": True # enable OpenCV patch for YUV(YUV420p) frames
}

# initialize and formulate the decoder with `foo.mp4` source
decoder = FFdecoder(
    "0",
    frame_format="yuv420p",  # use YUV420p frame pixel format
    verbose=True, # enable verbose output
    #**ffparams # apply various params and custom filters
).formulate()

# grab the BGR24 frames from decoder
for frame in decoder.generateFrame():

    # check if frame is None
    if frame is None:
        break
    print(frame.shape)



# terminate the decoder
decoder.terminate()
