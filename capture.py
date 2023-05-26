# import the necessary packages
from deffcode import FFdecoder


# initialize and formulate the decoder with "0" index source for BGR24 output
decoder = FFdecoder("0", frame_format="bgr24", verbose=True).formulate()

# grab the BGR24 frames from decoder
for frame in decoder.generateFrame():

    # check if frame is None
    if frame is None:
        break
    print(frame.shape)



# terminate the decoder
decoder.terminate()
