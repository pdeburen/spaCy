FROM python:3-onbuild
RUN apt-get -y update
RUN apt-get -y install \
    build-essential\
    python-dev \
    python-pip \
    git
RUN python -m pip install -U pip virtualenv
RUN git clone https://github.com/spacy-io/spaCy.git
RUN virtualenv .env
RUN /bin/bash -c "source .env/bin/activate"
RUN pip install -r spaCy/requirements.txt
RUN pip install -e spaCy/
RUN python -m spacy.de.download

