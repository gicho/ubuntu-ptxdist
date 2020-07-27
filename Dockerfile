FROM ubuntu
RUN apt update && apt install -y --no-install-recommends libncurses5-dev gawk flex bison texinfo python-dev g++ dialog lzop autoconf libtool xmlstarlet xsltproc doxygen autopoint
RUN curl https://public.pengutronix.de/software/ptxdist/ptxdist-2016.06.0.tar.bz2 | tar jxf \
	&& cd ptxdist-2016.06.0 \
	&& ./autogen.sh \
	&& ./configure --prefix=/usr/local \
	&& make -j4 \
	&& make install \
	&& cd .. \
	&& rm -rf ptxdist-${ptxdist}

ADD ptxdist-root.patch /
RUN patch -Np1 < /ptxdist-root.patch
