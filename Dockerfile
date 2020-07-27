FROM timotto/ubuntu-compiler:14.04

RUN curl http://public.pengutronix.de/software/ptxdist/ptxdist-2016.06.0.tar.bz2 | tar jx \
	&& cd ptxdist-2016.06.0 \
	&& ./autogen.sh \
	&& ./configure --prefix=/usr/local \
	&& make -j4 \
	&& make install \
	&& cd .. \
	&& rm -rf ptxdist-${ptxdist}

ADD ptxdist-root.patch /
RUN patch -Np1 < /ptxdist-root.patch
