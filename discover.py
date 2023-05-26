# import the necessary packages
from deffcode import Sourcer
import json

# initialize and formulate the decoder
sourcer = Sourcer("0").probe_stream()

# enumerate probed devices as Dictionary object(`dict`)
print(sourcer.enumerate_devices)

# enumerate probed devices as JSON string(`json.dump`)
print(json.dumps(sourcer.enumerate_devices,indent=2))
