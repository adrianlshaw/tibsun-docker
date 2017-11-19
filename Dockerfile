FROM debian:jessie
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y --force-yes install x-window-system
RUN apt-get install -y mesa-utils
RUN apt-get install -y wine32 wget unrar-free
WORKDIR /opt
RUN wget http://download.fileplanet.com/ftp1/022010/OfficialCnCTiberianSun.rar && unrar OfficialCnCTiberianSun.rar
WORKDIR "/opt/EA Games/Command & Conquer The First Decade/Command & Conquer(tm) Tiberian Sun(tm)/SUN/"
RUN sed -i -e 's/ScreenWidth=800/ScreenWidth=1024/g' SUN.INI
RUN sed -i -e 's/ScreenHeight=600/ScreenWidth=768/g' SUN.INI
RUN sed -i -e 's/StretchMovies=no/AllowHiResModes=true/g' SUN.INI
RUN cat SUN.INI
ENTRYPOINT [ "wine32", "explorer", "/desktop=1024x768", "SUN.EXE" ]
