FROM timotto/ubuntu-compiler:14.04

ARG ptxdist=2014.12.0

WORKDIR /usr/src

RUN curl http://public.pengutronix.de/software/ptxdist/ptxdist-${ptxdist}.tar.bz2 | tar jx \
	&& cd ptxdist-${ptxdist} \
	&& ./autogen.sh \
	&& ./configure --prefix=/usr/local \
	&& make -j4 \
	&& make install \
	&& cd .. \
	&& rm -rf ptxdist-${ptxdist}

RUN useradd -ms /bin/bash user
