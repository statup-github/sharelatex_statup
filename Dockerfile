# docker run -p 192.168.3.114:80:80 --name sharelatex-server-1 -v /mnt/Container\ Data/sharelatex/sharelatex-server-1-volume/var_lib_sharelatex:/var/lib/sharelatex -v /mnt/Gemeinsame\ Dokumente/Internes/Vorlagen/LaTeXStyles:/LaTeXStyles -e SHARELATEX_MONGO_URL=mongodb://mongo/sharelatex -e SHARELATEX_REDIS_HOST=redis -e SHARELATEX_SITE_URL=http://se-latex --link=mongo-sharelatex-1:mongo --link=redis-sharelatex-1:redis stefanfritsch/sharelatex_statup
FROM sharelatex/sharelatex
MAINTAINER Stefan Fritsch <stefan.fritsch@stat-up.com>

RUN tlmgr update --self 
RUN tlmgr install scheme-basic
RUN tlmgr install scheme-small
RUN tlmgr install scheme-context
RUN tlmgr install scheme-gust
RUN tlmgr install scheme-medium
# RUN tlmgr install scheme-xml
# RUN tlmgr install scheme-full

RUN tlmgr install lm pgf setspace koma-script paralist ms mdframed l3packages l3kernel etoolbox needspace adjustbox collectbox varwidth enumitem listings xcolor booktabs multirow threeparttable eurosym float ec babel-german import titlesec sectsty textpos environ xargs trimspaces

EXPOSE 80 443

WORKDIR /

ENTRYPOINT ["/sbin/my_init"]

