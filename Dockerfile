FROM asciidoctor/docker-asciidoctor:latest

RUN dnf install -y asciidoc git && dnf clean packages
RUN git clone https://github.com/mojavelinux/asciidoc-blogpost.py.git /opt/asciidoc-blogpost.py
RUN asciidoc --backend install /opt/asciidoc-blogpost.py/conf/wordpress.zip
ENV PATH=/opt/asciidoc-blogpost.py:$PATH
ENTRYPOINT ["blogpost.py", "--asciidoc", "asciidoctor", "-u", "--conf-file", "blogpost", "post"]
CMD ["example.adoc"]
