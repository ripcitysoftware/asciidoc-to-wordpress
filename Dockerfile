FROM asciidoctor/docker-asciidoctor:latest

RUN apk update && apk upgrade && apk add --no-cache git asciidoc
RUN git clone https://github.com/mojavelinux/asciidoc-blogpost.py.git /opt/asciidoc-blogpost.py
RUN asciidoc --backend install /opt/asciidoc-blogpost.py/conf/wordpress.zip
ENV PATH=/opt/asciidoc-blogpost.py:$PATH

ENTRYPOINT ["blogpost.py", "--asciidoc", "asciidoctor", "-u", "--conf-file", "blog.conf", "post"]

# this is the default adoc file, you can override it by passing an argument to the docker container
CMD ["example.adoc"]
