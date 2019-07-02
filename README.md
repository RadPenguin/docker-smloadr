# docker-smloadr

Run SMLoadr interactively.

## Usage
```
mkdir config || true
touch config/SMLoadrConfig.json
touch config/downloadLinks.txt

docker run -it --rm  \
  --volume $( pwd )/config/SMLoadrConfig.json:/opt/smloadr/SMLoadrConfig.json \
  --volume $( pwd )/config/downloadLinks.txt:/opt/smloadr/downloadLinks.txt \
  --volume $( pwd )/downloads:/opt/smloadr/DOWNLOADS \
  radpenguin/smloadr
```

To run non-interactively, pass in any of the SMLoadr CLI parameters after `radpenguin/smloadr`:
```
docker run --rm  \
  --volume $( pwd )/config/SMLoadrConfig.json:/opt/smloadr/SMLoadrConfig.json \
  --volume $( pwd )/config/downloadLinks.txt:/opt/smloadr/downloadLinks.txt \
  --volume $( pwd )/downloads:/opt/smloadr/DOWNLOADS \
  radpenguin/smloadr \
  --quality FLAC \
  --downloadmode all
```
