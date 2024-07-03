FROM python:3.11-slim-bookworm

RUN python -m pip install --no-cache gunicorn autogenstudio

EXPOSE 8000

# CMD gunicorn -w $((2 * $(getconf _NPROCESSORS_ONLN) + 1)) --timeout 12600 -k uvicorn.workers.UvicornWorker autogenstudio.web.app:app --bind "0.0.0.0:8000"


CMD /bin/bash -c "autogenstudio ui --port 8000 --host 0.0.0.0 --appdir /opt/appdir "
