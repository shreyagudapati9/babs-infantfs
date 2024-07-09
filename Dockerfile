# Base Image
FROM nipreps/nibabies:23.1.0

COPY run_ifs.py /run_ifs.py
RUN chmod +x /run_ifs.py
ENTRYPOINT ["/usr/local/freesurfer/python/bin/python3.8", "/run_ifs.py"]