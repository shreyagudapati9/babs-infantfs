
#!/bin/bash
docker run pwighton/neurodocker:latest generate docker \
    --base-image ubuntu:xenial \
    --pkg-manager apt \
    --yes \
    --niftyreg \
      version=master \
    --fsl \
      version=5.0.10 \
      method=binaries \
    --freesurfer \
      method=source \
      repo=https://github.com/freesurfer/freesurfer.git \
      branch=fs-7.4.1 \
      infant_module=ON \
      dev_tools=ON \
      infant_model_s3=s3://freesurfer-annex/infant/model/dev/ \
      infant_model_s3_region=us-east-2 \
    --entrypoint '/bin/infant-container-entrypoint-aws.bash' > "Dockerfile_ifs.txt"
#| docker build --no-cache -t shrgud/infant-fs-7.4.1 -