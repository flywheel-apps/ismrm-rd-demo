#! /bin/bash
#
# Run spectroscopy-demo
#

CONTAINER="[flywheel/ismrm-rd-demo]"

# Built to flywheel-v0 spec
FLYWHEEL_BASE=/flywheel/v0

# Make sure that /output directory is empty (all content will be removed later).
OUTPUT_DIR=$FLYWHEEL_BASE/output
mkdir -p $OUTPUT_DIR

echo -e "$CONTAINER  Initiated"

if [[ ! -d "$OUTPUT_DIR" ]]
    then
        echo "$OUTPUT_DIR not found!"
        exit 1
fi

# TODO: Unzip this!!! move demo output to output dir
#mv $FLYWHEEL_BASE/*.hdf5.tgz $OUTPUT_DIR
tar xvzf $FLYWHEEL_BASE/*.hdf5.tgz -C $OUTPUT_DIR

# .metadata.json required to indicate gear completed successfully.
echo "{ "acquisition" : { "files" : [{ "name" : "ismrmrd_raw.hdf5",
        "info" : {
          "ismrmrdHeader": {
            "subjectInformation": {
              "patientName": "phantom",
              "patientWeight_kg": "70.3068"
            },
            "acquisitionSystemInformation": {
              "systemVendor": "SIEMENS",
              "systemModel": "Avanto",
              "systemFieldStrength_T": "1.494",
              "receiverChannels": "32",
              "relativeReceiverNoiseBandwidth": "0.79"
            },
            "experimentalConditions": {
              "H1resonanceFrequency_Hz": "63642459"
            },
            "encoding": {
              "trajectory": "cartesian",
              "encodedSpace": {
                "matrixSize": {
                  "x": "256",
                  "y": "140",
                  "z": "80"
                },
                "fieldOfView_mm": {
                  "x": "600",
                  "y": "328.153125",
                  "z": "160"
                }
              },
              "reconSpace": {
                "matrixSize": {
                  "x": "128",
                  "y": "116",
                  "z": "64"
                },
                "fieldOfView_mm": {
                  "x": "300",
                  "y": "271.875",
                  "z": "128"
                }
              },
              "encodingLimits": {
                "kspace_encoding_step_1": {
                  "minimum": "0",
                  "maximum": "83",
                  "center": "28"
                },
                "kspace_encoding_step_2": {
                  "minimum": "0",
                  "maximum": "45",
                  "center": "20"
                },
                "slice": {
                  "minimum": "0",
                  "maximum": "0",
                  "center": "0"
                },
                "set": {
                  "minimum": "0",
                  "maximum": "0",
                  "center": "0"
                }
              }
            },
            "parallelImaging": {
              "accelerationFactor": {
                "kspace_encoding_step_1": "1",
                "kspace_encoding_step_2": "1"
              },
              "calibrationMode": "other"
            },
            "sequenceParameters": {
              "TR": "4.6",
              "TE": "2.35",
              "TI": "300"
            }
          }
        }
      }
    ]
  }
}
" > $OUTPUT_DIR/.metadata.json

# Get a list of the files in the output directory
outputs=$(find $OUTPUT_DIR/* -maxdepth 0 -type f)

# If outputs exist, generate metadata, and exit
if [[ -z $outputs ]]
    then
        echo "$CONTAINER  No results found in output directory... Exiting"
        exit 1
    else
        cd $OUTPUT_DIR
        echo -e "$CONTAINER  Wrote: `ls`"
        echo -e "$CONTAINER  Done."
fi

exit 0
